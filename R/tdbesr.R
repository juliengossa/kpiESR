

set_encoding_utf8 <- function(df) {
  Encoding(names(df)) <- "UTF-8"
  for (col in colnames(df)){
    if(typeof(df[[col]]) == "character") {
      Encoding(df[[col]]) <- "UTF-8"
    }
  }
  return(df)
}


# select_kpis <- function(pattern){
#   grep(pattern, levels(esr.pnl$kpi),value=TRUE)
# }

kpiesr_pivot_norm_label <- function(esr, rentrée.ref=2012) {

  df <- esr %>%
    mutate(across(starts_with("kpi.FIN.S"), list(norm = ~ ./kpi.FIN.P.ressources))) %>%
    mutate(across(starts_with("kpi.BIA.S"), list(norm = ~ ./kpi.BIA.P.effectif))) %>%
    mutate(across(starts_with("kpi.ENS.S"), list(norm = ~ ./kpi.ENS.P.effectif))) %>%
    mutate(across(starts_with("kpi.ETU.S"), list(norm = ~ ./kpi.ETU.P.effectif))) %>%

    mutate(across(matches("kpi.....P"), list(norm = ~ .))) %>%
    mutate(across(starts_with("kpi.K"), list(norm = ~ .))) %>%
    rename_with(~ paste0(.,"_valeur"), matches("^kpi.*$") & !matches("^.*norm$")) %>%
    pivot_longer(
      cols = starts_with("kpi"),
      names_to = c("kpi", ".value"),
      names_pattern = "(.*)_(valeur|norm)"
    ) %>% 
    #filter(!is.na(valeur)) %>%
    mutate(kpi = as.factor(kpi)) %>%
    group_by(kpi) %>%
    mutate(
      valeur_label = valeur_labels(kpi,valeur),
      norm_label = norm_labels(kpi,norm)
    ) %>%
    group_by(Groupe, Rentrée, kpi) %>%
    mutate(
      rang = dense_rank(desc(norm))
      ) %>%
    ungroup()
  
  # merge(df, df %>% filter(Rentrée==rentrée.ref) %>% transmute(UAI=UAI, kpi=kpi, norm.ref = norm)) %>%
  #   group_by(UAI, kpi) %>%
  #   mutate( evolution = norm / norm.ref - 1) %>% 
  #   select(-norm.ref)
  
  df <- df %>% 
    filter(Rentrée >= rentrée.ref) %>%
    filter(!is.na(valeur)) %>%
    group_by(Groupe,UAI,kpi) %>%
    arrange(Groupe,UAI,kpi,Rentrée) %>%
    mutate( evolution = valeur / first(valeur) * 100 ) %>%
    ungroup()
  
}

#test <- kpiesr_pivot_norm_label(esr)


kpiesr_get_stats <- function(esr.pnl, rentrée.ref = 2013) {
  
  p <- c(0,0.25,0.5,0.75,1)
  p_names <- purrr::map_chr(p, ~paste0(.x*100))
  p_funs <-  purrr::map(p, ~purrr::partial(quantile, probs = .x, na.rm = TRUE)) %>% 
    purrr::set_names(nm = p_names)
  
  df <- esr.pnl %>%
    filter(Groupe != "Ensemble", Groupe != "Groupe") %>%
    group_by(UAI, kpi) %>% 
    filter(min(Rentrée)<=rentrée.ref) 
    
  df %>%
    group_by(Groupe,kpi,Rentrée) %>%
    summarise(Nombre = n()) %>%
    kableExtra::kable(., format="simple") %>%
    paste0(collapse = '\n') %>%
    message()

  bind_rows(
    group_by(df, Rentrée,Groupe,kpi) %>%
    summarise(
      across(c(norm, evolution), p_funs),
      Nombre = n()),
    group_by(df, Rentrée,kpi) %>%
    summarise(
      across(c(norm, evolution), p_funs),
      Nombre = n()) %>%
    mutate(Groupe = "Ensemble")
    ) %>%
    ungroup() %>%
    arrange(Groupe,kpi,Rentrée) %>%
    select(Groupe,kpi,Rentrée, starts_with("norm"), starts_with("evolution"))
  
}

#esr.stats <- kpiesr_get_stats(kpiESR::esr.pnl)



kpiesr_add_kpis <- function (df) {
  mutate(df,
    kpi.K.dotPres = kpi.FIN.S.SCSP / kpi.FIN.P.ressources ,
    kpi.K.resPetu = kpi.FIN.P.ressources / (kpi.ETU.S.cycle1_L+kpi.ETU.S.cycle2_M),
    kpi.K.forPetu = kpi.FIN.S.recettesFormation / kpi.ETU.P.effectif,
    kpi.K.recPect = kpi.FIN.S.recettesRecherche / kpi.ENS.S.EC,
    kpi.K.ensPetu = (kpi.ENS.S.titulaires + kpi.ENS.S.contractuels) / (kpi.ETU.S.cycle1_L+kpi.ETU.S.cycle2_M) * 100,
    #kpi.K.titPens = kpi.ENS.S.titulaires / kpi.ENS.P.effectif,
    kpi.K.titPper = (kpi.ENS.S.titulaires + kpi.BIA.S.titulaires) / (kpi.ENS.P.effectif + kpi.BIA.P.effectif),
    kpi.K.biaPper = kpi.BIA.P.effectif / (kpi.BIA.P.effectif + kpi.ENS.P.effectif)

    #kpi.K.selPfor = kpi.ADM.S.sélective / kpi.ADM.P.formations,
    #kpi.K.2.resPens = kpi.FIN.P.ressources / kpi.ENS.P.effectif,
    #kpi.K.4.docPec  = kpi.ETU.S.cycle.3.D / kpi.ENS.S.2.ECtitulaires,
  ) 
}

kpiesr_get_uaisnamedlist <- function(esr) {
  esr.uais <- list()
  for(type in levels(esr$Type)) {
    df <- subset(esr, Type == type, c(UAI,Libellé)) %>% unique
    esr.uais[[type]] <- as.list(setNames(as.character(df$UAI),as.character(df$Libellé)))
    Encoding(names(esr.uais[[type]])) <- "UTF-8"
  }
  Encoding(names(esr.uais)) <- "UTF-8"
  return(esr.uais)
}


kpiesr_ETL_and_save <- function(etab, esr, esr.uais, rentrée.ref=2013) {

  esr.ensemble <- esr %>% 
    group_by(Rentrée) %>%
    summarise(across(starts_with("kpi"), ~ sum(.x,na.rm = TRUE))) %>%
    na_if(0) %>%
    mutate(Groupe = "Ensemble", UAI="Ensemble", Etablissement="Ensemble")

  esr.groupe <- esr %>% 
    filter(UAI %in% esr.uais$dans.evol) %>%
    group_by(Rentrée, Groupe) %>%
    summarise(across(starts_with("kpi"), ~ sum(.x,na.rm = TRUE))) %>%
    na_if(0) %>%
    mutate(UAI=Groupe, Etablissement=Groupe, Groupe="Groupe")
  
  esr <- bind_rows(esr,esr.groupe,esr.ensemble) 

  esr <- kpiesr_add_kpis(esr)
  esr <- set_encoding_utf8(esr)

  esr.pnl <- kpiesr_pivot_norm_label(esr, rentrée.ref)
  esr.pnl <- set_encoding_utf8(esr.pnl)
  
  esr.stats <- kpiesr_get_stats(
    esr.pnl %>% filter(UAI %in% esr.uais$dans.evol), 
    rentrée.ref)
  
  esr.etab <- etab
  
  write.csv2(esr,"tdbesr.csv",row.names = FALSE)
  usethis::use_data(esr, esr.pnl, esr.stats, esr.etab, esr.uais, overwrite = TRUE)
}

kpiesr_load <- function(...) {
  load("tdbesr.RData",...)
  esr <- esr
  esr.pnl <- esr.pnl
}

# kpiesr_fusion <- function(uais) {
#   df <- kpiESR::esr %>% filter(UAI %in% uais)
# 
#   info <- df %>%
#     group_by(Rentrée) %>%
#     summarise(
#       UAI = paste(uais,collapse=('_')),
#       Libellé = paste(unique(df$Libellé),collapse=('_')),
#       Sigle = paste(unique(df$Sigle),collapse=('_')),
#       Type = first(df$Type),
#       Type.détaillé = first(df$Type.détaillé),
#       Académie = first(df$Académie),
#       Rattachement = NA,
#       url.sitewe = NA,
#       url.wikidata = NA,
#       url.legifrance = NA
#     )
# 
#   kpis <- df %>%
#     group_by(Rentrée) %>%
#     summarise_at(vars(starts_with("kpi")), ~sum(.))
# 
#   merge(info,kpis) %>% kpiesr_add_kpis
# }




#kpiesr_plot_tdb(2017,uai)


kpiesr_classement <- function(rentrée, rentrée.deb, groupe, kpis, labels=NA, historique=c()) {
  
  classement <- kpiESR::esr %>%
    filter(Rentrée %in% c(rentrée,rentrée.deb), Groupe == groupe, UAI %in% esr.uais$dans.tdb) %>%
    select(Etablissement, Rentrée, all_of(kpis)) %>%
    group_by(Rentrée) %>% mutate(rang = rank(-!!as.name(kpis[[1]]), na.last = "keep")) %>%
    #pivot_wider(Etablissement, values_from=starts_with("kpi"), names_from = Rentrée) %>%
    group_by(Etablissement) %>% arrange(rentrée) %>% 
    mutate(rang.deb = ifelse(first(Rentrée)==rentrée.deb,first(rang),NA)) %>%
    mutate(evolution = sprintf("(%+3d)", rang.deb - rang)) %>%
    filter(Rentrée == rentrée) %>%
    ungroup() %>% arrange(rang) %>%
    mutate(across(starts_with("kpi"), ~ valeur_labels_long(cur_column(),.x))) %>%
    select(rang, Etablissement, starts_with("kpi"), rang.deb, evolution)

  return(classement)
}

# kpiesr_classement(2019,2013, "Universités et assimilés",
#                  c("kpi.K.dotPres","kpi.FIN.P.ressources","kpi.FIN.S.SCSP"))


#
# kpiesr_classement(rentrée, "Université",
#                   c("kpi.K.proPres",
#                     "kpi.FIN.P.ressources",
#                     "kpi.FIN.S.ressourcesPropres"),
#                   c("Taux","Res.","Res. Propres"),
#                   seq(2012,2016))



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
    mutate(across(starts_with("kpi.ENS.S"), list(norm = ~ ./kpi.ENS.P.effectif))) %>%
    mutate(across(starts_with("kpi.ETU.S"), list(norm = ~ ./kpi.ETU.P.effectif))) %>%

    mutate(across(matches("kpi.....P"), list(norm = ~ .))) %>%
    mutate(across(starts_with("kpi.K"), list(norm = ~ .))) %>%
    rename_with(~ paste0(.,"_valeur"), matches("kpi.[^_]*$")) %>%
    pivot_longer(
      cols = starts_with("kpi"),
      names_to = c("kpi", ".value"),
      names_pattern = "(.*)_(valeur|norm)"
    ) %>% 
    filter(!is.na(valeur)) %>%
    mutate(
      kpi = as.factor(kpi),
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
    group_by(Groupe,UAI,kpi) %>%
    arrange(Groupe,UAI,kpi,Rentrée) %>%
    mutate( evolution = norm / first(norm) * 100 ) %>%
    ungroup()
  
}

#test <- kpiesr_pivot_norm_label(esr)


kpiesr_get_stats <- function(esr.pnl) {
  
  p <- c(0,0.25,0.5,0.75,1)
  p_names <- purrr::map_chr(p, ~paste0(.x*100))
  p_funs <-  purrr::map(p, ~purrr::partial(quantile, probs = .x, na.rm = TRUE)) %>% 
    purrr::set_names(nm = p_names)
  
  merge(
    esr.pnl %>%
      group_by(Rentrée,Type,kpi) %>%
      summarise_at(vars(norm, norm_y, evolution), p_funs),
    esr.pnl %>%
      group_by(Rentrée,Type,kpi) %>%
      summarise(
        norm_moy = mean(norm),
        nombre = n())
    ) %>% 
    ungroup() %>%
    mutate_at(vars(matches("norm_[^y]")), list( label = ~ norm_labels(kpi,.)))
}

#kpiesr_get_stats(esr.pnl)



kpiesr_add_kpis <- function (df) {
  mutate(df,
    kpi.K.dotPres = kpi.FIN.S.SCSP / kpi.FIN.P.ressources ,
    kpi.K.resPetu = kpi.FIN.P.ressources / (kpi.ETU.S.cycle1_L+kpi.ETU.S.cycle2_M),
    kpi.K.forPetu = kpi.FIN.S.recettesFormation / kpi.ETU.P.effectif,
    kpi.K.recPect = kpi.FIN.S.recettesFormation / kpi.ENS.S.ECtitulaires,
    kpi.K.titPetu = kpi.ENS.S.ECtitulaires / kpi.ETU.P.effectif * 100,
    kpi.K.titPens = kpi.ENS.S.titulaires / kpi.ENS.P.effectif,

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


kpiesr_ETL_and_save <- function(etab, ens, etu, fin) {

  esr.raw <- fin %>% rename(Etablissement.FIN = Etablissement, Type.FIN = Type) %>%
    full_join(ens %>% rename(Etablissement.ENS = Etablissement, Type.ENS = Type)) %>%
    full_join(etu %>% rename(Etablissement.ETU = Etablissement, Type.ETU = Type)) %>%
    select(Groupe,UAI,Rentrée,starts_with("Etablissement"),starts_with("Type"), everything())
  
  esr.ensemble <- esr.raw %>% 
    group_by(Rentrée) %>%
    summarise(across(starts_with("kpi"), ~ sum(.x,na.rm = TRUE))) %>%
    na_if(0) %>%
    mutate(Groupe = "Ensemble", UAI="Ensemble", Etablissement="Ensemble")

  esr.groupe <- esr.raw %>% 
    group_by(Rentrée, Groupe) %>%
    summarise(across(starts_with("kpi"), ~ sum(.x,na.rm = TRUE))) %>%
    na_if(0) %>%
    mutate(UAI=Groupe, Etablissement=Groupe, Groupe="Groupe")
  
  esr <- bind_rows(
    left_join(etab %>% select(Groupe,UAI,Etablissement), 
              esr.raw %>% select(UAI,Rentrée,starts_with("kpi"))),
    esr.groupe,
    esr.ensemble
    ) %>%
    mutate(Groupe = factor(Groupe,levels=c(levels(etab$Groupe),"Groupe","Ensemble")))

  esr <- kpiesr_add_kpis(esr)
  esr <- set_encoding_utf8(esr)

  esr.pnl <- kpiesr_pivot_norm_label(esr)
  esr.pnl <- set_encoding_utf8(esr.pnl)

  #esr.uais <- kpiesr_get_uaisnamedlist(esr)

  write.csv2(esr,"tdbesr.csv",row.names = FALSE)
  usethis::use_data(etab, esr, esr.pnl, esr.raw, overwrite = TRUE)
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



#' Title
#'
#' @param rentr
#' @param uai
#' @param style.kpi.k
#' @param style.kpi
#'
#' @return
#' @export
#'
#' @examples
kpiesr_plot_all <- function(rentrée, uai,
                            style.kpi.k=kpiesr_style(),
                            style.kpi=kpiesr_style(),
                            lfc = kpiesr_lfc,
                            adm = FALSE,
                            ...) {

  if(adm) {
    k.norm.index <- "K_ADM"
    zooms.abs <- c(0.5, 0.5, 1, 1, 0.5,  1)
    zooms.evol <- c(0.6, 0.6, 0.4, 0.15, 0.15,  1)
  }
  else {
    k.norm.index <- "K"
    zooms.abs <- c(0.5, 0.5, 1, 0.5,  1)
    zooms.evol <- c(0.6, 0.6, 0.15, 0.15,  1)
  }

  style.abs <- style.kpi
  style.abs$x_scale = TRUE

  plots <- list(
    k.norm = kpiesr_plot_norm(rentrée, uai, lfc[[k.norm.index]],
                              norm.valeurs=FALSE, omit.first = FALSE,
                              style=style.kpi.k, ...),
    k.evol.abs = kpiesr_plot_evol_all(rentrée, uai, peg.args,
                                      yzooms = zooms.abs,
                                      plot.type="abs",
                                      style = style.abs),
    k.evol.norm = kpiesr_plot_evol_all(rentrée, uai, peg.args,
                                      yzooms = zooms.evol,
                                      plot.type="norm",
                                      style = style.kpi),

    absnorm = list(
      etu.abs = kpiesr_plot_primaire(rentrée,uai,lfc[["ETU"]], style=style.kpi, ...),
      etu.norm = kpiesr_plot_norm(rentrée,uai,lfc[["ETU"]], style=style.kpi,...),

      ens.abs = kpiesr_plot_primaire(rentrée,uai,lfc[["ENS"]], style=style.kpi,...),
      ens.norm = kpiesr_plot_norm(rentrée,uai,lfc[["ENS"]], style=style.kpi,...),

      fin.abs = kpiesr_plot_primaire(rentrée,uai,lfc[["FIN"]], style=style.kpi,...),
      fin.norm = kpiesr_plot_norm(rentrée,uai,lfc[["FIN_N"]], style=style.kpi,...)
      )
  )

  if(adm)
    plots$absnorm <- append(plots$absnorm, c(
      adm.abs = kpiesr_plot_primaire(rentrée,uai,lfc[["ADM"]], style=style.kpi,...),
      adm.norm = kpiesr_plot_norm(rentrée,uai,lfc[["ADM"]], style=style.kpi,...)
    ))

  return(plots)
}


#' Title
#'
#' @param rentr
#' @param uai
#' @param big_style
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
kpiesr_plot_tdb <- function(rentrée, uai,
                            style.kpi.k=kpiesr_style(),
                            style.kpi=kpiesr_style(), ...) {

  plots <- kpiesr_plot_all(rentrée, uai, style.kpi.k, style.kpi,...)

  pg <-
    plot_grid(ncol = 1, rel_heights = c(1,1),
              plot_grid(ncol=1, rel_heights = c(2,1,1), #align = "v",
                plots$k.norm,
                plot_grid(plotlist = plots$k.evol.abs, nrow=1, align = "hv"),
                plot_grid(plotlist = plots$k.evol.norm, nrow=1, align = "hv")
                ),
              plot_grid (ncol = 2, align = "v", plotlist = plots$absnorm)
    )

  return(pg)

}

#kpiesr_plot_tdb(2017,uai)



#' Title
#'
#' @param rentr
#' @param type
#' @param kpis
#' @param labels
#'
#'
#' @return
#' @export
#'
#' @examples
kpiesr_classement <- function(rentrée, type, kpis, labels=NA, historique=c()) {

  classement <- kpiESR::esr.pnl %>%
    ungroup() %>%
    filter(Rentrée == rentrée, Type == type, kpi %in% kpis) %>%
    select(Libellé, kpi,valeur_label, norm_label, rang) %>%
    mutate(kpi = factor(kpi,levels=kpis)) %>% arrange(kpi,rang) %>%
    pivot_wider(names_from = kpi, values_from = c(valeur_label,norm_label,rang)) %>%
    merge(
      kpiESR::esr.pnl %>%
        ungroup() %>%
        filter(Rentrée %in% historique, Type == type, kpi %in% kpis[1]) %>%
        select(Libellé, Rentrée,valeur_label) %>%
        pivot_wider(names_from = Rentrée, values_from = valeur_label)
    ) %>%
    select(paste0("rang_",kpis[1]), paste0("norm_label_",kpis[1]),
           Libellé,
           paste0("valeur_label_",kpis),
           as.character(historique)
           ) %>%
    arrange(!!sym(paste0("rang_",kpis[1])))

  if(!is.na(labels))
    classement <- setNames(classement, c("Rang","Ecart", "Libellé", labels, as.character(historique)))

  return(classement)
}



# kpiesr_classement(rentrée, "Université",
#                  c("kpi.K.resPetu", "kpi.FIN.P.ressources", "kpi.ETU.S.cycle.1.L", "kpi.ETU.S.cycle.2.M"),
#                  c("Ressources par étudiant","Ressources","Effectif L","Effectif M"),
#                  seq(2012,2016))
#
# kpiesr_classement(rentrée, "Université",
#                   c("kpi.K.proPres",
#                     "kpi.FIN.P.ressources",
#                     "kpi.FIN.S.ressourcesPropres"),
#                   c("Taux","Res.","Res. Propres"),
#                   seq(2012,2016))


select_kpis <- function(pattern){
  grep(pattern, levels(esr.pnl$kpi),value=TRUE)
}

kpiesr_pivot_norm_label <- function() {

  esr %>%
    group_by(Type,Rentrée) %>%
    select(Type,Rentrée,UAI,Libellé,Curif,starts_with("kpi.")) %>%
    #rename_at(vars(starts_with("kpi")), list( ~ paste(.,"value",sep="_"))) %>%

    mutate_at(vars(starts_with("kpi.FIN.S")), list(norm = ~ ./kpi.FIN.P.ressources)) %>%
    mutate_at(vars(starts_with("kpi.ENS.S")), list(norm = ~ ./kpi.ENS.P.effectif)) %>%
    mutate_at(vars(starts_with("kpi.ETU.S")), list(norm = ~ ./kpi.ETU.P.effectif)) %>%
    mutate_at(vars(starts_with("kpi.ADM.S")), list(norm = ~ ./kpi.ADM.P.formations)) %>%
    #mutate_at(vars(matches("kpi.*_norm")), list( ~ (./mean(.,na.rm=TRUE))-1)) %>%
    mutate_at(vars(matches("kpi.(FIN|ENS|ETU|ADM).P")), list(norm = ~ (./mean(.,na.rm=TRUE))-1)) %>%
    mutate_at(vars(starts_with("kpi.K")), list(norm = ~ (./mean(.,na.rm=TRUE))-1)) %>%
    rename_at(vars(matches("kpi.[^_]*$")), list( ~paste(.,"value",sep="_"))) %>%
    pivot_longer(
      cols = -c(Type,Rentrée,UAI,Libellé,Curif),
      names_to = c("kpi", ".value"),
      names_sep = "_"
    ) %>%
    #filter(!is.na(value)) %>%
    mutate(
      kpi = as.factor(kpi),
      value_label = value_labels(kpi,value),
      norm_label = norm_labels(kpi,norm)
    ) %>%
    group_by(Rentrée, Type, kpi) %>%
    mutate(rang = dense_rank(desc(norm))) %>%
    ungroup()
}


kpiesr_add_kpis <- function (df) {
  mutate(df,
    kpi.K.proPres = kpi.FIN.S.ressourcesPropres / kpi.FIN.P.ressources ,
    kpi.K.resPetu = kpi.FIN.P.ressources / (kpi.ETU.S.cycle.1.L+kpi.ETU.S.cycle.2.M),
    kpi.K.selPfor = kpi.ADM.S.sélective / kpi.ADM.P.formations,
    kpi.K.titPetu = kpi.ENS.S.titulaires / kpi.ETU.P.effectif * 100,
    kpi.K.titPens = kpi.ENS.S.ECtitulaires / kpi.ENS.P.effectif,

    #kpi.K.2.resPens = kpi.FIN.P.ressources / kpi.ENS.P.effectif,
    #kpi.K.4.docPec  = kpi.ETU.S.cycle.3.D / kpi.ENS.S.2.ECtitulaires,
  )
}

kpiesr_get_uaisnamedlist <- function(esr) {
  uais <- list()
  for(type in levels(esr$Type)) {
    df <- subset(esr, Type == type, c(UAI,Libellé)) %>% unique
    uais[[type]] <- as.list(setNames(as.character(df$UAI),as.character(df$Libellé)))
  }

  return(uais)
}

kpiesr_data_infos <- function(df,name="Anon") {
  if(! "Rentrée" %in% colnames(df)) df$Rentrée <- NA
  if(! "Type" %in% colnames(df)) df$Type <- NA

  message("Informations sur ",name)
  message("Période des données : ",range(levels(df$Rentrée)))
  message("Nombre d'établissements :",
          paste0(capture.output(
            df %>%
              group_by(Rentrée, Type) %>%
              summarise(compte = n()) %>%
              arrange(desc(Rentrée))
            ), collapse = "\n")
          )
}



kpiesr_ETL_and_save <- function() {
  # source("fr-esr-principaux-etablissements-enseignement-superieur.R",local = TRUE)
  # source("fr-esr-operateurs-indicateurs-financiers.R",local = TRUE)
  # source("fr-esr-enseignants-X-esr-public.R",local = TRUE)
  # source("fr-esr-statistiques-sur-les-effectifs-d-etudiants-inscrits-par-etablissement.R",local = TRUE)
  # source("fr-esr-parcoursup.R",local = TRUE)

  etab <- kpiesr_read.etab()
  kpiesr_data_infos(etab,"etab")
  fin <- kpiesr_read.fin()
  kpiesr_data_infos(fin,"FIN")
  ens <- kpiesr_read.ens()
  kpiesr_data_infos(ens,"ENS")
  etu <- kpiesr_read.etu()
  kpiesr_data_infos(etu,"ETU")
  adm <- kpiesr_read.adm()
  kpiesr_data_infos(adm,"ADM")

  esr <- fin %>%
    full_join(ens) %>%
    full_join(etu) %>%
    full_join(adm) %>%
    full_join(etab) %>%
    filter(!is.na(Rentrée))

  warning(paste0(
    esr %>% filter(is.na(Libellé)) %>% select(UAI) %>% unique() %>% nrow(),
    " UAIs n'ont pas de libellé (absence du jeu de données des établissements)"))

  kpiesr_missingunivs <<- etab %>%
    filter(Type == "Université", ! UAI %in% esr[Type == "Université",]$UAI) %>%
    select(UAI,Libellé)

  warning("Universités manquantes dans le jeu de données final :\n",
          capture.output(kpiesr_missingunivs), collapse = "\n")


  esr <- esr %>%
    filter(!is.na(Libellé)) %>%
    kpiesr_add_kpis()

  kpiesr_data_infos(esr,"ESR")


  write.csv2(esr,"tdbesr.csv",row.names = FALSE)

  esr.pnl <- kpiesr_pivot_norm_label()

  esr.uais <- kpiesr_get_uaisnamedlist(esr)

  #save(esr, esr.pnl, file = "tdbesr.RData")
  usethis::use_data(esr, esr.pnl, esr.uais, overwrite = TRUE)
}

kpiesr_load <- function(...) {
  load("tdbesr.RData",...)
  esr <<- esr
  esr.pnl <<- esr.pnl
}

kpiesr_fusion <- function(uais) {
  df <- esr %>% filter(UAI %in% uais)

  info <- df %>%
    group_by(Rentrée) %>%
    summarise(
      UAI = paste(uais,collapse=('_')),
      Libellé = paste(unique(df$Libellé),collapse=('_')),
      Sigle = paste(unique(df$Sigle),collapse=('_')),
      Type = first(df$Type),
      Type.détaillé = first(df$Type.détaillé),
      Académie = first(df$Académie),
      Rattachement = NA,
      url.sitewe = NA,
      url.wikidata = NA,
      url.legifrance = NA
    )

  kpis <- df %>%
    group_by(Rentrée) %>%
    summarise_at(vars(starts_with("kpi")), ~sum(.))

  merge(info,kpis) %>% kpiesr_add_kpis
}



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
                              norm.values=FALSE, omit.first = FALSE,
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

  classement <- esr.pnl %>%
    ungroup() %>%
    filter(Rentrée == rentrée, Type == type, kpi %in% kpis) %>%
    select(Libellé, kpi, value_label, norm_label, rang) %>%
    mutate(kpi = factor(kpi,levels=kpis)) %>% arrange(kpi,rang) %>%
    pivot_wider(names_from = kpi, values_from = c(value_label,norm_label,rang)) %>%
    merge(
      esr.pnl %>%
        ungroup() %>%
        filter(Rentrée %in% historique, Type == type, kpi %in% kpis[1]) %>%
        select(Libellé, Rentrée, value_label) %>%
        pivot_wider(names_from = Rentrée, values_from = value_label)
    ) %>%
    select(paste0("rang_",kpis[1]), paste0("norm_label_",kpis[1]),
           Libellé,
           paste0("value_label_",kpis),
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

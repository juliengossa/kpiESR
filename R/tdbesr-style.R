

euro_M <- function(x) {
  return(scales::dollar(x, prefix="",suffix=" M€", scale = 1/1000000, largest_with_cents = 1, big.mark = " "))
}

euro_k <- function(x) {
  return(paste0(round(x/1000,1),"k€"))
}

euro <- function(x) {
  return(paste0(round(x,0),"€"))
}

percent_format <- function(x) {
  sprintf("%+0.1f%%", round(x*100,1))
}

number_format <- function(x) {
  format(round(x), big.mark=" ", trim=TRUE)
}

hack_label <- function(x) {
  case_when(
    x<=1 ~ scales::percent(x,accuracy = 1),
    x<=100 ~ format(x,digits=3, nsmall=1, scientific = FALSE),
    x<=2000 ~ euro(x),
    TRUE ~ euro_k(x)
  )
}

valeur_labels <- function(kpi, valeur) {
  case_when(
    is.na(valeur) ~ "N/A",
    kpi == "kpi.K.dotPres"  ~ scales::percent(valeur, accuracy = 1),
    kpi == "kpi.K.forPetu"  ~ euro(valeur),
    kpi == "kpi.K.recPect"  ~ euro_k(valeur),
    kpi == "kpi.K.resPetu"  ~ euro_k(valeur),
    kpi == "kpi.K.selPfor"  ~ scales::percent(valeur, accuracy = 1),
    kpi == "kpi.K.ensPetu"  ~ as.character(round(valeur, 1)),
    kpi == "kpi.K.titPens"  ~ scales::percent(valeur, accuracy = 1),
    str_detect(kpi,"kpi.FIN") ~ euro_M(valeur),
    TRUE                    ~ number_format(valeur)
  )
}

norm_labels <- function(kpi, norm) {
  case_when(
    is.na(norm) ~ "N/A",
    str_detect(kpi,"kpi.....S") ~ scales::percent(norm, accuracy = 1),
    TRUE                    ~ valeur_labels(kpi, norm))
}

omit_first <- function(lfc) {
  lfc$factors <- lfc$factors[-1]
  lfc$labels  <- lfc$labels[-1]
  lfc$desc    <- lfc$desc[-1]
  
  return(lfc)  
}

#' Title
#'
#' @param point_size
#' @param line_size
#' @param text_size
#' @param primaire_plot.margin
#' @param bp_width
#' @param bp_text_x
#' @param palette
#'
#' @return
#' @export
#'
#' @examples
kpiesr_style <- function(
              point_size = 20,
              line_size = 1,
              text_size = 5,
              point_alpha = 1,
              label_wrap = 15,
              primaire_margin = 1.15,
              primaire_plot.margin = ggplot2::unit(c(0.5,0,0,0), "cm"),
              bp_style = "beeswarm",
              bp_width = 1,
              bp_text_x = -0.25,
              bp_alpha = 0.8,
              bp_color = "grey",
              evol_linear = TRUE,
              evol_fill = "gray95",
              kvt_style = "circle",
              kvt_point_pos = NA,
              kvt_alpha = 0.5,
              kvt_scale_text_y = 0.1,
              kvt_scale_text_size = 3,
              kvt_scale_point_size = 2,
              kvt_guide_bg_size = 30,
              kvt_plot.margin = ggplot2::unit(c(0,0,0,0), "cm"),
              kvt_min_y = -0.25,
              kvt_max_y = 1.3,
              palette = "Set2",
              x_scale = TRUE,
              x_scale_pos = "bottom",
              y_scale = TRUE,
              grid = FALSE,
              title = FALSE,
              plotly = FALSE) {
  return(
    as.list(environment())
    )
}


colblues   <- rev(RColorBrewer::brewer.pal(6, "Blues"))
colgreens  <- rev(RColorBrewer::brewer.pal(6, "Greens"))
coloranges <- rev(RColorBrewer::brewer.pal(7, "Oranges"))
colpurples <- rev(RColorBrewer::brewer.pal(6, "Purples"))
colrdbu <- RColorBrewer::brewer.pal(8, "RdBu")[c(1:3,6:8)]

kpiesr_lfc <- list(
  ETU = list(
    labels   = c("Etudiants", 
                 "Cycle 1 (L)", 
                 "Cycle 2 (M)", 
                 "Cycle 3 (D)", 
                 "DU"),
    factors  = c("kpi.ETU.P.effectif", 
                 "kpi.ETU.S.cycle1_L", 
                 "kpi.ETU.S.cycle2_M", 
                 "kpi.ETU.S.cycle3_D", 
                 "kpi.ETU.S.DU_DE"),
    colors   = colgreens[1:5],
    y_labels = number_format,
    desc     = c("Effectif total étudiant (Hors double inscription CPGE)",
                 "Effectif étudiant inscrit en premier cycle (L, DUT, etc.)",
                 "Effectif étudiant inscrit en deuxième cycle (M)",
                 "Effectif étudiant inscrit en troisième cycle (Doctorat, HDR)",
                 "Effectif étudiant inscrit en diplôme d'établissement (DU, non-national)")
  ),
  ENS = list(
    labels   = c("Enseignants", 
                 "Titulaires",
                 "EC",
                 "Doc et ATER",
                 "LRU et Associés"),
    factors  = c("kpi.ENS.P.effectif", 
                 "kpi.ENS.S.titulaires", 
                 "kpi.ENS.S.ECtitulaires", 
                 "kpi.ENS.S.DocATER", 
                 "kpi.ENS.S.LRU"),
    colors   = colblues[1:5],
    y_labels = identity,
    desc     = c("Effectif total enseignant",
                 "Effectif enseignant titulaire",
                 "Effectif enseignant-chercheur titulaire",
                 "Effectif doctorant et ATER",
                 "Effectif contrat LRU et Associés/Invités")
  ),
  FIN = list(
    labels   = c("Ressources",
                 "Masse salariale",
                 "SCSP",
                 "Recettes formation",
                 "Recettes recherche"),
    factors  = c("kpi.FIN.P.ressources", 
                 "kpi.FIN.S.masseSalariale", 
                 "kpi.FIN.S.SCSP", 
                 "kpi.FIN.S.recettesFormation", 
                 "kpi.FIN.S.recettesRecherche"),
    colors   = coloranges[1:6],
    y_labels = euro_M,
    desc     = c("Ressources totales (produits encaissables)",
                 "Masse salariale (dépenses de personnels)",
                 "Subvention pour charge de service public (dotation d'Etat directe)",
                 "Droits d'inscription, Diplôme d'établissement, Formation continue, VAE et Taxe d'apprentissage",
                 "Valorisation, ANR en et hors investissement d'avenir, contrats et prestations de recherche")
  ),
  K = list(
    labels   = c("Taux de titularité",
                 "Taux de SCSP",
                 "Taux d'encadrement", 
                 "Ressources par étudiant",
                 "Recetttes formation par étudiant",
                 "Recettes recherche par EC"),
    factors  = c("kpi.K.titPens",
                 "kpi.K.dotPres",
                 "kpi.K.ensPetu",
                 "kpi.K.resPetu",
                 "kpi.K.forPetu",
                 "kpi.K.recPect"),
    colors   = colrdbu, #c(coloranges[1],coloranges[4],coloranges[1],colgreens[5],coloranges[5],colblues[5]),
    y_labels = identity,
    desc     = c("Part des titulaires dans les enseignants",
                 "Part des Subventions pour charge de service public dans les ressources",
                 "Nombre d'enseignants titulaires pour 100 étudiants",
                 "Ressources divisées par le nombre d'étudiants",
                 "Recettes formation divisées par le nombre d'étudiants",
                 "Recettes recherche divisées par le nombre d'enseignants-chercheurs titulaires")
  )
)

peg.args <- list(
  list(kpiesr_lfc$K, 1, y_labels = scales::percent),
  list(kpiesr_lfc$K, 2, y_labels = euro_k         ),
  list(kpiesr_lfc$K, 3, y_labels = identity       ),
  list(kpiesr_lfc$K, 4, y_labels = scales::percent))


kpiesr_theme <-
  ggthemes::theme_excel_new() + ggplot2::theme(
    axis.title = ggplot2::element_blank(),
    panel.grid.major.x = ggplot2::element_blank()
  )

kpiesr_plot_missingdata <-
  ggplot(data.frame(c(x=1))) +
    geom_text(x=0.5,y=0.5, label="Données\nmanquantes") + kpiesr_theme

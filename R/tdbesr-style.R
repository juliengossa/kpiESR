
scale_breaker <- function(x) {
  smax <- c(105,110,120,150,200,300,400)
  smin <- c(95,90,80,50,0)
  max <- max(smax[smax < max(x)])
  min <- min(smin[smin > min(x)])
  return(c(min,100,max))
}

scale_100_breaker <- function(x) {
  return(c(100))
}

scale_min_breaker <- function(x) {
  x <- ceiling(min(x,na.rm=TRUE))
  x <- x[x != 0]
  return(x)
}



euro_M <- function(x) {
  case_when(
    x < 1e6 ~ paste0(round(x/1e6,2),"M€"),
    x < 20e6 ~ paste0(round(x/1e6,1),"M€"),
    x > 10e9 ~ paste0(round(x/1e9,1),"Md€"),
    x > 1e9 ~ paste0(round(x/1e9,2),"Md€"),
    TRUE ~ paste0(round(x/1e6,0),"M€"))
}

euro_k <- function(x) {
  sprintf("%1.0fk€",x/1e3)
}

euro <- function(x) {
  sprintf("%1.0f€",x)
}

percent_format <- function(x) {
  sprintf("%+1.1f%%", round(x*100,1))
}

number_format <- function(x) {
  format(round(x), big.mark=" ", trim=TRUE)
}

hack_label <- function(x) {
  case_when(
    x<=1 ~ scales::percent(x,accuracy = 1),
    x<=100 ~ format(x,digits=3, nsmall=1, scientific = FALSE),
    #x<=2000 ~ euro(x),
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
    kpi == "kpi.K.ensPetu"  ~ sprintf("%1.1f",valeur),
    kpi == "kpi.K.titPens"  ~ scales::percent(valeur, accuracy = 1),
    kpi == "kpi.K.titPper"  ~ scales::percent(valeur, accuracy = 1),
    kpi == "kpi.K.biaPper"  ~ scales::percent(valeur, accuracy = 1),
    str_detect(kpi,"kpi.FIN") ~ euro_M(valeur),
    TRUE                    ~ number_format(valeur)
  )
}

valeur_labels_long <- function(kpi, valeur) {
  case_when(
    is.na(valeur) ~ "N/A",
    kpi == "kpi.K.dotPres"  ~ scales::percent(valeur, accuracy = 0.1, suffix=" %"),
    kpi == "kpi.K.forPetu"  ~ sprintf("%1.0f €",valeur),
    kpi == "kpi.K.recPect"  ~ sprintf("%1.1f k€",valeur/1e3),
    kpi == "kpi.K.resPetu"  ~ sprintf("%1.1f k€",valeur/1e3),
    kpi == "kpi.K.ensPetu"  ~ sprintf("%1.1f",valeur),
    kpi == "kpi.K.titPens"  ~ scales::percent(valeur, accuracy = 0.1, suffix=" %"),
    kpi == "kpi.K.titPper"  ~ scales::percent(valeur, accuracy = 0.1, suffix=" %"),
    kpi == "kpi.K.biaPper"  ~ scales::percent(valeur, accuracy = 0.1, suffix=" %"),
    str_detect(kpi,"kpi.FIN") ~ sprintf("%1.1f M€",valeur/1e6),
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
              evol_text = TRUE,
              evol_text_percent = FALSE,
              evol_y_breaker = scale_breaker,
              bs_point_size = 1,
              strip_labeller = identity,
              yaxis_position = "left",
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


colblues   <- rev(RColorBrewer::brewer.pal(9, "Blues"))
colreds   <- rev(RColorBrewer::brewer.pal(9, "Reds"))
colgreens  <- rev(RColorBrewer::brewer.pal(9, "Greens"))
coloranges <- rev(RColorBrewer::brewer.pal(9, "Oranges"))
colpurples <- rev(RColorBrewer::brewer.pal(9, "Purples"))
colrdbu <- RColorBrewer::brewer.pal(8, "RdBu")[c(1:4,6:8)]
colrdbu[4] <- colpurples[4]

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
                 "Autres contractuels"),
    factors  = c("kpi.ENS.P.effectif", 
                 "kpi.ENS.S.titulaires", 
                 "kpi.ENS.S.EC", 
                 "kpi.ENS.S.DocATER",
                 "kpi.ENS.S.contractuels"),
    colors   = colblues[1:5],
    y_labels = identity,
    desc     = c("Effectif total enseignant",
                 "Effectif titulaire",
                 "Effectif enseignant-chercheur",
                 "Effectif doctorant et ATER",
                 "Effectif autres contractuels")
  ),
  BIA = list(
    labels   = c("BIATSS", 
                 "Titulaires",
                 "A",
                 "B",
                 "C"),
    factors  = c("kpi.BIA.P.effectif", 
                 "kpi.BIA.S.titulaires",
                 "kpi.BIA.S.A", 
                 "kpi.BIA.S.B", 
                 "kpi.BIA.S.C"),
    colors   = colpurples[1:6],
    y_labels = identity,
    desc     = c("Effectif total BIATSS",
                 "Effectif BIATSS titulaires",
                 "Effectif BIATSS catégorie A",
                 "Effectif BIATSS catégorie B",
                 "Effectif BIATSS catégorie C")
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
    colors   = coloranges[1:5],
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
                 "Taux d'encadrement pédagogique",
                 "Taux d'encadrement administratif",
                 "Ressources par étudiant",
                 "Recetttes formation par étudiant",
                 "Recettes recherche par EC"),
    factors  = c("kpi.K.titPper",
                 "kpi.K.dotPres",
                 "kpi.K.ensPetu",
                 "kpi.K.biaPper",
                 "kpi.K.resPetu",
                 "kpi.K.forPetu",
                 "kpi.K.recPect"),
    colors   = colrdbu, #c(coloranges[1],coloranges[4],coloranges[1],colgreens[5],coloranges[5],colblues[5]),
    y_labels = identity,
    desc     = c("Part des titulaires dans les personnels",
                 "Part des Subventions pour charge de service public (SCSP) dans les ressources",
                 "Nombre d'enseignants (titulaires et contractuels, hors doctorants et vacataires) pour 100 étudiants en cycles 1 et 2",
                 "Part des personnels BIATSS dans les personnels",
                 "Ressources divisées par le nombre d'étudiants",
                 "Recettes formation divisées par le nombre d'étudiants",
                 "Recettes recherche divisées par le nombre d'enseignants-chercheurs (titulaires et contractuels)")
  )
)

lfc_dont_labeller <-function(labels) {
  return( c(
    paste("Total",labels[1]),
    paste("dont",labels[-1])
    ))
}

lfc_pc_labeller <-function(labels) {
  return( 
    paste("%",labels)
  )
}

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



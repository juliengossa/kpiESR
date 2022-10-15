
#' Title
#'
#' @param rentrée 
#' @param id 
#' @param groupe 
#' @param xvar 
#' @param yvar 
#' @param xlabel 
#' @param ylabel 
#' @param style 
#'
#' @return
#' @export
#'
#' @examples
kpiesr_plot_map <- function(rentrée, id, groupe, xvar, yvar, xlabel=0, ylabel=0,
                            style = kpiesr_style()) {
  
  df <- kpiESR::esr %>%
    filter(Rentrée == rentrée) %>%
    filter(str_detect(Groupe,groupe)) %>% 
    #filter(! is.na(kpi.FIN.P.ressources)) %>%
    left_join(kpiESR::esr.etab) %>%
    mutate(PerimEx = ifelse(PerimEx=="","NINI", PerimEx)) 
  
  
  df.etab <- df %>% filter(pid == id)
  
  df %>%
    filter(Comparable) %>%
    #mutate(label = ifelse(Etablissement == "Université de Lorraine", NA, Etablissement)) %>%
    ggplot(aes_string(x=xvar, y=yvar, size="kpi.ETU.P.effectif", color = "PerimEx")) +
    ggrepel::geom_text_repel(aes(label=Sigle), size = 3, color="grey") +
    geom_point() + 
    ggrepel::geom_text_repel(data = df.etab, aes(label=Etablissement), size=5, color="black", xlim=c(xlabel,xlabel), ylim=c(ylabel,ylabel)) +
    geom_point(data = df.etab, shape = 21, stroke = 1, color="black", fill="#ae2573") +
    scale_color_discrete(name="Type") +
    scale_fill_discrete(name="", guide="none") +
    scale_size(range=c(0.1,6), name="Etudiants") +
    guides(colour = guide_legend(override.aes = list(size=4)))
}

#kpiesr_plot_map(2020,"4k25D","Université","kpi.ENS.S.titulaires/kpi.ENS.P.effectif","kpi.BIA.S.titulaires/kpi.BIA.P.effectif")

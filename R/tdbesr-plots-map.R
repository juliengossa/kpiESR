
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
kpiesr_plot_map <- function(rentrée, id, groupe, xvar, yvar, xlabel=NA, ylabel=NA,
                            style = kpiesr_style()) {
  
  df <- kpiESR::esr %>%
    filter(Rentrée == rentrée) %>%
    { if(groupe != "Ensemble") filter(., Groupe == groupe) else . } %>% 
    #filter(! is.na(kpi.FIN.P.ressources)) %>%
    mutate(
      x = eval(parse(text = xvar)),
      y = eval(parse(text = yvar))
    ) %>%
    left_join(kpiESR::esr.etab) %>%
    mutate(PerimEx = ifelse(PerimEx=="","NINI", PerimEx)) 
  
  df.etab <- df %>% filter(pid == id)
  
  df <- df %>% filter(Comparable) 
  
  if(is.na(xlabel)) xlabel <- min(df$x, na.rm=TRUE)
  if(is.na(ylabel)) ylabel <- max(df$y, na.rm=TRUE)
  
  df %>%
    #mutate(label = ifelse(Etablissement == "Université de Lorraine", NA, Etablissement)) %>%
    ggplot(aes(x=x, y=y, size=kpi.ETU.P.effectif, color = PerimEx)) +
    ggrepel::geom_text_repel(aes(label=Sigle), size = 3, color="grey") +
    geom_point() + 
    ggrepel::geom_text_repel(data = df.etab, aes(label=Etablissement), 
                             size=5, color="black", 
                             vjust = 2, hjust = 1,
                             xlim=c(xlabel,xlabel), ylim=c(ylabel,ylabel)) +
    geom_point(data = df.etab, shape = 21, stroke = 1, color="black", fill="#ae2573") +
    scale_color_discrete(name="Type") +
    scale_fill_discrete(name="", guide="none") +
    scale_size(range=c(0.1,6), name="Etudiants") +
    guides(colour = guide_legend(override.aes = list(size=4)))
}

#kpiesr_plot_map(2020,"4k25D","Université","kpi.ENS.S.titulaires/kpi.ENS.P.effectif","kpi.BIA.S.titulaires/kpi.BIA.P.effectif")
#kpiesr_plot_map(2020,"4k25D","Ensemble","kpi.ETU.P.effectif","kpi.ENS.P.effectif")


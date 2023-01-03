

#' Title
#'
#' @param rentrée 
#' @param id 
#' @param vars 
#' @param val 
#' @param style 
#'
#' @return
#' @export
#'
#' @examples
kpiesr_plot_line <- function(id, vars, 
                             groupe = "None", 
                             val = "valeur",
                             style = kpiesr_style()) {
  
  if(groupe == "None") ids = c(id)
  else ids = c(id, groupe, "Ensemble")
  
  kpiESR::esr.pnl %>%
    filter(pid %in% ids, kpi %in% vars) %>%
    mutate(v = !!sym(val)) %>%
    filter(!is.na(v)) %>%
    mutate(Etablissement = factor(Etablissement,levels = unique(Etablissement))) %>%
    ggplot(aes(x=Rentrée, y=v, color=kpi, linetype = Etablissement, alpha = Etablissement, group = paste(Etablissement,kpi))) +
    geom_line(aes(size=Etablissement)) + geom_point(shape=21, size=3, fill="white", stroke=1, show.legend = FALSE) +
    scale_x_continuous(breaks = scales::pretty_breaks()) +
    scale_y_continuous(labels = kmg_label, name=str_to_title(val)) +
    scale_color_manual(labels = kpiesr_lfc_labels[vars], values = kpiesr_lfc_colors[vars], name="Série") +
    scale_size_manual(values=c(style$line_size,style$line_size/2,style$line_size/2)) +
    scale_linetype_manual(values=c(1,2,1) ) +
    scale_alpha_manual(values=c(1,0.5,0.5) ) 
}

#kpiesr_plot_line("4k25D", c("kpi.FIN.P.ressources","kpi.FIN.S.masseSalariale")) 
#kpiesr_plot_line("4k25D", c("kpi.K.titPper"), groupe = "Universités et assimilés", style = kpiesr_style(line_size = 2)) 

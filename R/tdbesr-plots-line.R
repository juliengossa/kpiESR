

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
    mutate(kpi = factor(kpi,levels = vars)) %>%
    mutate(v = !!sym(val)) %>%
    filter(!is.na(v)) %>%
    mutate(Etablissement = factor(Etablissement,levels = unique(Etablissement))) %>%
    ggplot(aes(x=Rentrée, y=v, color=kpi, shape=kpi, linetype = Etablissement, alpha = Etablissement, group = interaction(Etablissement,kpi))) +
    geom_line(aes(size=Etablissement)) + geom_point(size=3, fill="white", stroke=1) +
    scale_x_continuous(breaks = scales::pretty_breaks()) +
    scale_y_continuous(labels = kmg_label, name=str_to_title(val)) +
    scale_color_manual(labels = str_wrap(kpiesr_lfc_labels[vars],style$legend_wordwrap,exdent = 3),
                       values = kpiesr_lfc_colors[vars], name="Série") +
    scale_shape_manual(labels = str_wrap(kpiesr_lfc_labels[vars],style$legend_wordwrap,exdent = 3),
                       values = seq(21,25), name="Série") +
    scale_size_manual(values=c(style$line_size,style$line_size/2,style$line_size/2), name="") +
    scale_linetype_manual(values=c(1,2,1), name="" ) +
    scale_alpha_manual(values=c(1,0.5,0.5), name="" )
    
}

#kpiesr_plot_line("4k25D", c("kpi.FIN.P.ressources","kpi.FIN.S.masseSalariale")) 
#kpiesr_plot_line("4k25D", c("kpi.K.titPper"), groupe = "Universités et assimilés", style = kpiesr_style(line_size = 2)) 
#kpiesr_plot_line("4k25D", c("kpi.K.ensPetu","kpi.K.biaPper"), style = kpiesr_style(legend_wordwrap = 20)) 
# kpiesr_plot_line(id = "Universités et assimilés", 
#                          vars = c("kpi.FIN.P.ressources", "kpi.FIN.S.SCSP", "kpi.FIN.S.recettesFormation", "kpi.FIN.S.recettesRecherche"), 
#                          val = "valeur")




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
                             val = "valeur",
                             style = kpiesr_style()) {
  kpiESR::esr.pnl %>%
    filter(pid == id, kpi %in% vars) %>%
    mutate(v = !!sym(val)) %>%
    filter(!is.na(v)) %>%
    ggplot(aes(x=Rentrée, y=v, color=kpi, group=kpi)) +
    geom_line(size=1) + geom_point(shape=21, size=3, fill="white", stroke=1) +
    scale_x_continuous(breaks = scales::pretty_breaks()) +
    scale_y_continuous(labels = kmg_label, name=val) +
    scale_color_manual(labels = kpiesr_lfc_labels[vars], values = kpiesr_lfc_colors[vars], name="Série")
}

# kpiesr_plot_line("4k25D", c("kpi.FIN.P.ressources","kpi.FIN.S.masseSalariale")) 

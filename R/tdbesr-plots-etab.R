
kpiesr_plot_primaire_try <- function(rentrée, id, lfc,
                                     facet = TRUE,
                                     style = kpiesr_style()) {
  p <-kpiesr_plot_missingdata
  try(p <- kpiesr_plot_primaire(rentrée, id, lfc, facet, style) )
  return(p)
}


#' Title
#'
#' @param rentr
#' @param id
#' @param lfc
#' @param style
#'
#' @return
#' @export
#'
#' @examples
kpiesr_plot_primaire  <- function(rentrée, id, lfc,
                                  facet = TRUE,
                                  style = kpiesr_style()) {
  
  lfc$labels <- style$strip_labeller(lfc$labels)
  
  df <- kpiESR::esr.pnl %>%
    filter(pid==id, Rentrée==rentrée, kpi %in% lfc$factors) %>%
    mutate(kpi = factor(kpi,levels=lfc$factors, labels=lfc$labels)) 

  if(nrow(filter(df,!is.na(valeur))) == 0) return(kpiesr_plot_missingdata)
  
  df.na <- df %>% filter(is.na(valeur)) %>%
    mutate(valeur = max(df$valeur,na.rm=TRUE)/2)

  ggplot(df, aes(x=kpi,y=valeur,fill=kpi)) + #, text=paste0(lfc$desc,"\n",valeur_label))) +
    geom_bar(stat = "identity") +
    { if(!style$plotly) geom_text(aes(label=valeur_label), size=style$text_size, vjust=-0.4) } +
    geom_label(data=df.na,label="N/A", color="black", fill="white") +
    scale_fill_manual(values=lfc$colors, limits=lfc$labels) +
    #scale_x_discrete(limits=lfc$labels) +
    #scale_y_continuous(labels = lfc$y_labels) +
    guides(color="none", fill="none") +
    expand_limits(y=max(df$valeur,na.rm = TRUE)*style$primaire_margin) +
    { if(facet) facet_wrap(.~kpi, scales="free_x", nrow = 1, labeller = label_wrap_gen(style$label_wrap)) } +
    coord_cartesian(clip = 'off') 
}

# kpiesr_plot_primaire(2020, "4k25D", kpiesr_lfc[["ETU"]], facet = FALSE)
# kpiesr_plot_primaire(2020, "4k25D", kpiesr_lfc[["IMO"]], facet = FALSE)

kpiesr_kpi_stats <- function(df.stats,thekpi) {
  lapply(thekpi,function(p) {
    d <- filter(df.stats, kpi==p)
    paste0("Max. : ",first(d$norm_100_label),"\nMed. : ",first(d$norm_50_label),"\nMin. : ",first(d$norm_0_label))
  })
}


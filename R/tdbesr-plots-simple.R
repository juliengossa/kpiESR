
kpiesr_plot_norm_simple_try <- function(rentrée, id, groupe, lfc,
                                    style = kpiesr_style()) {
  p <-kpiesr_plot_missingdata
  try(p <- kpiesr_plot_norm_simple(rentrée, id, groupe, lfc, style) )
  return(p)
}
  

kpiesr_plot_norm_simple <- function(rentrée, id, groupe, lfc,
                                    style = kpiesr_style()) {
  
  lfc$labels <- style$strip_labeller(lfc$labels)
  
  df <- kpiESR::esr.pnl %>%
    filter(Rentrée==rentrée, kpi %in% lfc$factors) %>%
    mutate(kpi = factor(kpi, levels=lfc$factors, labels=lfc$labels))
  
  df.id <- df %>% filter(pid == id)
  df.na <- df.id %>% filter(is.na(norm)) %>% 
    mutate(norm=0)
  
  if(nrow(df.na)==nrow(df.id)) return(kpiesr_plot_missingdata)
  
  if(groupe == "Ensemble") groupe <- "." 
  
  df.etabs <- bind_rows(
    df %>% filter(str_detect(as.character(Groupe),as.character(groupe)), 
                  Comparable,
                  !kpi %in% df.na$kpi),
    df.id)
  df.groupe <- df %>% filter(Groupe == "Groupe", pid==groupe, !kpi %in% df.na$kpi)
  df.ensemble <- df %>% filter(Etablissement == "Ensemble", !kpi %in% df.na$kpi) 
  
  ggplot(df.etabs %>% filter, aes(x=kpi,y=norm,color=kpi,fill=kpi)) +
    geom_hline(data = df.groupe, aes(yintercept=norm), linetype=2, size=style$line_size/2) +
    geom_hline(data = df.ensemble, aes(yintercept=norm), linetype=1, size=style$line_size/2) +
    #geom_boxplot(fill="white") +
    geom_violin(alpha=0.5) +
    ggbeeswarm::geom_beeswarm(cex=3,size=style$bs_point_size) +
    geom_point(data = df.id, size=style$point_size, shape=21, stroke=1, fill="white") +
    geom_text(data = df.id, aes(label=norm_label, fill=kpi), color="black", size=style$text_size) +
    geom_label(data = df.na, label="N/A", color="black", fill="white") +
    facet_wrap(.~kpi, scales = "free", nrow = 1, labeller = label_wrap_gen(style$label_wrap)) +
    scale_x_discrete(labels="") +
    scale_y_continuous(labels = hack_label, position = style$yaxis_position) +
    scale_color_manual(values=lfc$colors) +
    scale_fill_manual(values=lfc$colors) +
    coord_cartesian(clip = "off") +
    guides(color="none", fill="none") 
}

# kpiesr_plot_norm_simple(2020,"jYUcF","Ecoles d'ingénieurs", kpiesr_lfc[["K"]]) + ggcpesrthemes::theme_cpesr() + theme(legend.position = "bottom")

# kpiesr_plot_norm_simple(2020,"4k25D","Universités et assimilés", kpiesr_lfc[["K"]]) + ggcpesrthemes::theme_cpesr() 
# 
# 
# kpiesr_plot_norm_simple(2019,"4k25D","Université", kpiesr_lfc[["K"]]) + ggcpesrthemes::theme_cpesr() + theme(panel.grid.major.y = element_blank())
# kpiesr_plot_norm_simple(2019,"4k25D","Université", omit_first(kpiesr_lfc[["ENS"]])) + ggcpesrthemes::theme_cpesr() + theme(panel.grid.major.y = element_blank())
# kpiesr_plot_norm_simple(2019,"4k25D","Université", omit_first(kpiesr_lfc[["ETU"]])) + ggcpesrthemes::theme_cpesr() + theme(panel.grid.major.y = element_blank())
# kpiesr_plot_norm_simple(2019,"4k25D","Université", omit_first(kpiesr_lfc[["FIN"]])) + ggcpesrthemes::theme_cpesr() + theme(panel.grid.major.y = element_blank())
# kpiesr_plot_norm_simple(2019,"4k25D","Université", omit_first(kpiesr_lfc[["BIA"]])) + ggcpesrthemes::theme_cpesr() + theme(panel.grid.major.y = element_blank())


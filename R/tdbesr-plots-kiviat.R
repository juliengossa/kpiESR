
#' Title
#'
#' @param rentrée
#' @param uai
#' @param lfc
#' @param type
#' @param omit.first
#' @param norm.valeurs
#' @param style
#'
#' @return
#' @export
#'
#' @examples
kpiesr_plot_kiviat <- function(rentrée, uai, lfc,
                               type=NA,
                               omit.first = TRUE,
                               norm.valeurs = TRUE,
                               style = kpiesr_style()) {
  
  
  if(is.na(type)) type <- as.character(unique(subset(kpiESR::esr,UAI==uai,Type))[[1]])
  
  if(type == "Grand établissement" && lfc$factor[1] == "kpi.ADM.P.formations")
    return(kpiESR::kpiesr_plot_missingdata)
  
  if(omit.first) {
    lfc$factors <- lfc$factors[-1]
    lfc$labels  <- lfc$labels[-1]
    lfc$desc    <- lfc$desc[-1]
  }
  
  
  # shjust = c(0,0,1.1,1.1)
  # svjust = c(0,1.1,1.1,0)
  
  merge(
    kpiESR::esr.pnl %>% filter(Type==type, Rentrée==rentrée, kpi %in% lfc$factors, uai == UAI),
    kpiESR::esr.stats %>% filter(Type==type, Rentrée==rentrée, kpi %in% lfc$factors)
  ) %>% mutate(kpi = factor(kpi,lfc$factors)) %>%
    arrange(kpi) %>%
    mutate( point_y = ifelse(
      rep(is.na(style$kvt_point_pos),n()),
      norm_y, 
      style$kvt_point_pos)) %>%
    
    ggplot(aes(x=kpi, y=norm_y, group=UAI)) +
    ggiraphExtra::coord_radar() +
    { if(style$kvt_style != "circle") list(
      geom_polygon(y=1, color="grey", fill=NA, size=0.2),
      geom_polygon(y=0.75, color="grey30", fill=NA, size=0.2),
      geom_polygon(y=0.25, color="grey30", fill=NA, size=0.2),
      geom_polygon(y=0.5, color="grey", fill=NA, size=0.2))
    }+
    geom_polygon(y=0, color="white", fill="white") +
    geom_point(y=(style$kvt_max_y+0.2), color="white", size=style$kvt_guide_bg_size) +
    
    geom_point(aes(y = norm_y_0, color=kpi), 
               size=style$kvt_scale_point_size+1) +
    geom_point(aes(y = norm_y_25, color=kpi), 
               size=style$kvt_scale_point_size) +
    geom_point(aes(y = norm_y_50, color=kpi), 
               size=style$kvt_scale_point_size+1) +
    geom_point(aes(y = norm_y_75, color=kpi), 
               size=style$kvt_scale_point_size) +
    geom_point(aes(y = norm_y_100, color=kpi), 
               size=style$kvt_scale_point_size+1) +
    
    geom_text(aes(y = norm_y_0+style$kvt_scale_text_y, label=norm_0_label), 
              size=style$kvt_scale_text_size, color="black")+
    #vjust=svjust, hjust=shjust) +
    geom_text(aes(y = norm_y_50+style$kvt_scale_text_y, label=norm_50_label), 
              size=style$kvt_scale_text_size, color="black")+
    #vjust=svjust, hjust=shjust) +
    geom_text(aes(y = norm_y_100+style$kvt_scale_text_y, label=norm_100_label), 
              size=style$kvt_scale_text_size, color="black")+
    #vjust=svjust, hjust=shjust) +
    
    geom_polygon(fill=lfc$colors[1], color=lfc$colors[1], 
                 alpha=style$kvt_alpha, size=style$line_size) +
    
    geom_point(aes(y=point_y, fill=kpi), #y=1.3,
               size=style$point_size,
               color=lfc$colors[1], shape=21) +
    geom_text(aes(y=point_y, label=norm_label, text=""), #y=1.3,
              color="black",       size=style$text_size, fontface="bold") +
    
    # geom_text(label=lfc$labels, y=1.5,
    #           color="black",       size=style$text_size,
    #           lineheight = 1) +
    
    #geom_hline(yintercept = 0.5) +
    
    
    scale_y_continuous(breaks = c(0,0.50,1), limits = c(-0.05,style$kvt_max_y), expand = c(0,0)) +
    scale_x_discrete(labels=lfc$labels) +
    scale_fill_manual(values=lfc$colors[-1]) +
    scale_color_manual(values=lfc$colors[-1]) +
    kpiesr_theme + theme(
      panel.grid.major.x = element_line(colour="grey"),
      axis.text.x = element_text(vjust = 0),
      axis.text.y = element_blank(),
      plot.margin = style$kvt_plot.margin
    ) + 
    { if(style$kvt_style != "circle") theme(panel.grid.major.y = element_blank()) } +
    guides(color=FALSE, fill=FALSE)
}


# kpiesr_plot_kiviat(2018,kpiESR::esr.uais$Université$`Université de Strasbourg`,
#                    kpiesr_lfc[["K"]],norm.valeurs=FALSE, omit.first = FALSE,
#                    style = kpiesr_style(kvt_style="square"))
# 
# kpiesr_plot_kiviat(2017,kpiESR::esr.uais$Université$`Université de Strasbourg`,
#                    kpiesr_lfc[["K"]],norm.valeurs=FALSE, omit.first = FALSE,
#                    style = kpiesr_style(kvt_point_pos = 1.5, kvt_max_y=2))
# 
# 
# kpiesr_plot_kiviat(2017,kpiESR::esr.uais$Université$`Université de Strasbourg`,
#                    kpiesr_lfc[["ETU"]],norm.valeurs=FALSE, omit.first = TRUE)
# 
# kpiesr_plot_kiviat(2017,kpiESR::esr.uais$Université$`Université de Strasbourg`,
#                    kpiesr_lfc[["ENS"]],norm.valeurs=FALSE, omit.first = TRUE)
# 
# kpiesr_plot_kiviat(2017,kpiESR::esr.uais$Université$`Université de Strasbourg`,
#                   kpiesr_lfc[["FIN_N"]],norm.valeurs=FALSE, omit.first = TRUE)

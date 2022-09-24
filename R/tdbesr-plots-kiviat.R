

#' Title
#'
#' @param rentrée
#' @param id
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
kpiesr_plot_kiviat <- function(rentrée, ids, lfc,
                               type=NA,
                               omit.first = TRUE,
                               norm.valeurs = TRUE,
                               style = kpiesr_style()) {
  
  if(is.na(type)) type <- as.character(subset(kpiESR::esr, pid %in% ids, Type)[1,1])
  
  if(type == "Grand établissement" && lfc$factor[1] == "kpi.ADM.P.formations")
    return(kpiESR::kpiesr_plot_missingdata)
  
  if(omit.first) {
    lfc$factors <- lfc$factors[-1]
    lfc$labels  <- lfc$labels[-1]
    lfc$colors  <- lfc$colors[-1]
    lfc$desc    <- lfc$desc[-1]
  }
  
  
  # shjust = c(0,0,1.1,1.1)
  # svjust = c(0,1.1,1.1,0)
  
    etab <- kpiESR::esr.pnl %>% filter(Type==type, Rentrée==rentrée, kpi %in% lfc$factors, pid %in% ids) %>%
    mutate(kpi = factor(kpi,lfc$factors)) %>%
    arrange(kpi) %>% 
    { if(is.na(style$kvt_point_pos)) 
        mutate(.,point_y = norm_y)
      else 
        mutate(.,point_y = style$kvt_point_pos)
    } 

    stats <- kpiESR::esr.stats %>% filter(Type==type, Rentrée==rentrée, kpi %in% lfc$factors) %>%
      mutate(kpi = factor(kpi,lfc$factors)) %>%
      arrange(kpi) 
    
    ggplot(stats, aes(x=kpi, y=norm_y)) +
    ggiraphExtra::coord_radar() +
    geom_polygon(y=0, group=1, color="white", fill="white") +
    geom_point(y=(style$kvt_max_y+0.2), color="white", size=style$kvt_guide_bg_size) +
    { if(style$kvt_style != "circle") list(
      geom_polygon(y=1.00, group=1, color="grey", fill=NA, size=0.4),
      geom_polygon(y=0.75, group=1, color="grey", fill=NA, size=0.2),
      geom_polygon(y=0.50, group=1, color="grey", fill=NA, size=0.4),
      geom_polygon(y=0.25, group=1, color="grey", fill=NA, size=0.2),
      geom_polygon(y=0.00, group=1, color="grey", fill=NA, size=0.4))
    } +

    geom_point(y=0.00, color=lfc$colors,
               size=style$kvt_scale_point_size+1) +
    geom_point(y=0.25, color=lfc$colors,
               size=style$kvt_scale_point_size) +
    geom_point(y=0.50, color=lfc$colors,
               size=style$kvt_scale_point_size+1) +
    geom_point(y=0.75, color=lfc$colors,
               size=style$kvt_scale_point_size) +
    geom_point(y=1.00, color=lfc$colors,
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

    geom_polygon(data=etab, aes(fill=pid, color=pid, group=pid),
                 alpha=style$kvt_alpha, size=style$line_size) +

    geom_point(data=etab, aes(y=point_y, color=pid), #y=1.3,
               fill = rep(lfc$colors, each=length(ids)),
               size=style$point_size,
               shape=21) +
    geom_text(data=etab, aes(y=point_y, label=norm_label, text=""), #y=1.3,
              color="black",       size=style$text_size, fontface="bold") +

    # geom_text(label=lfc$labels, y=1.5,
    #           color="black",       size=style$text_size,
    #           lineheight = 1) +

    #geom_hline(yintercept = 0.5) +


    scale_y_continuous(breaks = c(0,0.50,1), limits = c(style$kvt_min_y,style$kvt_max_y), expand = c(0,0)) +
    scale_x_discrete(labels=lfc$labels) +
    #scale_fill_manual(values=lfc$colors) +
    #scale_color_manual(values=lfc$colors) +
    kpiesr_theme + theme(
      panel.grid.major.x = element_line(colour="grey"),
      axis.text.x = element_text(vjust = 0),
      axis.text.y = element_blank(),
      plot.margin = style$kvt_plot.margin
    ) +
    { if(style$kvt_style != "circle") theme(panel.grid.major.y = element_blank()) } +
    guides(color=FALSE, fill=FALSE)
}

#kpiesr_plot_kiviat(2018,"0681166Y",kpiesr_lfc[["K"]], omit.first = FALSE)
#kpiesr_plot_kiviat(2018,c("0681166Y", "0673021V"),kpiesr_lfc[["K"]], omit.first = FALSE)

# kpiesr_plot_kiviat(2018,kpiESR::esr.uais$Université$`Université de Strasbourg`,
#                    kpiesr_lfc[["K"]],norm.valeurs=FALSE, omit.first = FALSE,
#                    style = kpiesr_style(kvt_style="square"))

# kpiesr_plot_kiviat(2017,kpiESR::esr.uais$Université$`Université de Strasbourg`,
#                    kpiesr_lfc[["K"]],norm.valeurs=FALSE, omit.first = FALSE,
#                    style = kpiesr_style(kvt_point_pos = 1.5, kvt_max_y=2))
# 
# 
# kpiesr_plot_kiviat(2017,kpiESR::esr.uais$Université$`Université de Strasbourg`,
#                    kpiesr_lfc[["ETU"]],norm.valeurs=FALSE, omit.first = TRUE)

# kpiesr_plot_kiviat(2017,kpiESR::esr.uais$Université$`Université de Strasbourg`,
#                    kpiesr_lfc[["ENS"]],norm.valeurs=FALSE, omit.first = TRUE)
# 
# kpiesr_plot_kiviat(2017,kpiESR::esr.uais$Université$`Université de Strasbourg`,
#                   kpiesr_lfc[["FIN_N"]],norm.valeurs=FALSE, omit.first = TRUE)

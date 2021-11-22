

#' Title
#'
#' @param rentr
#' @param uai
#' @param lfc
#' @param style
#'
#' @return
#' @export
#'
#' @examples
kpiesr_plot_primaire  <- function(rentrée, uai, lfc,
                                  facet = TRUE,
                                  style = kpiesr_style()) {
  df <- kpiESR::esr.pnl %>%
    filter(UAI==uai, Rentrée==rentrée, kpi %in% lfc$factors) %>%
    mutate(kpi = factor(kpi,levels=lfc$factors, labels=lfc$labels))

  # if(nrow(filter(df,!is.na(valeur))) == 0)
  #   return(kpiesr_plot_missingdata)

  ggplot(df, aes(x=kpi,y=valeur,fill=kpi, text=paste0(lfc$desc,"\n",valeur_label))) +
    geom_bar(stat = "identity") +
    { if(!style$plotly) geom_text(aes(label=valeur_label), size=style$text_size, vjust=-0.4) } +
    scale_fill_manual(values=lfc$colors, limits=lfc$labels) +
    #scale_x_discrete(limits=lfc$labels) +
    scale_y_continuous(labels = lfc$y_labels) +
    guides(color="none", fill="none") +
    expand_limits(y=max(df$valeur)*style$primaire_margin) +
    { if(facet) facet_wrap(.~kpi, scales="free_x", nrow = 1, labeller = label_wrap_gen(style$label_wrap)) } +
    coord_cartesian(clip = 'off') 
}

# kpiesr_plot_primaire(2019, "0251215K", kpiesr_lfc[["ETU"]], facet = TRUE)

kpiesr_kpi_stats <- function(df.stats,thekpi) {
  lapply(thekpi,function(p) {
    d <- filter(df.stats, kpi==p)
    paste0("Max. : ",first(d$norm_100_label),"\nMed. : ",first(d$norm_50_label),"\nMin. : ",first(d$norm_0_label))
  })
}


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
kpiesr_plot_norm <- function(rentrée, uai, lfc,
                             type=NA,
                             omit.first = TRUE,
                             norm.valeurs = TRUE,
                             style = kpiesr_style()) {


  if(is.na(type)) type <- as.character(unique(subset(kpiESR::esr,UAI==uai,Type))[[1]])

  if(type == "Grand établissement" && lfc$factor[1] == "kpi.ADM.P.formations")
    return(kpiesr_plot_missingdata)

  if(omit.first) {
    lfc$factors <- lfc$factors[-1]
    lfc$labels  <- lfc$labels[-1]
    lfc$desc    <- lfc$desc[-1]
  }
  
  df.stats <- kpiESR::esr.stats %>%
    filter(Type==type, Rentrée==rentrée, kpi %in% lfc$factors) %>%
    select(kpi,norm_50,norm_50_label) %>%
    mutate(kpi = factor(kpi,lfc$factors))
  

  df <- kpiESR::esr.pnl %>%
    filter(Type==type, Rentrée==rentrée, kpi %in% lfc$factors) %>%
    merge(df.stats) %>%
    mutate(kpi = factor(kpi,lfc$factors)) %>%
    #filter(!is.na(valeur)) %>%
    group_by(kpi) %>%
    mutate(y = (norm / norm_50) -1 
           #rang = rank(desc(y))
           )


  df.etab <- df %>% filter(UAI == uai)


  p <- ggplot(df, aes(x=kpi,y=y))

  if (style$bp_style == "violin")
    p <- p + geom_violin(aes(fill=kpi, text = kpiesr_kpi_stats(df.stats,kpi)),
                    color="black", width=style$bp_width)
  else 
    p <- p + geom_beeswarm(aes(color=kpi))

  p <- p +
    geom_point(data = df.etab,
               aes(text = paste0(ifelse(omit.first, "Pourcentage de : ",""),
                                 lfc$desc,
                                 "\nEcart à la moyenne : ",percent_format(y),
                                 "\nClassement : ",rang,"/", df.stats[df.stats$kpi==kpi,]$nombre)),
               size=style$point_size, fill=lfc$colors[1],
               color="black", shape=21, alpha=style$point_alpha) +
    geom_line(data = df.etab, aes(group=UAI),
              color=lfc$colors[1], size=style$line_size, alpha=style$point_alpha) +
    geom_text(data = df.etab, aes(label=norm_label, text=""),
              color="white",       size=style$text_size, fontface="bold") +
    { if(!style$plotly)
        geom_label(data = df.stats, aes(y=0,label=norm_50_label),
                   color="black", size=style$text_size-1, nudge_x=style$bp_text_x, hjust=1)
      else
        geom_text(data = df.stats, aes(y=0, label=norm_50_label, text=paste0(lfc$desc,"\nMediane : ", norm_50_label)),
                  color="black", size=style$text_size-1, nudge_x=style$bp_text_x, hjust=1) } +
    scale_x_discrete(labels=lfc$labels, position = style$x_scale_pos) +
    scale_y_continuous(labels = percent_format) +
    scale_fill_manual(values=lfc$colors[-1]) +
    scale_color_manual(values=lfc$colors[-1]) +
    guides(color=FALSE, fill=FALSE) +
    kpiesr_theme +
    { if(style$x_scale == FALSE) theme(axis.text.x = element_blank()) }

  return(p)
}

# kpiesr_plot_norm(2017,uai,kpiesr_lfc[["ETU"]])
# kpiesr_plot_norm(2017,uai,kpiesr_lfc[["ETU"]], style=kpiesr_style(bp_style = "violin"))
# kpiesr_plot_norm(2017,uai,kpiesr_lfc[["ENS"]])
# kpiesr_plot_norm(2018,uai,kpiesr_lfc[["FIN"]],omit.first = FALSE)
# kpiesr_plot_norm(2017,uai,kpiesr_lfc[["ADM"]])
# kpiesr_plot_norm(2017,uai,kpiesr_lfc[["K"]], omit.first = FALSE)

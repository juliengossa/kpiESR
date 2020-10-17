

kpiesr_plot_evol <- function(rentrées, uais, lfc, ilfc, type=NA,
                             plot.type="abs",
                             yzoom = 1, ydecal = 0,
                             rentrée.base = NA,
                             style = kpiesr_style(),
                             y_labels = lfc$y_labels) {

  if(is.na(type)) type <- as.character(unique(subset(esr,UAI==uais[1],Type))[[1]])
  if(is.na(rentrée.base)) rentrée.base=rentrées[1]

  df.evol <- kpiESR::esr.pnl %>%
    filter(Type == type, Rentrée %in% rentrées, kpi == lfc$factors[ilfc]) %>%
    filter(!is.na(valeur)) %>%
    #filter(! (UAI=="9730429D" && kpi=="kpi.K.titPens") ) %>% # Enlever Guyanes
    mutate(norm.evol = "absolue")

  if (plot.type == "norm") {
    df.evol <- df.evol %>%
      group_by(kpi,UAI) %>%
      arrange(Rentrée) %>%
      mutate(
       valeur = (valeur/first(valeur))-1,
        norm.evol = "évolution") %>%
      filter(is.finite(valeur))
    y_labels <- percent_format
  }

  df.uai <- filter(df.evol, UAI %in% uais)
  if(nrow(df.uai)==0) return(kpiesr_plot_missingdata)

 valeur.median <- median(filter(df.evol,Rentrée == rentrée.base)$valeur,na.rm=TRUE)
  ecartmax <- max(
   valeur.median - min(df.evol$valeur,na.rm = TRUE),
    max(df.evol$valeur,na.rm = TRUE) -valeur.median)
  ylim <- c(
   valeur.median - ecartmax * yzoom * (1-ydecal),
   valeur.median + ecartmax * yzoom * (1+ydecal))
  ylim[1] <- min(ylim[1],min(df.uai$valeur))
  ylim[2] <- max(ylim[2],max(df.uai$valeur))

  p <- ggplot(df.evol, aes(x=as.factor(Rentrée), y=valeur)) +
    #geom_hline(yintercept =valeur.median) +
    geom_boxplot(aes(fill=kpi), fill=lfc$colors[ilfc+1],
                 color=style$bp_color,
                 alpha=style$bp_alpha, width=style$bp_width)  +
    geom_line(data = df.uai,
              aes(group = Libellé, colour = Libellé),
              size=style$line_size,
              lineend = 'round', linejoin = 'mitre',
              arrow = arrow(length=unit(0.30,"cm"),type="closed",angle=30)) +
    # geom_point(data = df.uai,
    #           aes(group = Libellé, colour = Libellé,
    #               text = paste0(lfc$desc[ilfc],"\nValeur : ",valeur_label," ; ",y_labels(valeur),
    #                             "\nClassement : ", rang)),
    #           size=style$line_size+2) +
    scale_x_discrete(limits = as.character(rentrées)) +
    scale_y_continuous(labels = y_labels) +
    scale_color_manual(values = lfc$colors) +
    coord_cartesian(ylim=ylim)  +
    { if(length(uais) == 1) guides(color=FALSE) } +
    { if(style$title == TRUE) ggtitle(lfc$labels[ilfc]) } +
    kpiesr_theme +
    theme(axis.text.x = element_text(angle=90), ) +
    { if(style$y_scale == FALSE) theme(strip.text = element_blank(), axis.text.y = element_blank(), panel.grid = element_blank()) } +
    { if(style$x_scale == FALSE) theme(axis.text.x = element_blank()) } +
    { if(style$grid == FALSE) theme(panel.grid.major.y = element_blank()) }

  return(p)
}




kpiesr_plot_evol_all <- function(rentrée, uai, peg.args, type=NA, yzooms=list(),
                                 style = kpiesr_style(), ...) {

  plots <- list()
  for(i in seq(1,length(peg.args))) {

    args <- append(list(
      rentrées=seq(2012,rentrée),
      type=type,
      uais=c(uai),
      style=style),
      peg.args[[i]])
    if(i < length(yzooms)) args <- append(args, list(yzoom=yzooms[i]))
    args <- c(args, ...)

    plot <- do.call(kpiesr_plot_evol, args)
    plots[[i]] <- plot
  }

  return(plots)
}


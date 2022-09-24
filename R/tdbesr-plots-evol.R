
scale_breaker <- function(x) {
  smax <- c(105,110,120,150,200,300,400)
  smin <- c(95,90,80,50,0)
  max <- max(smax[smax < max(x)])
  min <- min(smin[smin > min(x)])
  return(c(min,100,max))
}

scale_min_breaker <- function(x) {
  x <- ceiling(min(x,na.rm=TRUE))
  x <- x[x != 0]
  return(x)
}


kpiesr_plot_evol_try <- function(rentrée, id, groupe, lfc,
                                  style = kpiesr_style()) {
  p <-kpiesr_plot_missingdata
  try(p <- kpiesr_plot_evol(rentrée, id, groupe, lfc, style) )
  return(p)
}


#' Title
#'
#' @param rentr 
#' @param id 
#' @param groupe 
#' @param lfc 
#' @param style 
#'
#' @return
#' @export
#'
#' @examples
kpiesr_plot_evol <- function(rentrée, id, groupe, lfc,
                             style = kpiesr_style()) {
  
  df <- kpiESR::esr.pnl %>%
    filter(kpi %in% lfc$factors) %>%
    mutate(kpi = factor(kpi, levels=lfc$factors, labels=lfc$labels)) 

  df.id <- df %>% filter(pid==id)
  df.na <- df.id %>% 
    group_by(kpi) %>% summarize(n = sum(!is.na(evolution))) %>%
    filter(n<3) %>%
    mutate(Rentrée = 0, evolution = 100)
  
  if(nrow(df.na)==nrow(df.id)) return(kpiesr_plot_missingdata)
  
  df <- df %>% filter(!is.na(evolution), !kpi %in% df.na$kpi)
  
  df.id <- df %>% filter(pid==id)
  df.groupe <- df %>% filter(Etablissement == groupe) 
  df.ensemble <- df %>% filter(Etablissement == "Ensemble") 
  df.series <- bind_rows(df.id,df.groupe,df.ensemble)  %>% filter(kpi %in% df.id$kpi) %>%
    mutate(Etablissement = factor(Etablissement,levels=unique(Etablissement)))
  df.points <- df.id %>% group_by(kpi) %>% slice_max(Rentrée)
  
  
  df.stats <- kpiESR::esr.stats %>% 
    filter(Groupe == groupe, kpi %in% lfc$factors) %>%
    na.omit() %>%
    mutate(kpi = factor(kpi, levels=lfc$factors, labels=lfc$labels))  %>% filter(kpi %in% df.id$kpi)
  
  df.minmax <- bind_rows(df.stats,
                         df.series %>% mutate(evolution_25=evolution, evolution_75=evolution)) %>%
    group_by(kpi) %>%
    summarise(
      min_25 = 100-max(evolution_75-100, na.rm=TRUE),
      max_75 = 100-min(evolution_25-100, na.rm=TRUE),
      min_0 = 100-max(evolution_100-100, na.rm = TRUE),
      max_100 = 100-min(evolution_0-100, na.rm = TRUE)
    ) 
  
  if(style$evol_text_percent) 
    labelfun <- function(x) sprintf("%+0.0f%%", round(x-100,0)) 
  else 
    labelfun <- function(x) round(x,0) 
  
  ggplot(df.stats, aes(x=Rentrée,color=kpi,fill=kpi, group=kpi)) +
    geom_hline(data=df.minmax, aes(yintercept = min_25), alpha = 0) +
    geom_hline(data=df.minmax, aes(yintercept = max_75), alpha = 0) +
    #geom_ribbon(aes(ymin=evolution_0, ymax=evolution_100), alpha=0.25, color="white") +
    geom_ribbon(aes(ymin=evolution_25, ymax=evolution_75), alpha=0.25, color="white", fill="grey") +
    geom_line(data=df.series, aes(y=evolution, group = Etablissement,
                                  linetype = Etablissement, size = Etablissement), color='grey') +
    geom_line(data=df.id, aes(y=evolution, group = Etablissement,
                                  linetype = Etablissement, size = Etablissement)) +
    geom_point(data=df.points, aes(y=evolution), size=style$line_size*3) +
    geom_label(data=df.na, aes(y=evolution), label="N/A", color="black", fill="white") +
    { if (style$evol_text) geom_text(data=df.points, aes(y=evolution, label=labelfun(evolution)), 
                                     size=style$text_size, color="black",
                                     vjust=0.5, hjust=0, nudge_x = 0.5) } +
    facet_wrap(.~kpi, scales="free", nrow = 1, labeller = label_wrap_gen(style$label_wrap), drop = FALSE) +
    scale_x_continuous(breaks=scale_min_breaker) +
    scale_y_continuous(breaks=scale_breaker, position = style$yaxis_position) +#scales::breaks_extended(n = 3, w = c(0.25, 0.2, 0.5, 0.05))) +
    scale_color_manual(values=lfc$colors,breaks=lfc$labels) +
    scale_fill_manual(values=lfc$colors,breaks=lfc$labels) +
    scale_size_manual(values=c(style$line_size,style$line_size/2,style$line_size/2)) +
                      #labels=unique(df.series$Etablissement)) +
    scale_linetype_manual(values=c(1,2,1) )+
                          #labels=unique(df.series$Etablissement)) +
    coord_cartesian(clip = "off") +
    guides(color="none", fill="none") 
}


# kpiesr_plot_evol(2020,"4k25D","Ensemble", kpiesr_lfc[["K"]], style = kpiesr_style(line_size = 1)) + ggcpesrthemes::theme_cpesr() + theme()
# kpiesr_plot_evol(2020,"nkbwh","Ensemble", kpiesr_lfc[["K"]], style = kpiesr_style(line_size = 1)) + ggcpesrthemes::theme_cpesr() + theme()
# kpiesr_plot_evol(2019,"4k25D","Université", kpiesr_lfc[["K"]], style = kpiesr_style(line_size = 1)) + ggcpesrthemes::theme_cpesr() + theme()
# kpiesr_plot_evol(2019,"4k25D","Université", kpiesr_lfc[["ENS"]]) + ggcpesrthemes::theme_cpesr() + theme()
# kpiesr_plot_evol(2019,"4k25D","Université", kpiesr_lfc[["ETU"]]) + ggcpesrthemes::theme_cpesr() + theme()
# kpiesr_plot_evol(2019,"4k25D,"Université", kpiesr_lfc[["BIA"]]) + ggcpesrthemes::theme_cpesr() + theme()


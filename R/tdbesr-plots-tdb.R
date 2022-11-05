#' Title
#'
#' @param rentr
#' @param id
#' @param style.kpi.k
#' @param style.kpi
#'
#' @return
#' @export
#'
#' @examples
kpiesr_plot_all <- function(rentrée, id, groupe,
                            experimental = FALSE,
                            style.k=kpiesr_style(),
                            style.o=kpiesr_style(),
                            style.o.norm=kpiesr_style(),
                            lfc = kpiesr_lfc,
                            ...) {

  plots <- list(
    k.norm = kpiesr_plot_norm_simple_try(rentrée, id, groupe,
                                 lfc[["K"]], 
                                 style=style.k, ...),
    k.evol = kpiesr_plot_evol_try(rentrée, id, groupe,
                                           lfc[["K"]], 
                                           style=style.k, ...),
    
    etu.abs = kpiesr_plot_primaire_try(rentrée,id,lfc[["ETU"]], style=style.o, ...),
    etu.evol = kpiesr_plot_evol_try(rentrée,id,groupe,lfc[["ETU"]], style=style.o, ...),
    etu.norm = kpiesr_plot_norm_simple_try(rentrée,id,groupe,omit_first(lfc[["ETU"]]), style=style.o.norm,...),

    bia.abs = kpiesr_plot_primaire_try(rentrée,id,lfc[["BIA"]], style=style.o,...),
    bia.evol = kpiesr_plot_evol_try(rentrée,id,groupe,lfc[["BIA"]], style=style.o,...),
    bia.norm = kpiesr_plot_norm_simple_try(rentrée,id,groupe,omit_first(lfc[["BIA"]]), style=style.o.norm,...),
    
    ens.abs = kpiesr_plot_primaire_try(rentrée,id,lfc[["ENS"]], style=style.o,...),
    ens.evol = kpiesr_plot_evol_try(rentrée,id,groupe,lfc[["ENS"]], style=style.o,...),
    ens.norm = kpiesr_plot_norm_simple_try(rentrée,id,groupe,omit_first(lfc[["ENS"]]), style=style.o.norm,...),

    fin.abs = kpiesr_plot_primaire_try(rentrée,id,lfc[["FIN"]], style=style.o,...),
    fin.evol = kpiesr_plot_evol_try(rentrée,id,groupe,lfc[["FIN"]], style=style.o,...),
    fin.norm = kpiesr_plot_norm_simple_try(rentrée,id,groupe,omit_first(lfc[["FIN"]]), style=style.o.norm,...)
  )
  if(experimental) {
    plots <- append(plots, list(
      imo.abs = kpiesr_plot_primaire_try(rentrée,id,lfc[["IMO"]], style=style.o,...),
      imo.evol = kpiesr_plot_evol_try(rentrée,id,groupe,lfc[["IMO"]], style=style.o,...),
      imo.norm = kpiesr_plot_norm_simple_try(rentrée,id,groupe,omit_first(lfc[["IMO"]]), style=style.o.norm,...)
    ))
  }
  return(plots)
}

# ps <- kpiesr_plot_all(2019, "0673021V", "Université")
# ps <- kpiesr_plot_all(2019, "0251215K", "Université")


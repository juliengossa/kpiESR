kpiESR : les indicateurs clés de performance des établissements
l’enseignement supérieur et de la recherche

Cette librairie est une exploitation des données ouvertes \#DataESR :
<https://data.enseignementsup-recherche.gouv.fr>

Elle assemble plusieurs jeux de données, et calcule ensuite plusieurs
indicateurs clés de performance. Jeux, données et indicateurs sont
présentés dans les [tableaux de bord des établissemebts de
l’ESR](https://github.com/cpesr/tdbESR-rapport).

## Jeu de données assemblées

Un exemplaire du dernier assemblage est disponible en [format
csv](dataESR/tdbesr.csv).

*Attention : ces données peuvent être en retard par rapport aux données
publiées sur \#DataESR*

## Installation du packet R

L’installation du packet nécessite `devtools`.

``` r
devtools::install_github("cpesr/kpiESR")
```

Ensuite, un jeu de donnée est disponible
    :

``` r
colnames(kpiESR::esr)
```

    ##  [1] "UAI"                            "Rentrée"                       
    ##  [3] "kpi.FIN.P.ressources"           "kpi.FIN.S.masseSalariale"      
    ##  [5] "kpi.FIN.S.ressourcesPropres"    "kpi.ENS.P.effectif"            
    ##  [7] "kpi.ENS.S.titulaires"           "kpi.ENS.S.ECtitulaires"        
    ##  [9] "kpi.ENS.S.DocATER"              "kpi.ENS.S.LRU"                 
    ## [11] "kpi.ETU.P.effectif"             "kpi.ETU.S.cycle.1.L"           
    ## [13] "kpi.ETU.S.cycle.2.M"            "kpi.ETU.S.cycle.3.D"           
    ## [15] "kpi.ETU.S.diplomeEtablissement" "kpi.ADM.P.formations"          
    ## [17] "kpi.ADM.S.sélective"            "kpi.ADM.S.hypersélective"      
    ## [19] "kpi.ADM.S.surchargées"          "kpi.ADM.S.souschargée"         
    ## [21] "err.ADM"                        "Libellé"                       
    ## [23] "Sigle"                          "Type"                          
    ## [25] "Type.détaillé"                  "Académie"                      
    ## [27] "Rattachement"                   "Fusion"                        
    ## [29] "Curif"                          "url.siteweb"                   
    ## [31] "url.wikidata"                   "url.legifrance"                
    ## [33] "twitter"                        "kpi.K.proPres"                 
    ## [35] "kpi.K.resPetu"                  "kpi.K.selPfor"                 
    ## [37] "kpi.K.titPetu"                  "kpi.K.titPens"

En plus du jeu de données `esr`, un autre jeu de donnée “long” est
disponible, ajoutant des valeurs normalisées
    :

``` r
colnames(kpiESR::esr.pnl)
```

    ##  [1] "Type"        "Rentrée"     "UAI"         "Libellé"     "Curif"      
    ##  [6] "kpi"         "value"       "norm"        "value_label" "norm_label" 
    ## [11] "rang"


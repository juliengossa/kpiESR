kpiESR : les indicateurs clés de performance des établissements
l’enseignement supérieur et de la recherche
================

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

## Modifications par rapport aux jeux de données originaux

Pour des raisons de cohérence des indicateurs, et compte tenu de la
diversité des profils, les modifications suivantes ont été apportées :

  - le type de Université de Lorraine est considéré comme *Université*,
    au lieu de *Grand établissement*.

## Installation du paquet R

L’installation du paquet nécessite `devtools`.

``` r
devtools::install_github("cpesr/kpiESR")
```

Ensuite, un jeu de donnée est disponible :

``` r
colnames(kpiESR::esr)
```

    ##  [1] "UAI"                            "Rentrée"                       
    ##  [3] "kpi.FIN.P.ressources"           "kpi.FIN.S.masseSalariale"      
    ##  [5] "kpi.FIN.S.SCSP"                 "kpi.FIN.S.recettesFormation"   
    ##  [7] "kpi.FIN.S.recettesRecherche"    "kpi.FIN.S.investissements"     
    ##  [9] "kpi.ENS.P.effectif"             "kpi.ENS.S.titulaires"          
    ## [11] "kpi.ENS.S.ECtitulaires"         "kpi.ENS.S.DocATER"             
    ## [13] "kpi.ENS.S.LRU"                  "kpi.ETU.P.effectif"            
    ## [15] "kpi.ETU.S.cycle.1.L"            "kpi.ETU.S.cycle.2.M"           
    ## [17] "kpi.ETU.S.cycle.3.D"            "kpi.ETU.S.diplomeEtablissement"
    ## [19] "kpi.ADM.P.formations"           "kpi.ADM.S.sélective"           
    ## [21] "kpi.ADM.S.hypersélective"       "kpi.ADM.S.surchargées"         
    ## [23] "kpi.ADM.S.souschargée"          "err.ADM"                       
    ## [25] "Libellé"                        "Sigle"                         
    ## [27] "Type"                           "Type.détaillé"                 
    ## [29] "Académie"                       "Rattachement"                  
    ## [31] "Fusion"                         "Curif"                         
    ## [33] "url.siteweb"                    "url.wikidata"                  
    ## [35] "url.legifrance"                 "twitter"                       
    ## [37] "kpi.K.dotPres"                  "kpi.K.resPetu"                 
    ## [39] "kpi.K.forPetu"                  "kpi.K.recPect"                 
    ## [41] "kpi.K.selPfor"                  "kpi.K.titPetu"                 
    ## [43] "kpi.K.titPens"

En plus du jeu de données `esr`, un autre jeu de donnée “long” est
disponible, ajoutant des valeurs normalisées :

``` r
colnames(kpiESR::esr.pnl)
```

    ##  [1] "Type"         "Rentrée"      "UAI"          "Libellé"      "Curif"       
    ##  [6] "kpi"          "valeur"       "norm"         "valeur_label" "norm_label"  
    ## [11] "rang"         "norm_y"

## Description de données

En plus des données explicite sur les établissements, cette librairie
ajoute :

### Etudiants

  - `kpi.ETU.P.effectif` : *Etudiants* Effectif total étudiant (Hors
    double inscription CPGE)
  - `kpi.ETU.S.cycle.1.L` : *Cycle 1 (L)* Effectif étudiant inscrit en
    premier cycle (L, DUT, etc.)
  - `kpi.ETU.S.cycle.2.M` : *Cycle 2 (M)* Effectif étudiant inscrit en
    deuxième cycle (M)
  - `kpi.ETU.S.cycle.3.D` : *Cycle 3 (D)* Effectif étudiant inscrit en
    troisième cycle (Doctorat, HDR)
  - `kpi.ETU.S.diplomeEtablissement` : *DU* Effectif étudiant inscrit en
    diplôme d’établissement (DU, non-national)

### Enseignants

  - `kpi.ENS.P.effectif` : *Enseignants* Effectif total enseignant
  - `kpi.ENS.S.titulaires` : *Titulaires* Effectif enseignant titulaire
  - `kpi.ENS.S.ECtitulaires` : *EC* Effectif enseignant-chercheur
    titulaire
  - `kpi.ENS.S.DocATER` : *Doc et ATER* Effectif doctorant et ATER
  - `kpi.ENS.S.LRU` : *LRU* Effectif contrat LRU

### Finances

  - `kpi.FIN.P.ressources` : *Ressources* Ressources totales (produits
    encaissables)
  - `kpi.FIN.S.masseSalariale` : *Masse salariale* Masse salariale
    (dépenses de personnels)
  - `kpi.FIN.S.SCSP` : *SCSP* Subvention pour charge de service public
    (dotation d’Etat directe)
  - `kpi.FIN.S.recettesFormation` : *Recettes formation* Droits
    d’inscription, Diplôme d’établissement, Formation continue, VAE et
    Taxe d’apprentissage
  - `kpi.FIN.S.recettesRecherche` : *Recettes recherche* Valorisation,
    ANR en et hors investissement d’avenir, contrats et prestations de
    recherche
  - `kpi.FIN.S.investissements` : *Investissements* Investissements
    (Acquisions d’immobilisation

### Indicateurs clés de performance

  - `kpi.K.resPetu` : *Ressources par étudiant* Ressources divisées par
    le nombre d’étudiants
  - `kpi.K.recPect` : *Recettes recherche par enseignant-chercheur*
    Recettes recherche divisées par le nombre d’enseignants-chercheurs
    titulaires
  - `kpi.K.forPetu` : *Recettes formation par étudiant* Recettes
    formation divisées par le nombre d’étudiants
  - `kpi.K.titPetu` : *Taux d’encadrement* Nombre d’enseignants
    titulaires pour 100 étudiants
  - `kpi.K.titPens` : *Taux de titularité* Part des titulaires dans les
    enseignants
  - `kpi.K.dotPres` : *Taux de SCSP* Part des Subventions pour charge de
    service public dans les ressources

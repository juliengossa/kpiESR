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

-   le type de Université de Lorraine est considéré comme *Université*,
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

    ##  [1] "Groupe"                      "UAI"                        
    ##  [3] "Etablissement"               "Type"                       
    ##  [5] "Rentrée"                     "kpi.ENS.P.effectif"         
    ##  [7] "kpi.ENS.S.titulaires"        "kpi.ENS.S.ECtitulaires"     
    ##  [9] "kpi.ENS.S.DocATER"           "kpi.ENS.S.LRU"              
    ## [11] "kpi.ETU.P.effectif"          "kpi.ETU.S.cycle1_L"         
    ## [13] "kpi.ETU.S.cycle2_M"          "kpi.ETU.S.cycle3_D"         
    ## [15] "kpi.ETU.S.DU_DE"             "kpi.FIN.P.ressources"       
    ## [17] "kpi.FIN.S.masseSalariale"    "kpi.FIN.S.SCSP"             
    ## [19] "kpi.FIN.S.recettesFormation" "kpi.FIN.S.recettesRecherche"
    ## [21] "kpi.FIN.S.investissements"   "kpi.K.dotPres"              
    ## [23] "kpi.K.resPetu"               "kpi.K.forPetu"              
    ## [25] "kpi.K.recPect"               "kpi.K.ensPetu"              
    ## [27] "kpi.K.titPens"

En plus du jeu de données `esr`, un autre jeu de donnée “long” est
disponible, ajoutant des valeurs normalisées :

``` r
colnames(kpiESR::esr.pnl)
```

    ##  [1] "Groupe"        "UAI"           "Etablissement" "Type"         
    ##  [5] "Rentrée"       "kpi"           "valeur"        "norm"         
    ##  [9] "valeur_label"  "norm_label"    "rang"          "evolution"

## Description de données

En plus des données explicite sur les établissements, cette librairie
ajoute :

### Etudiants

-   `kpi.ETU.P.effectif` : *Etudiants* Effectif total étudiant (Hors
    double inscription CPGE)
-   `kpi.ETU.S.cycle1_L` : *Cycle 1 (L)* Effectif étudiant inscrit en
    premier cycle (L, DUT, etc.)
-   `kpi.ETU.S.cycle2_M` : *Cycle 2 (M)* Effectif étudiant inscrit en
    deuxième cycle (M)
-   `kpi.ETU.S.cycle3_D` : *Cycle 3 (D)* Effectif étudiant inscrit en
    troisième cycle (Doctorat, HDR)
-   `kpi.ETU.S.DU_DE` : *DU* Effectif étudiant inscrit en diplôme
    d’établissement (DU, non-national)

### Enseignants

-   `kpi.ENS.P.effectif` : *Enseignants* Effectif total enseignant
-   `kpi.ENS.S.titulaires` : *Titulaires* Effectif enseignant titulaire
-   `kpi.ENS.S.ECtitulaires` : *EC* Effectif enseignant-chercheur
    titulaire
-   `kpi.ENS.S.DocATER` : *Doc et ATER* Effectif doctorant et ATER
-   `kpi.ENS.S.LRU` : *LRU et Associés* Effectif contrat LRU et
    Associés/Invités

### Finances

-   `kpi.FIN.P.ressources` : *Ressources* Ressources totales (produits
    encaissables)
-   `kpi.FIN.S.masseSalariale` : *Masse salariale* Masse salariale
    (dépenses de personnels)
-   `kpi.FIN.S.SCSP` : *SCSP* Subvention pour charge de service public
    (dotation d’Etat directe)
-   `kpi.FIN.S.recettesFormation` : *Recettes formation* Droits
    d’inscription, Diplôme d’établissement, Formation continue, VAE et
    Taxe d’apprentissage
-   `kpi.FIN.S.recettesRecherche` : *Recettes recherche* Valorisation,
    ANR en et hors investissement d’avenir, contrats et prestations de
    recherche

### Indicateurs clés de performance

-   `kpi.K.titPens` : *Taux de titularité* Part des titulaires dans les
    enseignants
-   `kpi.K.dotPres` : *Taux de SCSP* Part des Subventions pour charge de
    service public dans les ressources
-   `kpi.K.ensPetu` : *Taux d’encadrement* Nombre d’enseignants
    titulaires pour 100 étudiants en cycles 1 et 2
-   `kpi.K.resPetu` : *Ressources par étudiant* Ressources divisées par
    le nombre d’étudiants
-   `kpi.K.forPetu` : *Recetttes formation par étudiant* Recettes
    formation divisées par le nombre d’étudiants
-   `kpi.K.recPect` : *Recettes recherche par EC* Recettes recherche
    divisées par le nombre d’enseignants-chercheurs titulaires

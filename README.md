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
csv](dfr-cpesr-kpiesr.csv).

*Attention : ces données peuvent être en retard par rapport aux données
publiées sur \#DataESR*

## Modifications par rapport aux jeux de données originaux

Pour des raisons de cohérence des indicateurs, et compte tenu de la
diversité des profils, les modifications suivantes ont été apportées :

- le type de Université de Lorraine est considéré comme *Université*, au
  lieu de *Grand établissement*.

## Installation du paquet R

L’installation du paquet nécessite `devtools`.

``` r
devtools::install_github("cpesr/kpiESR")
```

Ensuite, un jeu de donnée est disponible :

``` r
colnames(kpiESR::esr)
```

    ##  [1] "Groupe"                      "pid"                        
    ##  [3] "Etablissement"               "Groupe.détaillé"            
    ##  [5] "Comparable"                  "Rentrée"                    
    ##  [7] "kpi.ENS.P.effectif"          "kpi.ENS.S.titulaires"       
    ##  [9] "kpi.ENS.S.EC"                "kpi.ENS.S.DocATER"          
    ## [11] "kpi.ENS.S.contractuels"      "kpi.ETU.P.effectif"         
    ## [13] "kpi.ETU.S.cycle1_L"          "kpi.ETU.S.cycle2_M"         
    ## [15] "kpi.ETU.S.cycle3_D"          "kpi.ETU.S.DU_DE"            
    ## [17] "kpi.BIA.P.effectif"          "kpi.BIA.S.A"                
    ## [19] "kpi.BIA.S.B"                 "kpi.BIA.S.C"                
    ## [21] "kpi.BIA.S.titulaires"        "kpi.FIN.P.ressources"       
    ## [23] "kpi.FIN.S.masseSalariale"    "kpi.FIN.S.SCSP"             
    ## [25] "kpi.FIN.S.recettesFormation" "kpi.FIN.S.recettesRecherche"
    ## [27] "kpi.FIN.S.investissements"   "kpi.IMO.P.batiments"        
    ## [29] "kpi.IMO.S.état_satisfaisant" "kpi.IMO.S.énergie_ABC"      
    ## [31] "kpi.IMO.S.GES_ABC"           "kpi.IMO.S.propriété_propre" 
    ## [33] "kpi.K.dotPres"               "kpi.K.resPetu"              
    ## [35] "kpi.K.forPetu"               "kpi.K.recPect"              
    ## [37] "kpi.K.ensPetu"               "kpi.K.titPper"              
    ## [39] "kpi.K.biaPper"               "kpi.K.dotPetu"

En plus du jeu de données `esr`, un autre jeu de donnée “long” est
disponible, ajoutant des valeurs normalisées :

``` r
colnames(kpiESR::esr.pnl)
```

    ##  [1] "Groupe"          "pid"             "Etablissement"   "Groupe.détaillé"
    ##  [5] "Comparable"      "Rentrée"         "kpi"             "valeur"         
    ##  [9] "norm"            "valeur_label"    "norm_label"      "rang"           
    ## [13] "evolution"

## Description de données

En plus des données explicite sur les établissements, cette librairie
ajoute :

### Etudiants

- `kpi.ETU.P.effectif` : *Etudiants* Effectif total étudiant (Hors
  double inscription CPGE)
- `kpi.ETU.S.cycle1_L` : *Cycle 1 (L)* Effectif étudiant inscrit en
  premier cycle (L, DUT, etc.)
- `kpi.ETU.S.cycle2_M` : *Cycle 2 (M)* Effectif étudiant inscrit en
  deuxième cycle (M)
- `kpi.ETU.S.cycle3_D` : *Cycle 3 (D)* Effectif étudiant inscrit en
  troisième cycle (Doctorat, HDR)
- `kpi.ETU.S.DU_DE` : *DU* Effectif étudiant inscrit en diplôme
  d’établissement (DU, non-national)

### Enseignants

- `kpi.ENS.P.effectif` : *Enseignants* Effectif total enseignant
- `kpi.ENS.S.titulaires` : *Titulaires* Effectif titulaire
- `kpi.ENS.S.EC` : *EC* Effectif enseignant-chercheur
- `kpi.ENS.S.DocATER` : *Doc et ATER* Effectif doctorant et ATER
- `kpi.ENS.S.contractuels` : *Autres contractuels* Effectif autres
  contractuels

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
- `kpi.FIN.S.recettesRecherche` : *Recettes recherche* Valorisation, ANR
  en et hors investissement d’avenir, contrats et prestations de
  recherche

### Indicateurs clés de performance

- `kpi.K.titPper` : *Taux de titularité* Part des titulaires dans les
  personnels
- `kpi.K.dotPres` : *Taux de SCSP* Part des Subventions pour charge de
  service public (SCSP) dans les ressources
- `kpi.K.ensPetu` : *Taux d’encadrement pédagogique* Nombre
  d’enseignants (titulaires et contractuels, hors doctorants et
  vacataires) pour 100 étudiants en cycles 1 et 2
- `kpi.K.biaPper` : *Taux d’encadrement administratif* Part des
  personnels BIATSS dans les personnels
- `kpi.K.resPetu` : *Ressources par étudiant* Ressources divisées par le
  nombre d’étudiants
- `kpi.K.forPetu` : *Recettes formation par étudiant* Recettes formation
  divisées par le nombre d’étudiants
- `kpi.K.recPect` : *Recettes recherche par EC* Recettes recherche
  divisées par le nombre d’enseignants-chercheurs (titulaires et
  contractuels)

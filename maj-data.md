Mise à jour des données
================
2023-01-03

Ce document décrit le processus de mise à jour des données kpiESR, et
notamment la constitution d’un jeu de données des établissements, et la
fusion de cinq jeux de données (enseignants titulaires, enseignants non
permanents, personnel BIATSS, étudiants et finances).

Ces jeux sont notés `etab`, `ens.tit`, `ens.np`, `bia`, `etu` et `fin`.

Le jeu de données sur les patrimoines immobilier est ajouté de façon
expérimentale : `imo`

La constitution du jeu de données `etab` est effectuées [à
part](maj-mapping.md).

## Méthodologie :

1.  Constitution du jeu de données `esr.etab` sur les établissements
2.  Vérification et fix des non correspondances des id paysages (`pid`)
3.  Vérification et fix des données manquantes
4.  Fusion des données DataESR et CPESR
5.  Constitution des jeux de données `esr`
    1.  Fusion de `ens.tit`, `ens.np`, `bia`, `etu`, `fin` et `imo`
    2.  Vérification d’éventuels problèmes de fusion
    3.  Vérification des outliers
6.  Ecriture des données

### Attention

Les données sont agrégées à trois échelles : *Ensemble*, *Groupe* et
*Etablissement*, avec trois méthodes de constitution des périmètres
d’aggrégation :

- *Ensemble* agrège toutes les données dans tous les jeux : sa cohérence
  dépend de la cohérence du périmètre des jeux de données ;
- *Groupe* agrège les données des établissements classés dans chaque
  groupe, selon deux approches différentes :
  - pour les universités, toutes les données disponibles sont agrégées
    (c’est indispensable pour surmonter les nombreuses modifications de
    périmètre internes à ce groupe) ;
  - pour les autres groupes, seules les données des établissements dont
    toutes les données sont disponibles sur toute la période étudiées
    (ce afin d’éviter d’avoir des séries impactées par les changements
    de périmètre);
- *Etablissement* agrège les données de chaque établissement, sur les
  périodes et périmètres disponibles (et est donc impacté par les
  changement de périmètres).

## Fusion de `ens.tit`, `ens.np`, `bia`, `etu`, `fin` et `imo`

### Lecture des données

<details>
<summary>
Voir les données
</summary>

| data | Rentrée.min | Rentrée.max | nb_pid |
|:-----|------------:|------------:|-------:|
| ens  |        2010 |        2020 |    134 |
| bia  |        2015 |        2021 |    152 |
| etu  |        2006 |        2021 |    132 |
| fin  |        2009 |        2021 |    155 |
| imo  |        2016 |        2021 |    160 |

</details>

### Fusion des données

### Vérification des outliers

#### Vérification manuelle pour les universités

<details>
<summary>
Voir les données
</summary>

##### kpi.ENS.S.titulaires

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi                  | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:---------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| TWBzp | Université Panthéon-Assas                | FALSE      | kpi.ENS.S.titulaires |    296 | 0.4498480 | 296          | 45%        |   69 |  98.66667 |
| PpsCQ | Université Paris sciences et lettres     | FALSE      | kpi.ENS.S.titulaires |    779 | 0.5379834 | 779          | 54%        |   68 |  99.23567 |
| 6G2TU | Université Paris 1 - Panthéon Sorbonne   | TRUE       | kpi.ENS.S.titulaires |    811 | 0.5442953 | 811          | 54%        |   67 |  97.00957 |
| 542Id | Université Toulouse Capitole             | TRUE       | kpi.ENS.S.titulaires |    349 | 0.5797342 | 349          | 58%        |   66 |  97.21448 |
| Mz286 | Université de Pau et des Pays de l’Adour | TRUE       | kpi.ENS.S.titulaires |    561 | 0.6064865 | 561          | 61%        |   65 |  95.24618 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                | Comparable | kpi                  | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------|:-----------|:---------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis | TRUE       | kpi.ENS.S.titulaires |    712 | 0.7964206 | 712          | 80%        |    4 |  98.88889 |
| 7Mpgt | Université de Franche-Comté                  | TRUE       | kpi.ENS.S.titulaires |   1067 | 0.8046757 | 1 067        | 80%        |    3 |  97.35401 |
| cEt92 | Université de La Réunion                     | FALSE      | kpi.ENS.S.titulaires |    445 | 0.8120438 | 445          | 81%        |    2 | 103.48837 |
| pVJpw | Centre universitaire de Mayotte              | FALSE      | kpi.ENS.S.titulaires |     40 | 0.8163265 | 40           | 82%        |    1 | 266.66667 |
| C6Ps7 | Université Paris Dauphine - PSL              | FALSE      | kpi.ENS.S.titulaires |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ENS.S.EC

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi          | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:-------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| hy4EW | Université de Guyane                   | FALSE      | kpi.ENS.S.EC |     64 | 0.4475524 | 64           | 45%        |   69 | 112.28070 |
| HCBvW | Université d’Orléans                   | TRUE       | kpi.ENS.S.EC |    595 | 0.5076792 | 595          | 51%        |   68 |  86.23188 |
| pVJpw | Centre universitaire de Mayotte        | FALSE      | kpi.ENS.S.EC |     25 | 0.5102041 | 25           | 51%        |   67 | 357.14286 |
| 5tVy4 | Université Bretagne Sud                | TRUE       | kpi.ENS.S.EC |    288 | 0.5433962 | 288          | 54%        |   66 | 107.86517 |
| 6G2TU | Université Paris 1 - Panthéon Sorbonne | TRUE       | kpi.ENS.S.EC |    816 | 0.5476510 | 816          | 55%        |   65 |  93.47079 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi          | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:-------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| 1I7hJ | Université Paul-Valéry - Montpellier 3             | TRUE       | kpi.ENS.S.EC |    525 | 0.6981383 | 525          | 70%        |    4 | 113.88286 |
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.ENS.S.EC |    599 | 0.7287105 | 599          | 73%        |    3 | 105.64374 |
| Mz90U | Université Bordeaux Montaigne                      | TRUE       | kpi.ENS.S.EC |    516 | 0.7360913 | 516          | 74%        |    2 | 111.44708 |
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis       | TRUE       | kpi.ENS.S.EC |    678 | 0.7583893 | 678          | 76%        |    1 |  93.90582 |
| C6Ps7 | Université Paris Dauphine - PSL                    | FALSE      | kpi.ENS.S.EC |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ENS.S.DocATER

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                | Comparable | kpi               | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------|:-----------|:------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| cEt92 | Université de La Réunion                     | FALSE      | kpi.ENS.S.DocATER |     45 | 0.0821168 | 45           | 8%         |   69 |  95.74468 |
| RS4WF | CY Cergy Paris Université                    | FALSE      | kpi.ENS.S.DocATER |     95 | 0.0864422 | 95           | 9%         |   68 |  65.51724 |
| pVJpw | Centre universitaire de Mayotte              | FALSE      | kpi.ENS.S.DocATER |      5 | 0.1020408 | 5            | 10%        |   67 |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie          | FALSE      | kpi.ENS.S.DocATER |     13 | 0.1140351 | 13           | 11%        |   66 | 162.50000 |
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis | TRUE       | kpi.ENS.S.DocATER |    106 | 0.1185682 | 106          | 12%        |   65 |  64.63415 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi               | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| TWBzp | Université Panthéon-Assas              | FALSE      | kpi.ENS.S.DocATER |    230 | 0.3495441 | 230          | 35%        |    4 | 121.69312 |
| bxPQe | Sorbonne Université                    | TRUE       | kpi.ENS.S.DocATER |   1449 | 0.3539326 | 1 449        | 35%        |    3 |  94.89195 |
| 6G2TU | Université Paris 1 - Panthéon Sorbonne | TRUE       | kpi.ENS.S.DocATER |    571 | 0.3832215 | 571          | 38%        |    2 | 124.40087 |
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.ENS.S.DocATER |    559 | 0.3860497 | 559          | 39%        |    1 | 100.35907 |
| C6Ps7 | Université Paris Dauphine - PSL        | FALSE      | kpi.ENS.S.DocATER |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ENS.S.contractuels

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                           | Comparable | kpi                    | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:----------------------------------------|:-----------|:-----------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| evv7S | Université de Montpellier               | TRUE       | kpi.ENS.S.contractuels |     56 | 0.0228478 | 56           | 2%         |   69 | 160.00000 |
| bxPQe | Sorbonne Université                     | TRUE       | kpi.ENS.S.contractuels |     96 | 0.0234489 | 96           | 2%         |   68 |  74.41860 |
| 5cZyU | Université de Paris                     | TRUE       | kpi.ENS.S.contractuels |     95 | 0.0251656 | 95           | 3%         |   67 |  52.48619 |
| m7K6T | Université Toulouse III - Paul Sabatier | TRUE       | kpi.ENS.S.contractuels |     72 | 0.0294840 | 72           | 3%         |   66 | 107.46269 |
| t6Cq5 | Université de Lorraine                  | TRUE       | kpi.ENS.S.contractuels |    124 | 0.0335952 | 124          | 3%         |   65 |  85.51724 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                      | Comparable | kpi                    | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------|:-----------|:-----------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| NLCOF | Université de Corse Pasquale Paoli | FALSE      | kpi.ENS.S.contractuels |     65 | 0.1836158 | 65           | 18%        |    4 |  151.1628 |
| TWBzp | Université Panthéon-Assas          | FALSE      | kpi.ENS.S.contractuels |    124 | 0.1884498 | 124          | 19%        |    3 |   80.0000 |
| Mz90U | Université Bordeaux Montaigne      | TRUE       | kpi.ENS.S.contractuels |    135 | 0.1925820 | 135          | 19%        |    2 |  254.7170 |
| RS4WF | CY Cergy Paris Université          | FALSE      | kpi.ENS.S.contractuels |    325 | 0.2957234 | 325          | 30%        |    1 |  524.1935 |
| C6Ps7 | Université Paris Dauphine - PSL    | FALSE      | kpi.ENS.S.contractuels |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ETU.S.cycle1_L

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:-------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.ETU.S.cycle1_L |   4229 | 0.2409824 | 4 229        | 24%        |   69 |        NA |
| G2qA7 | Université Paris-Saclay              | FALSE      | kpi.ETU.S.cycle1_L |  18721 | 0.3933148 | 18 721       | 39%        |   68 |  131.3017 |
| etBz7 | Université Claude Bernard - Lyon 1   | TRUE       | kpi.ETU.S.cycle1_L |  21505 | 0.4818076 | 21 505       | 48%        |   67 |  129.6185 |
| 5cZyU | Université de Paris                  | TRUE       | kpi.ETU.S.cycle1_L |  27242 | 0.4931125 | 27 242       | 49%        |   66 |  108.0517 |
| bxPQe | Sorbonne Université                  | TRUE       | kpi.ETU.S.cycle1_L |  26157 | 0.5067418 | 26 157       | 51%        |   65 |  118.8630 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                       | Comparable | kpi                | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:------------------------------------|:-----------|:-------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| Z2FY5 | Université de la Nouvelle-Calédonie | FALSE      | kpi.ETU.S.cycle1_L |   3298 | 0.9133204 | 3 298        | 91%        |    4 |  138.1651 |
| HAU8L | Université de Nîmes                 | TRUE       | kpi.ETU.S.cycle1_L |   4940 | 0.9183863 | 4 940        | 92%        |    3 |  150.6557 |
| RN4E6 | Université d’Évry-Val-d’Essonne     | FALSE      | kpi.ETU.S.cycle1_L |   6743 | 0.9475829 | 6 743        | 95%        |    2 |  102.8523 |
| pVJpw | Centre universitaire de Mayotte     | FALSE      | kpi.ETU.S.cycle1_L |   1256 | 1.0000000 | 1 256        | 100%       |    1 |  174.6871 |
| C6Ps7 | Université Paris Dauphine - PSL     | FALSE      | kpi.ETU.S.cycle1_L |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ETU.S.cycle2_M

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:-------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.ETU.S.cycle2_M |      0 | 0.0000000 | 0            | 0%         |   69 |        NA |
| RN4E6 | Université d’Évry-Val-d’Essonne      | FALSE      | kpi.ETU.S.cycle2_M |    358 | 0.0503092 | 358          | 5%         |   68 |  18.08081 |
| Z2FY5 | Université de la Nouvelle-Calédonie  | FALSE      | kpi.ETU.S.cycle2_M |    266 | 0.0736638 | 266          | 7%         |   67 | 148.60335 |
| HAU8L | Université de Nîmes                  | TRUE       | kpi.ETU.S.cycle2_M |    401 | 0.0745492 | 401          | 7%         |   66 | 153.05344 |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.ETU.S.cycle2_M |    378 | 0.1292750 | 378          | 13%        |   65 |  86.10478 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:-------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| 5cZyU | Université de Paris                  | TRUE       | kpi.ETU.S.cycle2_M |  25571 | 0.4628654 | 25 571       | 46%        |    4 |  96.76455 |
| etBz7 | Université Claude Bernard - Lyon 1   | TRUE       | kpi.ETU.S.cycle2_M |  21709 | 0.4863781 | 21 709       | 49%        |    3 | 126.12712 |
| G2qA7 | Université Paris-Saclay              | FALSE      | kpi.ETU.S.cycle2_M |  24733 | 0.5196227 | 24 733       | 52%        |    2 | 236.02443 |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.ETU.S.cycle2_M |  11104 | 0.6327426 | 11 104       | 63%        |    1 |        NA |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.ETU.S.cycle2_M |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ETU.S.cycle3_D

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi                | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:-------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte                    | FALSE      | kpi.ETU.S.cycle3_D |      0 | 0.0000000 | 0            | 0%         |   68 |        NA |
| 7Mpgt | Université de Franche-Comté                        | TRUE       | kpi.ETU.S.cycle3_D |      0 | 0.0000000 | 0            | 0%         |   68 | 0.0000000 |
| Lr94O | Université de Bourgogne                            | TRUE       | kpi.ETU.S.cycle3_D |      1 | 0.0000314 | 1            | 0%         |   67 | 0.0919963 |
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.ETU.S.cycle3_D |      1 | 0.0000664 | 1            | 0%         |   66 | 0.1416431 |
| RN4E6 | Université d’Évry-Val-d’Essonne                    | FALSE      | kpi.ETU.S.cycle3_D |     15 | 0.0021079 | 15           | 0%         |   65 | 6.1475410 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:-------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| 6G2TU | Université Paris 1 - Panthéon Sorbonne | TRUE       | kpi.ETU.S.cycle3_D |   2256 | 0.0566009 | 2 256        | 6%         |    4 |  82.39591 |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.ETU.S.cycle3_D |    890 | 0.0569126 | 890          | 6%         |    3 |  62.50000 |
| G2qA7 | Université Paris-Saclay                | FALSE      | kpi.ETU.S.cycle3_D |   4144 | 0.0870625 | 4 144        | 9%         |    2 | 161.62246 |
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.ETU.S.cycle3_D |   2216 | 0.1262750 | 2 216        | 13%        |    1 | 839.39394 |
| C6Ps7 | Université Paris Dauphine - PSL        | FALSE      | kpi.ETU.S.cycle3_D |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ETU.S.DU_DE

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi             | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:----------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| 5tVy4 | Université Bretagne Sud                  | TRUE       | kpi.ETU.S.DU_DE |     43 | 0.0039819 | 43           | 0%         |   69 |  67.18750 |
| BWbvP | Université d’Artois                      | TRUE       | kpi.ETU.S.DU_DE |    100 | 0.0068055 | 100          | 1%         |   68 | 121.95122 |
| yH19Y | Université du Littoral Côte d’Opale      | TRUE       | kpi.ETU.S.DU_DE |     94 | 0.0083489 | 94           | 1%         |   67 |  92.15686 |
| 3Z5e6 | Université Gustave Eiffel                | FALSE      | kpi.ETU.S.DU_DE |    136 | 0.0086663 | 136          | 1%         |   66 |        NA |
| EW53M | Université Polytechnique Hauts-de-France | TRUE       | kpi.ETU.S.DU_DE |    143 | 0.0108325 | 143          | 1%         |   65 | 269.81132 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi             | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:----------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| evv7S | Université de Montpellier              | TRUE       | kpi.ETU.S.DU_DE |   5030 | 0.1050236 | 5 030        | 11%        |    4 |  133.5280 |
| 6G2TU | Université Paris 1 - Panthéon Sorbonne | TRUE       | kpi.ETU.S.DU_DE |   4474 | 0.1122485 | 4 474        | 11%        |    3 |  173.7476 |
| TWBzp | Université Panthéon-Assas              | FALSE      | kpi.ETU.S.DU_DE |   3000 | 0.1588142 | 3 000        | 16%        |    2 |  104.3841 |
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.ETU.S.DU_DE |   3667 | 0.2089578 | 3 667        | 21%        |    1 |        NA |
| C6Ps7 | Université Paris Dauphine - PSL        | FALSE      | kpi.ETU.S.DU_DE |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.BIA.S.A

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi         | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| 8j5s2 | Université de Picardie Jules-Verne   | TRUE       | kpi.BIA.S.A |    231 | 0.2156863 | 231          | 22%        |   69 | 119.68912 |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.BIA.S.A |     28 | 0.2545455 | 28           | 25%        |   68 | 107.69231 |
| LsQ24 | Université Le Havre Normandie        | TRUE       | kpi.BIA.S.A |    105 | 0.2685422 | 105          | 27%        |   67 |  92.10526 |
| hlX1r | Université de Poitiers               | TRUE       | kpi.BIA.S.A |    323 | 0.2691667 | 323          | 27%        |   66 | 102.21519 |
| g6rwB | Université Paris Nanterre            | TRUE       | kpi.BIA.S.A |    304 | 0.2699822 | 304          | 27%        |   65 | 110.94891 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi         | valeur |      norm | valeur_label | norm_label | rang |  evolution |
|:------|:-------------------------------------|:-----------|:------------|-------:|----------:|:-------------|:-----------|-----:|-----------:|
| 3Z5e6 | Université Gustave Eiffel            | FALSE      | kpi.BIA.S.A |    299 | 0.4550989 | 299          | 46%        |    4 |   173.8372 |
| 5tVy4 | Université Bretagne Sud              | TRUE       | kpi.BIA.S.A |    210 | 0.4794521 | 210          | 48%        |    3 |   105.0000 |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.BIA.S.A |    831 | 0.4828588 | 831          | 48%        |    2 | 16620.0000 |
| G2qA7 | Université Paris-Saclay              | FALSE      | kpi.BIA.S.A |   1404 | 0.5205784 | 1 404        | 52%        |    1 |   342.4390 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.BIA.S.A |     NA |        NA | N/A          | N/A        |   NA |         NA |

</details>

##### kpi.BIA.S.B

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                      | Comparable | kpi         | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------|:-----------|:------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| 5tVy4 | Université Bretagne Sud            | TRUE       | kpi.BIA.S.B |     69 | 0.1575342 | 69           | 16%        |   69 |  87.34177 |
| 8j5s2 | Université de Picardie Jules-Verne | TRUE       | kpi.BIA.S.B |    189 | 0.1764706 | 189          | 18%        |   68 | 113.85542 |
| atbEK | La Rochelle Université             | TRUE       | kpi.BIA.S.B |     82 | 0.1933962 | 82           | 19%        |   67 |  93.18182 |
| G2qA7 | Université Paris-Saclay            | FALSE      | kpi.BIA.S.B |    526 | 0.1950315 | 526          | 20%        |   66 | 136.62338 |
| zCa4j | Université Savoie Mont Blanc       | TRUE       | kpi.BIA.S.B |    118 | 0.1973244 | 118          | 20%        |   65 | 105.35714 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi         | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| cEt92 | Université de La Réunion             | FALSE      | kpi.BIA.S.B |    243 | 0.3351724 | 243          | 34%        |    4 |  132.0652 |
| NLCOF | Université de Corse Pasquale Paoli   | FALSE      | kpi.BIA.S.B |    128 | 0.3377309 | 128          | 34%        |    3 |  120.7547 |
| 3Z5e6 | Université Gustave Eiffel            | FALSE      | kpi.BIA.S.B |    251 | 0.3820396 | 251          | 38%        |    2 |  121.8447 |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.BIA.S.B |     59 | 0.5363636 | 59           | 54%        |    1 |  115.6863 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.BIA.S.B |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.BIA.S.C

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                | Comparable | kpi         | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------|:-----------|:------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| 3Z5e6 | Université Gustave Eiffel                    | FALSE      | kpi.BIA.S.C |    107 | 0.1628615 | 107          | 16%        |   69 | 100.00000 |
| zepT6 | Université de la Polynésie Française         | FALSE      | kpi.BIA.S.C |     23 | 0.2090909 | 23           | 21%        |   68 |  88.46154 |
| PpsCQ | Université Paris sciences et lettres         | FALSE      | kpi.BIA.S.C |    360 | 0.2091807 | 360          | 21%        |   67 |        NA |
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis | TRUE       | kpi.BIA.S.C |    198 | 0.2601840 | 198          | 26%        |   66 |  80.81633 |
| G2qA7 | Université Paris-Saclay                      | FALSE      | kpi.BIA.S.C |    767 | 0.2843901 | 767          | 28%        |   65 |  75.12243 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                       | Comparable | kpi         | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:------------------------------------|:-----------|:------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| LsQ24 | Université Le Havre Normandie       | TRUE       | kpi.BIA.S.C |    192 | 0.4910486 | 192          | 49%        |    4 | 109.09091 |
| yH19Y | Université du Littoral Côte d’Opale | TRUE       | kpi.BIA.S.C |    265 | 0.5038023 | 265          | 50%        |    3 |  89.22559 |
| g6rwB | Université Paris Nanterre           | TRUE       | kpi.BIA.S.C |    592 | 0.5257549 | 592          | 53%        |    2 | 166.76056 |
| 8j5s2 | Université de Picardie Jules-Verne  | TRUE       | kpi.BIA.S.C |    651 | 0.6078431 | 651          | 61%        |    1 | 108.86288 |
| C6Ps7 | Université Paris Dauphine - PSL     | FALSE      | kpi.BIA.S.C |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.BIA.S.titulaires

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                  | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:---------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.BIA.S.titulaires |     17 | 0.4146341 | 17           | 41%        |   68 | 340.00000 |
| s3t8T | Université Côte d’Azur               | TRUE       | kpi.BIA.S.titulaires |    780 | 0.4921136 | 780          | 49%        |   67 |  96.41533 |
| RS4WF | CY Cergy Paris Université            | FALSE      | kpi.BIA.S.titulaires |    474 | 0.4922118 | 474          | 49%        |   66 | 120.91837 |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.BIA.S.titulaires |     55 | 0.5000000 | 55           | 50%        |   65 | 114.58333 |
| 9xlel | Le Mans Université                   | TRUE       | kpi.BIA.S.titulaires |    281 | 0.5026834 | 281          | 50%        |   64 | 102.18182 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi                  | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:---------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| EW53M | Université Polytechnique Hauts-de-France | TRUE       | kpi.BIA.S.titulaires |    448 | 0.7777778 | 448          | 78%        |    3 |  101.3575 |
| z3hdL | Université des Antilles                  | FALSE      | kpi.BIA.S.titulaires |    373 | 0.7987152 | 373          | 80%        |    2 |  108.4302 |
| HqAYu | Université Toulouse - Jean Jaurès        | TRUE       | kpi.BIA.S.titulaires |    703 | 0.8099078 | 703          | 81%        |    1 |  100.1425 |
| hy4EW | Université de Guyane                     | FALSE      | kpi.BIA.S.titulaires |     NA |        NA | N/A          | N/A        |   NA |        NA |
| C6Ps7 | Université Paris Dauphine - PSL          | FALSE      | kpi.BIA.S.titulaires |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.masseSalariale

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                      |   valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:-------------------------|---------:|----------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.FIN.S.masseSalariale |  6578841 | 0.1701237 | 6.6M€        | 17%        |   70 |  87.42316 |
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.FIN.S.masseSalariale |  1123669 | 0.2970245 | 1.1M€        | 30%        |   69 | 130.94117 |
| OJZ4a | Université de Haute-Alsace           | FALSE      | kpi.FIN.S.masseSalariale | 75204512 | 0.6892673 | 75M€         | 69%        |   68 | 112.87389 |
| HAU8L | Université de Nîmes                  | TRUE       | kpi.FIN.S.masseSalariale | 17554663 | 0.6939769 | 17.6M€       | 69%        |   67 | 152.23590 |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.FIN.S.masseSalariale | 25003250 | 0.7249814 | 25M€         | 72%        |   66 | 122.14111 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                | Comparable | kpi                      |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------|:-----------|:-------------------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis | TRUE       | kpi.FIN.S.masseSalariale | 122530166 | 0.8303669 | 123M€        | 83%        |    5 |  110.4479 |
| 9xlel | Le Mans Université                           | TRUE       | kpi.FIN.S.masseSalariale |  77986259 | 0.8415432 | 78M€         | 84%        |    4 |  115.6075 |
| CUBKB | Université Lumière - Lyon 2                  | TRUE       | kpi.FIN.S.masseSalariale | 123463473 | 0.8432538 | 123M€        | 84%        |    3 |  112.5645 |
| ti37C | Université Rennes 2                          | TRUE       | kpi.FIN.S.masseSalariale |  99273019 | 0.8468281 | 99M€         | 85%        |    2 |  117.3387 |
| z3hdL | Université des Antilles                      | FALSE      | kpi.FIN.S.masseSalariale |  86534166 | 0.8607130 | 87M€         | 86%        |    1 |  102.9912 |

</details>

##### kpi.FIN.S.SCSP

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi            |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:---------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.FIN.S.SCSP |   7255748 | 0.1876280 | 7.3M€        | 19%        |   70 |  318.0200 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.FIN.S.SCSP |  60130925 | 0.5640561 | 60M€         | 56%        |   69 |  104.2648 |
| 4k25D | Université de Strasbourg             | TRUE       | kpi.FIN.S.SCSP | 353249677 | 0.6956115 | 353M€        | 70%        |   68 |  108.2964 |
| NLCOF | Université de Corse Pasquale Paoli   | FALSE      | kpi.FIN.S.SCSP |  42647032 | 0.7088546 | 43M€         | 71%        |   67 |  119.7974 |
| 90I54 | Université de Bordeaux               | TRUE       | kpi.FIN.S.SCSP | 346957910 | 0.7134303 | 347M€        | 71%        |   66 |  107.7963 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi            |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:---------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| g6rwB | Université Paris Nanterre              | TRUE       | kpi.FIN.S.SCSP | 178641295 | 0.9034349 | 179M€        | 90%        |    5 |  111.0560 |
| zepT6 | Université de la Polynésie Française   | FALSE      | kpi.FIN.S.SCSP |  31260315 | 0.9064081 | 31M€         | 91%        |    4 |  132.4562 |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.FIN.S.SCSP | 100510960 | 0.9087107 | 101M€        | 91%        |    3 |  109.9329 |
| z3hdL | Université des Antilles                | FALSE      | kpi.FIN.S.SCSP |  91537029 | 0.9104740 | 92M€         | 91%        |    2 |  100.8592 |
| HqAYu | Université Toulouse - Jean Jaurès      | TRUE       | kpi.FIN.S.SCSP | 170451027 | 0.9344111 | 170M€        | 93%        |    1 |  118.8514 |

</details>

##### kpi.FIN.S.recettesFormation

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi                         |  valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:----------------------------|--------:|----------:|:-------------|:-----------|-----:|----------:|
| atbEK | La Rochelle Université                   | TRUE       | kpi.FIN.S.recettesFormation | 2024807 | 0.0248823 | 2M€          | 2%         |   65 |  98.04639 |
| n1W55 | Université de Perpignan Via Domitia      | TRUE       | kpi.FIN.S.recettesFormation | 2165355 | 0.0270364 | 2.2M€        | 3%         |   64 |  76.65785 |
| Mz286 | Université de Pau et des Pays de l’Adour | TRUE       | kpi.FIN.S.recettesFormation | 4084370 | 0.0303902 | 4.1M€        | 3%         |   63 |  71.71187 |
| 7Mpgt | Université de Franche-Comté              | TRUE       | kpi.FIN.S.recettesFormation | 6510742 | 0.0319483 | 6.5M€        | 3%         |   62 | 109.98992 |
| cEt92 | Université de La Réunion                 | FALSE      | kpi.FIN.S.recettesFormation | 4356823 | 0.0334699 | 4.4M€        | 3%         |   61 |  77.41514 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:----------------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie  | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles              | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.recettesRecherche

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                      | Comparable | kpi                         |  valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------|:-----------|:----------------------------|--------:|----------:|:-------------|:-----------|-----:|----------:|
| hy4EW | Université de Guyane               | FALSE      | kpi.FIN.S.recettesRecherche |    8625 | 0.0002636 | 0.01M€       | 0%         |   64 |        NA |
| LsQ24 | Université Le Havre Normandie      | TRUE       | kpi.FIN.S.recettesRecherche |  382086 | 0.0052147 | 0.38M€       | 1%         |   63 |  72.67809 |
| NLCOF | Université de Corse Pasquale Paoli | FALSE      | kpi.FIN.S.recettesRecherche |  322640 | 0.0053627 | 0.32M€       | 1%         |   62 | 220.27123 |
| 7Gzub | Université Jean Moulin - Lyon 3    | TRUE       | kpi.FIN.S.recettesRecherche |  764434 | 0.0059946 | 0.76M€       | 1%         |   61 | 723.08107 |
| HqAYu | Université Toulouse - Jean Jaurès  | TRUE       | kpi.FIN.S.recettesRecherche | 1283346 | 0.0070353 | 1.3M€        | 1%         |   60 |  90.63405 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:----------------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles              | FALSE      | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| tIJ02 | Université Jean Monnet               | TRUE       | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| CUBKB | Université Lumière - Lyon 2          | TRUE       | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| TWBzp | Université Panthéon-Assas            | FALSE      | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.investissements

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                       |  valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------------------|--------:|----------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.FIN.S.investissements |   15590 | 0.0004031 | 0.02M€       | 0%         |   69 | 185.59524 |
| TWBzp | Université Panthéon-Assas              | FALSE      | kpi.FIN.S.investissements | 2454654 | 0.0254421 | 2.5M€        | 3%         |   68 |  64.95792 |
| 6G2TU | Université Paris 1 - Panthéon Sorbonne | TRUE       | kpi.FIN.S.investissements | 5988758 | 0.0260818 | 6M€          | 3%         |   67 | 258.79738 |
| cqyN7 | Université Sorbonne Paris Nord         | TRUE       | kpi.FIN.S.investissements | 5657147 | 0.0302435 | 5.7M€        | 3%         |   66 |  56.33038 |
| Mz90U | Université Bordeaux Montaigne          | TRUE       | kpi.FIN.S.investissements | 3228324 | 0.0326516 | 3.2M€        | 3%         |   65 | 206.15170 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                       |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| HAU8L | Université de Nîmes                    | TRUE       | kpi.FIN.S.investissements |   7282154 | 0.2878806 | 7.3M€        | 29%        |    4 |  731.3556 |
| cqkij | Université de Tours                    | TRUE       | kpi.FIN.S.investissements | 158266325 | 0.7576714 | 158M€        | 76%        |    3 | 1685.3047 |
| 1I7hJ | Université Paul-Valéry - Montpellier 3 | TRUE       | kpi.FIN.S.investissements | 203204620 | 1.7839985 | 203M€        | 178%       |    2 | 9649.6415 |
| G2qA7 | Université Paris-Saclay                | FALSE      | kpi.FIN.S.investissements | 932270725 | 2.3180325 | 932M€        | 232%       |    1 | 2510.3590 |
| hy4EW | Université de Guyane                   | FALSE      | kpi.FIN.S.investissements |        NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.IMO.S.état_satisfaisant

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                      | Comparable | kpi                         | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------|:-----------|:----------------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte    | FALSE      | kpi.IMO.S.état_satisfaisant |      0 | 0.0000000 | 0            | 0%         |   67 |        NA |
| hy4EW | Université de Guyane               | FALSE      | kpi.IMO.S.état_satisfaisant |      0 | 0.0000000 | 0            | 0%         |   67 |        NA |
| C6Ps7 | Université Paris Dauphine - PSL    | FALSE      | kpi.IMO.S.état_satisfaisant |      0 | 0.0000000 | 0            | 0%         |   67 |        NA |
| NLCOF | Université de Corse Pasquale Paoli | FALSE      | kpi.IMO.S.état_satisfaisant |      2 | 0.0645161 | 2            | 6%         |   66 |  200.0000 |
| 3Z5e6 | Université Gustave Eiffel          | FALSE      | kpi.IMO.S.état_satisfaisant |     10 | 0.0934579 | 10           | 9%         |   65 |  142.8571 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                         | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:----------------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| 542Id | Université Toulouse Capitole         | TRUE       | kpi.IMO.S.état_satisfaisant |     28 | 0.9333333 | 28           | 93%        |    4 | 107.69231 |
| hlX1r | Université de Poitiers               | TRUE       | kpi.IMO.S.état_satisfaisant |    133 | 0.9568345 | 133          | 96%        |    3 |  99.25373 |
| tIJ02 | Université Jean Monnet               | TRUE       | kpi.IMO.S.état_satisfaisant |     51 | 0.9807692 | 51           | 98%        |    2 | 108.51064 |
| BWbvP | Université d’Artois                  | TRUE       | kpi.IMO.S.état_satisfaisant |     35 | 1.0000000 | 35           | 100%       |    1 | 100.00000 |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.IMO.S.état_satisfaisant |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.IMO.S.énergie_ABC

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                | Comparable | kpi                   | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------|:-----------|:----------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte              | FALSE      | kpi.IMO.S.énergie_ABC |      0 |    0 | 0            | 0%         |   62 |        NA |
| hy4EW | Université de Guyane                         | FALSE      | kpi.IMO.S.énergie_ABC |      0 |    0 | 0            | 0%         |   62 |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie          | FALSE      | kpi.IMO.S.énergie_ABC |      0 |    0 | 0            | 0%         |   62 |        NA |
| 7Gzub | Université Jean Moulin - Lyon 3              | TRUE       | kpi.IMO.S.énergie_ABC |      0 |    0 | 0            | 0%         |   62 |        NA |
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis | TRUE       | kpi.IMO.S.énergie_ABC |      0 |    0 | 0            | 0%         |   62 |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi                   | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:----------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| yH19Y | Université du Littoral Côte d’Opale      | TRUE       | kpi.IMO.S.énergie_ABC |     36 | 0.8000000 | 36           | 80%        |    4 |  156.5217 |
| Mz286 | Université de Pau et des Pays de l’Adour | TRUE       | kpi.IMO.S.énergie_ABC |     38 | 0.8444444 | 38           | 84%        |    3 |        NA |
| 1I7hJ | Université Paul-Valéry - Montpellier 3   | TRUE       | kpi.IMO.S.énergie_ABC |     47 | 0.9400000 | 47           | 94%        |    2 |  109.3023 |
| LsQ24 | Université Le Havre Normandie            | TRUE       | kpi.IMO.S.énergie_ABC |     19 | 1.0000000 | 19           | 100%       |    1 |  100.0000 |
| PpsCQ | Université Paris sciences et lettres     | FALSE      | kpi.IMO.S.énergie_ABC |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.IMO.S.GES_ABC

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi               | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.IMO.S.GES_ABC |      0 |    0 | 0            | 0%         |   61 |        NA |
| hy4EW | Université de Guyane                 | FALSE      | kpi.IMO.S.GES_ABC |      0 |    0 | 0            | 0%         |   61 |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie  | FALSE      | kpi.IMO.S.GES_ABC |      0 |    0 | 0            | 0%         |   61 |        NA |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.IMO.S.GES_ABC |      0 |    0 | 0            | 0%         |   61 |        NA |
| HAU8L | Université de Nîmes                  | TRUE       | kpi.IMO.S.GES_ABC |      0 |    0 | 0            | 0%         |   61 |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi               | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| 542Id | Université Toulouse Capitole             | TRUE       | kpi.IMO.S.GES_ABC |     25 | 0.8333333 | 25           | 83%        |    4 | 131.57895 |
| yH19Y | Université du Littoral Côte d’Opale      | TRUE       | kpi.IMO.S.GES_ABC |     38 | 0.8444444 | 38           | 84%        |    3 | 115.15152 |
| Mz286 | Université de Pau et des Pays de l’Adour | TRUE       | kpi.IMO.S.GES_ABC |     39 | 0.8666667 | 39           | 87%        |    2 |        NA |
| LsQ24 | Université Le Havre Normandie            | TRUE       | kpi.IMO.S.GES_ABC |     18 | 0.9473684 | 18           | 95%        |    1 |  94.73684 |
| PpsCQ | Université Paris sciences et lettres     | FALSE      | kpi.IMO.S.GES_ABC |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.IMO.S.propriété_propre

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement           | Comparable | kpi                        | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:------------------------|:-----------|:---------------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| atbEK | La Rochelle Université  | TRUE       | kpi.IMO.S.propriété_propre |      0 |    0 | 0            | 0%         |   42 |        NA |
| 9xlel | Le Mans Université      | TRUE       | kpi.IMO.S.propriété_propre |      0 |    0 | 0            | 0%         |   42 |        NA |
| 5tVy4 | Université Bretagne Sud | TRUE       | kpi.IMO.S.propriété_propre |      0 |    0 | 0            | 0%         |   42 |        NA |
| BWbvP | Université d’Artois     | TRUE       | kpi.IMO.S.propriété_propre |      0 |    0 | 0            | 0%         |   42 |        NA |
| HCBvW | Université d’Orléans    | TRUE       | kpi.IMO.S.propriété_propre |      0 |    0 | 0            | 0%         |   42 |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                        | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:---------------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.IMO.S.propriété_propre |      3 | 0.7500000 | 3            | 75%        |    4 |        NA |
| hlX1r | Université de Poitiers               | TRUE       | kpi.IMO.S.propriété_propre |    122 | 0.8776978 | 122          | 88%        |    3 |  100.0000 |
| RN4E6 | Université d’Évry-Val-d’Essonne      | FALSE      | kpi.IMO.S.propriété_propre |     15 | 0.9375000 | 15           | 94%        |    2 |  107.1429 |
| 542Id | Université Toulouse Capitole         | TRUE       | kpi.IMO.S.propriété_propre |     30 | 1.0000000 | 30           | 100%       |    1 |  103.4483 |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.IMO.S.propriété_propre |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.dotPres

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.K.dotPres | 0.1876280 | 0.1876280 | 19%          | 19%        |   70 |  78.96041 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.K.dotPres | 0.5640561 | 0.5640561 | 56%          | 56%        |   69 |  90.04251 |
| 4k25D | Université de Strasbourg             | TRUE       | kpi.K.dotPres | 0.6956115 | 0.6956115 | 70%          | 70%        |   68 |  91.84971 |
| NLCOF | Université de Corse Pasquale Paoli   | FALSE      | kpi.K.dotPres | 0.7088546 | 0.7088546 | 71%          | 71%        |   67 | 103.78854 |
| 90I54 | Université de Bordeaux               | TRUE       | kpi.K.dotPres | 0.7134303 | 0.7134303 | 71%          | 71%        |   66 |  97.65525 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| g6rwB | Université Paris Nanterre              | TRUE       | kpi.K.dotPres | 0.9034349 | 0.9034349 | 90%          | 90%        |    5 |  102.0114 |
| zepT6 | Université de la Polynésie Française   | FALSE      | kpi.K.dotPres | 0.9064081 | 0.9064081 | 91%          | 91%        |    4 |  101.4304 |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.K.dotPres | 0.9087107 | 0.9087107 | 91%          | 91%        |    3 |  102.1414 |
| z3hdL | Université des Antilles                | FALSE      | kpi.K.dotPres | 0.9104740 | 0.9104740 | 91%          | 91%        |    2 |  102.3824 |
| HqAYu | Université Toulouse - Jean Jaurès      | TRUE       | kpi.K.dotPres | 0.9344111 | 0.9344111 | 93%          | 93%        |    1 |  104.7453 |

</details>

##### kpi.K.resPetu

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang |  evolution |
|:------|:-------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|-----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.K.resPetu | 2522.072 | 2522.072 | 3k€          | 3k€        |   69 |   9.847451 |
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.K.resPetu | 3012.010 | 3012.010 | 3k€          | 3k€        |   68 | 100.014182 |
| HAU8L | Université de Nîmes                  | TRUE       | kpi.K.resPetu | 4736.144 | 4736.144 | 5k€          | 5k€        |   67 | 107.083611 |
| 7Gzub | Université Jean Moulin - Lyon 3      | TRUE       | kpi.K.resPetu | 5159.809 | 5159.809 | 5k€          | 5k€        |   66 | 124.629224 |
| TWBzp | Université Panthéon-Assas            | FALSE      | kpi.K.resPetu | 5367.756 | 5367.756 | 5k€          | 5k€        |   65 |  97.824674 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                      | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| NLCOF | Université de Corse Pasquale Paoli | FALSE      | kpi.K.resPetu | 12838.95 | 12838.95 | 13k€         | 13k€       |    4 |  94.11804 |
| bxPQe | Sorbonne Université                | TRUE       | kpi.K.resPetu | 13406.22 | 13406.22 | 13k€         | 13k€       |    3 |  99.02131 |
| RN4E6 | Université d’Évry-Val-d’Essonne    | FALSE      | kpi.K.resPetu | 13418.53 | 13418.53 | 13k€         | 13k€       |    2 | 142.88041 |
| 3Z5e6 | Université Gustave Eiffel          | FALSE      | kpi.K.resPetu | 15736.90 | 15736.90 | 16k€         | 16k€       |    1 | 188.09230 |
| C6Ps7 | Université Paris Dauphine - PSL    | FALSE      | kpi.K.resPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.forPetu

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                       | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| HAU8L | Université de Nîmes                 | TRUE       | kpi.K.forPetu | 159.9472 | 159.9472 | 160€         | 160€       |   64 |  84.35607 |
| HqAYu | Université Toulouse - Jean Jaurès   | TRUE       | kpi.K.forPetu | 230.6532 | 230.6532 | 231€         | 231€       |   63 |  86.07615 |
| cEt92 | Université de La Réunion            | FALSE      | kpi.K.forPetu | 241.1081 | 241.1081 | 241€         | 241€       |   62 |  54.99174 |
| atbEK | La Rochelle Université              | TRUE       | kpi.K.forPetu | 248.3207 | 248.3207 | 248€         | 248€       |   61 |  87.98203 |
| n1W55 | Université de Perpignan Via Domitia | TRUE       | kpi.K.forPetu | 249.1491 | 249.1491 | 249€         | 249€       |   60 |  76.17273 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| Z2FY5 | Université de la Nouvelle-Calédonie  | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles              | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.recPect

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                      | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| hy4EW | Université de Guyane               | FALSE      | kpi.K.recPect |  134.7656 |  134.7656 | 0k€          | 0k€        |   63 | 100.00000 |
| LsQ24 | Université Le Havre Normandie      | TRUE       | kpi.K.recPect | 1540.6694 | 1540.6694 | 2k€          | 2k€        |   62 |  82.93508 |
| Mz90U | Université Bordeaux Montaigne      | TRUE       | kpi.K.recPect | 1562.2733 | 1562.2733 | 2k€          | 2k€        |   61 |  39.44835 |
| 7Gzub | Université Jean Moulin - Lyon 3    | TRUE       | kpi.K.recPect | 1609.3347 | 1609.3347 | 2k€          | 2k€        |   60 | 738.30383 |
| NLCOF | Université de Corse Pasquale Paoli | FALSE      | kpi.K.recPect | 1629.4949 | 1629.4949 | 2k€          | 2k€        |   59 | 213.59635 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| z3hdL | Université des Antilles         | FALSE      | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| tIJ02 | Université Jean Monnet          | TRUE       | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| CUBKB | Université Lumière - Lyon 2     | TRUE       | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| TWBzp | Université Panthéon-Assas       | FALSE      | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| C6Ps7 | Université Paris Dauphine - PSL | FALSE      | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.ensPetu

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| HAU8L | Université de Nîmes                    | TRUE       | kpi.K.ensPetu | 2.003370 | 2.003370 | 2.0          | 2.0        |   69 | 118.23223 |
| 542Id | Université Toulouse Capitole           | TRUE       | kpi.K.ensPetu | 2.098374 | 2.098374 | 2.1          | 2.1        |   68 |  96.90771 |
| 7Gzub | Université Jean Moulin - Lyon 3        | TRUE       | kpi.K.ensPetu | 2.278061 | 2.278061 | 2.3          | 2.3        |   67 |  97.85379 |
| TWBzp | Université Panthéon-Assas              | FALSE      | kpi.K.ensPetu | 2.336709 | 2.336709 | 2.3          | 2.3        |   66 |  79.71001 |
| 6G2TU | Université Paris 1 - Panthéon Sorbonne | TRUE       | kpi.K.ensPetu | 2.417425 | 2.417425 | 2.4          | 2.4        |   65 |  85.13517 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                           | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:----------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres    | FALSE      | kpi.K.ensPetu | 5.732733 | 5.732733 | 5.7          | 5.7        |    4 |  94.40144 |
| m7K6T | Université Toulouse III - Paul Sabatier | TRUE       | kpi.K.ensPetu | 5.734461 | 5.734461 | 5.7          | 5.7        |    3 |  83.23842 |
| RN4E6 | Université d’Évry-Val-d’Essonne         | FALSE      | kpi.K.ensPetu | 6.111815 | 6.111815 | 6.1          | 6.1        |    2 | 119.11063 |
| NLCOF | Université de Corse Pasquale Paoli      | FALSE      | kpi.K.ensPetu | 6.209987 | 6.209987 | 6.2          | 6.2        |    1 |  82.39014 |
| C6Ps7 | Université Paris Dauphine - PSL         | FALSE      | kpi.K.ensPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.titPper

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| TWBzp | Université Panthéon-Assas              | FALSE      | kpi.K.titPper | 0.5237643 | 0.5237643 | 52%          | 52%        |   68 |  99.94854 |
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.K.titPper | 0.5377091 | 0.5377091 | 54%          | 54%        |   67 |  94.50739 |
| 6G2TU | Université Paris 1 - Panthéon Sorbonne | TRUE       | kpi.K.titPper | 0.5524428 | 0.5524428 | 55%          | 55%        |   66 |  98.39545 |
| RS4WF | CY Cergy Paris Université              | FALSE      | kpi.K.titPper | 0.5577110 | 0.5577110 | 56%          | 56%        |   65 |  83.63011 |
| 3Z5e6 | Université Gustave Eiffel              | FALSE      | kpi.K.titPper | 0.5660237 | 0.5660237 | 57%          | 57%        |   64 |  84.74321 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| HqAYu | Université Toulouse - Jean Jaurès        | TRUE       | kpi.K.titPper | 0.7776184 | 0.7776184 | 78%          | 78%        |    3 |  101.2701 |
| EW53M | Université Polytechnique Hauts-de-France | TRUE       | kpi.K.titPper | 0.7855960 | 0.7855960 | 79%          | 79%        |    2 |  100.9466 |
| z3hdL | Université des Antilles                  | FALSE      | kpi.K.titPper | 0.7922211 | 0.7922211 | 79%          | 79%        |    1 |  103.8645 |
| hy4EW | Université de Guyane                     | FALSE      | kpi.K.titPper |        NA |        NA | N/A          | N/A        |   NA |        NA |
| C6Ps7 | Université Paris Dauphine - PSL          | FALSE      | kpi.K.titPper |        NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.biaPper

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                           | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:----------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| hy4EW | Université de Guyane                    | FALSE      | kpi.K.biaPper | 0.3728070 | 0.3728070 | 37%          | 37%        |   69 |  67.37888 |
| TWBzp | Université Panthéon-Assas               | FALSE      | kpi.K.biaPper | 0.3745247 | 0.3745247 | 37%          | 37%        |   68 |  99.59166 |
| cqyN7 | Université Sorbonne Paris Nord          | TRUE       | kpi.K.biaPper | 0.3915046 | 0.3915046 | 39%          | 39%        |   67 |  98.99545 |
| m7K6T | Université Toulouse III - Paul Sabatier | TRUE       | kpi.K.biaPper | 0.4074254 | 0.4074254 | 41%          | 41%        |   66 |  90.72521 |
| HqAYu | Université Toulouse - Jean Jaurès       | TRUE       | kpi.K.biaPper | 0.4151124 | 0.4151124 | 42%          | 42%        |   65 | 103.10390 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| Z2FY5 | Université de la Nouvelle-Calédonie  | FALSE      | kpi.K.biaPper | 0.5189873 | 0.5189873 | 52%          | 52%        |    4 |  128.5492 |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.K.biaPper | 0.5430735 | 0.5430735 | 54%          | 54%        |    3 |  108.8680 |
| 90I54 | Université de Bordeaux               | TRUE       | kpi.K.biaPper | 0.5478705 | 0.5478705 | 55%          | 55%        |    2 |  101.0690 |
| cEt92 | Université de La Réunion             | FALSE      | kpi.K.biaPper | 0.5695208 | 0.5695208 | 57%          | 57%        |    1 |  101.4551 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.K.biaPper |        NA |        NA | N/A          | N/A        |   NA |        NA |

</details>
</details>

#### Détection automatique

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                                                                                                |
|:------|:-----------------------------------------------------------------------------------------------------------------------------|
| hy4EW | Université de Guyane                                                                                                         |
| TWBzp | Université Panthéon-Assas                                                                                                    |
| cqyN7 | Université Sorbonne Paris Nord                                                                                               |
| 6g0Mb | Paris-Est Sup                                                                                                                |
| 8A0mg | Université Bourgogne - Franche-Comté                                                                                         |
| 86UpY | Université Paris Lumières                                                                                                    |
| XR16q | Conservatoire national des arts et métiers                                                                                   |
| dPmxa | École nationale d’ingénieurs de Brest                                                                                        |
| dj88d | Institut national des sciences appliquées de Toulouse                                                                        |
| wp55m | IAE Paris - Sorbonne Business School                                                                                         |
| 13fXQ | École nationale supérieure Louis Lumière                                                                                     |
| TSGYA | École française d’Extrême-Orient                                                                                             |
| kWved | École normale supérieure de Lyon                                                                                             |
| j5bS4 | École normale supérieure de Rennes                                                                                           |
| u79ZJ | Sciences Po                                                                                                                  |
| 0Mvk5 | Collège de France                                                                                                            |
| SsRkf | École des hautes études en santé publique                                                                                    |
| y52D7 | École des hautes études en sciences sociales                                                                                 |
| 59da6 | École nationale supérieure des sciences de l’information et des bibliothèques                                                |
| a2a9U | Institut national supérieur de formation et de recherche pour l’éducation des jeunes handicapés et les enseignements adaptés |
| VaJ52 | Muséum national d’histoire naturelle                                                                                         |
| zHvr4 | École nationale supérieure des arts et techniques du théâtre                                                                 |

</details>

## Ecriture des données

[kpiesr.csv](kpiesr.csv)

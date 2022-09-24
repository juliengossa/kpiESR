Mise à jour des données
================
2022-09-24

Ce document décrit le processus de mise à jour des données kpiESR, et
notamment la constitution d’un jeu de données des établissements, et la
fusion de cinq jeux de données (enseignants titulaires, enseignants non
permanents, personnel BIATSS, étudiants et finances).

Ces jeux sont notés `etab`, `ens.tit`, `ens.np`, `bia`, `etu` et `fin`.

La constitution du jeu de données `etab` est effectuées [à
part](maj-mapping.md).

## Méthodologie :

1.  Constitution du jeu de données `esr.etab` sur les établissements
2.  Vérification et fix des non correspondances des id paysages (`pid`)
3.  Vérification et fix des données manquantes
4.  Fusion des données DataESR et CPESR
5.  Constitution des jeux de données `esr`
    1.  Fusion de `ens.tit`, `ens.np`, `bia`, `etu` et `fin`
    2.  Vérification d’éventuels problèmes de fusion
    3.  Vérification des outliers
6.  Ecriture des données

### Attention

Les données sont agrégées à trois échelles : *Ensemble*, *Groupe* et
*Etablissement*, avec trois méthodes de constitution des périmètres
d’aggrégation :

-   *Ensemble* agrège toutes les données dans tous les jeux : sa
    cohérence dépend de la cohérence du périmètre des jeux de données ;
-   *Groupe* agrège les données des établissements classés dans chaque
    groupe, selon deux approches différentes :
    -   pour les universités, toutes les données disponibles sont
        agrégées (c’est indispensable pour surmonter les nombreuses
        modifications de périmètre internes à ce groupe) ;
    -   pour les autres groupes, seules les données des établissements
        dont toutes les données sont disponibles sur toute la période
        étudiées (ce afin d’éviter d’avoir des séries impactées par les
        changements de périmètre);
-   *Etablissement* agrège les données de chaque établissement, sur les
    périodes et périmètres disponibles (et est donc impacté par les
    changement de périmètres).

## Fusion de `ens.tit`, `ens.np`, `bia`, `etu` et `fin`

### Lecture des données

<details>
<summary>
Voir les données
</summary>

| data | Rentrée.min | Rentrée.max | nb_pid |
|:-----|------------:|------------:|-------:|
| ens  |        2010 |        2020 |    134 |
| bia  |        2015 |        2020 |    151 |
| etu  |        2006 |        2021 |    132 |
| fin  |        2009 |        2020 |    151 |

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

| pid   | Etablissement                        | Comparable | kpi                      |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:-------------------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.FIN.S.masseSalariale |    973558 | 0.2451429 | 0.97M€       | 25%        |   69 |  113.4487 |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.FIN.S.masseSalariale |   7801315 | 0.2454767 | 7.8M€        | 25%        |   68 |  103.6680 |
| G2qA7 | Université Paris-Saclay              | FALSE      | kpi.FIN.S.masseSalariale | 303108699 | 0.6593211 | 303M€        | 66%        |   67 |  112.2846 |
| OJZ4a | Université de Haute-Alsace           | FALSE      | kpi.FIN.S.masseSalariale |  78438736 | 0.7298157 | 78M€         | 73%        |   66 |  117.7281 |
| 90I54 | Université de Bordeaux               | TRUE       | kpi.FIN.S.masseSalariale | 360769177 | 0.7330255 | 361M€        | 73%        |   65 |  109.3173 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                      |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:-------------------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| 8j5s2 | Université de Picardie Jules-Verne     | TRUE       | kpi.FIN.S.masseSalariale | 164612927 | 0.8524966 | 165M€        | 85%        |    4 |  114.4881 |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.FIN.S.masseSalariale |  93419472 | 0.8544209 | 93M€         | 85%        |    3 |  111.3980 |
| 9xlel | Le Mans Université                     | TRUE       | kpi.FIN.S.masseSalariale |  81155063 | 0.8733263 | 81M€         | 87%        |    2 |  120.3050 |
| z3hdL | Université des Antilles                | FALSE      | kpi.FIN.S.masseSalariale |  86865230 | 0.9152736 | 87M€         | 92%        |    1 |  103.3852 |
| hy4EW | Université de Guyane                   | FALSE      | kpi.FIN.S.masseSalariale |        NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.SCSP

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi            |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:---------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.FIN.S.SCSP |   5655538 | 0.1779575 | 5.7M€        | 18%        |   69 | 247.88270 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.FIN.S.SCSP |  58948444 | 0.5332336 | 59M€         | 53%        |   68 | 102.21442 |
| G2qA7 | Université Paris-Saclay              | FALSE      | kpi.FIN.S.SCSP | 292147888 | 0.6354791 | 292M€        | 64%        |   67 | 105.17227 |
| 3Z5e6 | Université Gustave Eiffel            | FALSE      | kpi.FIN.S.SCSP | 167835605 | 0.6611975 | 168M€        | 66%        |   66 | 236.08225 |
| evv7S | Université de Montpellier            | TRUE       | kpi.FIN.S.SCSP | 301007987 | 0.6668295 | 301M€        | 67%        |   65 |  52.63335 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi            |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:---------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| g6rwB | Université Paris Nanterre            | TRUE       | kpi.FIN.S.SCSP | 172844627 | 0.8770781 | 173M€        | 88%        |    4 | 107.45239 |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.FIN.S.SCSP |  27527087 | 0.8874647 | 28M€         | 89%        |    3 | 116.63773 |
| z3hdL | Université des Antilles              | FALSE      | kpi.FIN.S.SCSP |  87962627 | 0.9268366 | 88M€         | 93%        |    2 |  96.92083 |
| HqAYu | Université Toulouse - Jean Jaurès    | TRUE       | kpi.FIN.S.SCSP | 168777374 | 0.9302635 | 169M€        | 93%        |    1 | 117.68440 |
| hy4EW | Université de Guyane                 | FALSE      | kpi.FIN.S.SCSP |        NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.recettesFormation

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi                         |  valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:----------------------------|--------:|----------:|:-------------|:-----------|-----:|----------:|
| EW53M | Université Polytechnique Hauts-de-France | TRUE       | kpi.FIN.S.recettesFormation | 2646600 | 0.0256900 | 2.6M€        | 3%         |   64 |  62.87272 |
| atbEK | La Rochelle Université                   | TRUE       | kpi.FIN.S.recettesFormation | 2331929 | 0.0266417 | 2.3M€        | 3%         |   63 | 112.91804 |
| LsQ24 | Université Le Havre Normandie            | TRUE       | kpi.FIN.S.recettesFormation | 2033176 | 0.0269655 | 2M€          | 3%         |   62 |  74.33889 |
| 7Mpgt | Université de Franche-Comté              | TRUE       | kpi.FIN.S.recettesFormation | 5986260 | 0.0286804 | 6M€          | 3%         |   61 | 101.12952 |
| hlX1r | Université de Poitiers                   | TRUE       | kpi.FIN.S.recettesFormation | 7153909 | 0.0298099 | 7.2M€        | 3%         |   60 |  75.46837 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:----------------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| Z2FY5 | Université de la Nouvelle-Calédonie  | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |
| 3Z5e6 | Université Gustave Eiffel            | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vb71K | Université Paris-Est Créteil         | TRUE       | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.recettesRecherche

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                      | Comparable | kpi                         | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------|:-----------|:----------------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| cEt92 | Université de La Réunion           | FALSE      | kpi.FIN.S.recettesRecherche | 100915 | 0.0007301 | 0.1M€        | 0%         |   53 | 17.497205 |
| NLCOF | Université de Corse Pasquale Paoli | FALSE      | kpi.FIN.S.recettesRecherche |  55910 | 0.0008994 | 0.06M€       | 0%         |   52 | 38.170607 |
| pVJpw | Centre universitaire de Mayotte    | FALSE      | kpi.FIN.S.recettesRecherche |   4824 | 0.0012147 | 0M€          | 0%         |   51 |  4.794037 |
| z3hdL | Université des Antilles            | FALSE      | kpi.FIN.S.recettesRecherche | 257545 | 0.0027137 | 0.26M€       | 0%         |   50 | 64.406377 |
| TWBzp | Université Panthéon-Assas          | FALSE      | kpi.FIN.S.recettesRecherche | 463000 | 0.0051441 | 0.46M€       | 1%         |   49 | 57.085046 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:----------------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vb71K | Université Paris-Est Créteil           | TRUE       | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| HqAYu | Université Toulouse - Jean Jaurès      | TRUE       | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| 542Id | Université Toulouse Capitole           | TRUE       | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.investissements

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                       |  valeur |      norm | valeur_label | norm_label | rang |  evolution |
|:------|:---------------------------------------|:-----------|:--------------------------|--------:|----------:|:-------------|:-----------|-----:|-----------:|
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.FIN.S.investissements |  110000 | 0.0034613 | 0.11M€       | 0%         |   69 | 1309.52381 |
| 6G2TU | Université Paris 1 - Panthéon Sorbonne | TRUE       | kpi.FIN.S.investissements | 6622927 | 0.0291324 | 6.6M€        | 3%         |   68 |  286.20227 |
| TWBzp | Université Panthéon-Assas              | FALSE      | kpi.FIN.S.investissements | 3385000 | 0.0376086 | 3.4M€        | 4%         |   67 |   89.57782 |
| cqyN7 | Université Sorbonne Paris Nord         | TRUE       | kpi.FIN.S.investissements | 7914057 | 0.0422872 | 7.9M€        | 4%         |   66 |   78.80330 |
| 06SE7 | Université de Bretagne Occidentale     | TRUE       | kpi.FIN.S.investissements | 8500000 | 0.0462208 | 8.5M€        | 5%         |   65 |   70.13606 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                       |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| G2qA7 | Université Paris-Saclay                | FALSE      | kpi.FIN.S.investissements | 149429640 | 0.3250389 | 149M€        | 33%        |    4 |  402.3746 |
| pVJpw | Centre universitaire de Mayotte        | FALSE      | kpi.FIN.S.investissements |   1292045 | 0.3253382 | 1.3M€        | 33%        |    3 |  130.6524 |
| NLCOF | Université de Corse Pasquale Paoli     | FALSE      | kpi.FIN.S.investissements |  20227756 | 0.3253796 | 20M€         | 33%        |    2 |  183.4615 |
| 1I7hJ | Université Paul-Valéry - Montpellier 3 | TRUE       | kpi.FIN.S.investissements |  49307839 | 0.4337391 | 49M€         | 43%        |    1 | 2341.4968 |
| hy4EW | Université de Guyane                   | FALSE      | kpi.FIN.S.investissements |        NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.dotPres

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.K.dotPres | 0.1779575 | 0.1779575 | 18%          | 18%        |   69 |  74.89074 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.K.dotPres | 0.5332336 | 0.5332336 | 53%          | 53%        |   68 |  85.12220 |
| G2qA7 | Université Paris-Saclay              | FALSE      | kpi.K.dotPres | 0.6354791 | 0.6354791 | 64%          | 64%        |   67 |  74.01923 |
| 3Z5e6 | Université Gustave Eiffel            | FALSE      | kpi.K.dotPres | 0.6611975 | 0.6611975 | 66%          | 66%        |   66 |  80.90341 |
| evv7S | Université de Montpellier            | TRUE       | kpi.K.dotPres | 0.6668295 | 0.6668295 | 67%          | 67%        |   65 |  82.57334 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| g6rwB | Université Paris Nanterre            | TRUE       | kpi.K.dotPres | 0.8770781 | 0.8770781 | 88%          | 88%        |    4 |  99.03534 |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.K.dotPres | 0.8874647 | 0.8874647 | 89%          | 89%        |    3 |  99.31054 |
| z3hdL | Université des Antilles              | FALSE      | kpi.K.dotPres | 0.9268366 | 0.9268366 | 93%          | 93%        |    2 | 104.22239 |
| HqAYu | Université Toulouse - Jean Jaurès    | TRUE       | kpi.K.dotPres | 0.9302635 | 0.9302635 | 93%          | 93%        |    1 | 104.28033 |
| hy4EW | Université de Guyane                 | FALSE      | kpi.K.dotPres |        NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.resPetu

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang |  evolution |
|:------|:-------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|-----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.K.resPetu | 2072.671 | 2072.671 | 2k€          | 2k€        |   68 |   8.092762 |
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.K.resPetu | 3161.935 | 3161.935 | 3k€          | 3k€        |   67 | 104.992439 |
| HAU8L | Université de Nîmes                  | TRUE       | kpi.K.resPetu | 4352.507 | 4352.507 | 4k€          | 4k€        |   66 |  98.409628 |
| 7Gzub | Université Jean Moulin - Lyon 3      | TRUE       | kpi.K.resPetu | 4835.527 | 4835.527 | 5k€          | 5k€        |   65 | 116.796572 |
| TWBzp | Université Panthéon-Assas            | FALSE      | kpi.K.resPetu | 5007.566 | 5007.566 | 5k€          | 5k€        |   64 |  91.260400 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                      | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| NLCOF | Université de Corse Pasquale Paoli | FALSE      | kpi.K.resPetu | 13266.46 | 13266.46 | 13k€         | 13k€       |    3 |  97.25202 |
| bxPQe | Sorbonne Université                | TRUE       | kpi.K.resPetu | 14656.02 | 14656.02 | 15k€         | 15k€       |    2 | 108.25265 |
| 3Z5e6 | Université Gustave Eiffel          | FALSE      | kpi.K.resPetu | 16617.73 | 16617.73 | 17k€         | 17k€       |    1 | 198.62017 |
| hy4EW | Université de Guyane               | FALSE      | kpi.K.resPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |
| C6Ps7 | Université Paris Dauphine - PSL    | FALSE      | kpi.K.resPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.forPetu

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| HAU8L | Université de Nîmes                      | TRUE       | kpi.K.forPetu | 181.7884 | 181.7884 | 182€         | 182€       |   63 |  95.87512 |
| EW53M | Université Polytechnique Hauts-de-France | TRUE       | kpi.K.forPetu | 200.4848 | 200.4848 | 200€         | 200€       |   62 |  47.76536 |
| pVJpw | Centre universitaire de Mayotte          | FALSE      | kpi.K.forPetu | 209.0764 | 209.0764 | 209€         | 209€       |   61 |  96.40397 |
| 8j5s2 | Université de Picardie Jules-Verne       | TRUE       | kpi.K.forPetu | 223.7356 | 223.7356 | 224€         | 224€       |   60 |  76.79295 |
| hlX1r | Université de Poitiers                   | TRUE       | kpi.K.forPetu | 240.4837 | 240.4837 | 240€         | 240€       |   59 |  59.28788 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| 3Z5e6 | Université Gustave Eiffel            | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vb71K | Université Paris-Est Créteil         | TRUE       | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.recPect

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                      | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte    | FALSE      | kpi.K.recPect |  192.9600 |  192.9600 | 0k€          | 0k€        |   52 |   3.83523 |
| NLCOF | Université de Corse Pasquale Paoli | FALSE      | kpi.K.recPect |  282.3737 |  282.3737 | 0k€          | 0k€        |   51 |  37.01392 |
| cEt92 | Université de La Réunion           | FALSE      | kpi.K.recPect |  289.9856 |  289.9856 | 0k€          | 0k€        |   50 |  16.79329 |
| z3hdL | Université des Antilles            | FALSE      | kpi.K.recPect |  755.2639 |  755.2639 | 1k€          | 1k€        |   49 |  56.28475 |
| TWBzp | Université Panthéon-Assas          | FALSE      | kpi.K.recPect | 1265.0273 | 1265.0273 | 1k€          | 1k€        |   48 |  62.54400 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vb71K | Université Paris-Est Créteil           | TRUE       | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| HqAYu | Université Toulouse - Jean Jaurès      | TRUE       | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| 542Id | Université Toulouse Capitole           | TRUE       | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |

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
| cqyN7 | Université Sorbonne Paris Nord          | TRUE       | kpi.K.biaPper | 0.3918159 | 0.3918159 | 39%          | 39%        |   67 |  99.07415 |
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

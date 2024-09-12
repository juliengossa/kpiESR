Mise à jour des données
================
2024-09-06

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
d’agrégation :

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
| ens  |        2010 |        2021 |    134 |
| bia  |        2015 |        2021 |    152 |
| etu  |        2006 |        2022 |    132 |
| fin  |        2009 |        2023 |    156 |
| imo  |        2016 |        2022 |    160 |

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

| pid   | Etablissement                   | Comparable | kpi                  | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:---------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| xJdyB | Aix-Marseille Université        | TRUE       | kpi.ENS.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vxHYt | Avignon Université              | TRUE       | kpi.ENS.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| RS4WF | CY Cergy Paris Université       | FALSE      | kpi.ENS.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| pVJpw | Centre universitaire de Mayotte | FALSE      | kpi.ENS.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| atbEK | La Rochelle Université          | TRUE       | kpi.ENS.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi                  | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:---------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.ENS.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie                | FALSE      | kpi.ENS.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française               | FALSE      | kpi.ENS.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                            | FALSE      | kpi.ENS.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| yH19Y | Université du Littoral Côte d’Opale                | TRUE       | kpi.ENS.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ENS.S.EC

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi          | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:-------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| xJdyB | Aix-Marseille Université        | TRUE       | kpi.ENS.S.EC |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vxHYt | Avignon Université              | TRUE       | kpi.ENS.S.EC |     NA |   NA | N/A          | N/A        |   NA |        NA |
| RS4WF | CY Cergy Paris Université       | FALSE      | kpi.ENS.S.EC |     NA |   NA | N/A          | N/A        |   NA |        NA |
| pVJpw | Centre universitaire de Mayotte | FALSE      | kpi.ENS.S.EC |     NA |   NA | N/A          | N/A        |   NA |        NA |
| atbEK | La Rochelle Université          | TRUE       | kpi.ENS.S.EC |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi          | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:-------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.ENS.S.EC |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie                | FALSE      | kpi.ENS.S.EC |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française               | FALSE      | kpi.ENS.S.EC |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                            | FALSE      | kpi.ENS.S.EC |     NA |   NA | N/A          | N/A        |   NA |        NA |
| yH19Y | Université du Littoral Côte d’Opale                | TRUE       | kpi.ENS.S.EC |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ENS.S.DocATER

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi               | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| xJdyB | Aix-Marseille Université        | TRUE       | kpi.ENS.S.DocATER |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vxHYt | Avignon Université              | TRUE       | kpi.ENS.S.DocATER |     NA |   NA | N/A          | N/A        |   NA |        NA |
| RS4WF | CY Cergy Paris Université       | FALSE      | kpi.ENS.S.DocATER |     NA |   NA | N/A          | N/A        |   NA |        NA |
| pVJpw | Centre universitaire de Mayotte | FALSE      | kpi.ENS.S.DocATER |     NA |   NA | N/A          | N/A        |   NA |        NA |
| atbEK | La Rochelle Université          | TRUE       | kpi.ENS.S.DocATER |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi               | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.ENS.S.DocATER |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie                | FALSE      | kpi.ENS.S.DocATER |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française               | FALSE      | kpi.ENS.S.DocATER |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                            | FALSE      | kpi.ENS.S.DocATER |     NA |   NA | N/A          | N/A        |   NA |        NA |
| yH19Y | Université du Littoral Côte d’Opale                | TRUE       | kpi.ENS.S.DocATER |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ENS.S.contractuels

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi                    | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:-----------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| xJdyB | Aix-Marseille Université        | TRUE       | kpi.ENS.S.contractuels |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vxHYt | Avignon Université              | TRUE       | kpi.ENS.S.contractuels |     NA |   NA | N/A          | N/A        |   NA |        NA |
| RS4WF | CY Cergy Paris Université       | FALSE      | kpi.ENS.S.contractuels |     NA |   NA | N/A          | N/A        |   NA |        NA |
| pVJpw | Centre universitaire de Mayotte | FALSE      | kpi.ENS.S.contractuels |     NA |   NA | N/A          | N/A        |   NA |        NA |
| atbEK | La Rochelle Université          | TRUE       | kpi.ENS.S.contractuels |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi                    | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:-----------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.ENS.S.contractuels |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie                | FALSE      | kpi.ENS.S.contractuels |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française               | FALSE      | kpi.ENS.S.contractuels |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                            | FALSE      | kpi.ENS.S.contractuels |     NA |   NA | N/A          | N/A        |   NA |        NA |
| yH19Y | Université du Littoral Côte d’Opale                | TRUE       | kpi.ENS.S.contractuels |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ETU.S.cycle1_L

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:-------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.ETU.S.cycle1_L |   4326 | 0.2408820 | 4 326        | 24%        |   69 |        NA |
| G2qA7 | Université Paris-Saclay              | FALSE      | kpi.ETU.S.cycle1_L |  16291 | 0.3481132 | 16 291       | 35%        |   68 | 114.25866 |
| etBz7 | Université Claude Bernard - Lyon 1   | TRUE       | kpi.ETU.S.cycle1_L |  16061 | 0.4061757 | 16 061       | 41%        |   67 |  96.80550 |
| 5cZyU | Université de Paris                  | TRUE       | kpi.ETU.S.cycle1_L |  24493 | 0.4205384 | 24 493       | 42%        |   66 |  97.14818 |
| bxPQe | Sorbonne Université                  | TRUE       | kpi.ETU.S.cycle1_L |  21808 | 0.4448796 | 21 808       | 44%        |   65 |  99.10025 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                       | Comparable | kpi                | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:------------------------------------|:-----------|:-------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| HAU8L | Université de Nîmes                 | TRUE       | kpi.ETU.S.cycle1_L |   4867 | 0.9024662 | 4 867        | 90%        |    4 | 148.42940 |
| Z2FY5 | Université de la Nouvelle-Calédonie | FALSE      | kpi.ETU.S.cycle1_L |   3162 | 0.9202561 | 3 162        | 92%        |    3 | 132.46753 |
| RN4E6 | Université d’Évry-Val-d’Essonne     | FALSE      | kpi.ETU.S.cycle1_L |   5893 | 0.9312579 | 5 893        | 93%        |    2 |  89.88713 |
| pVJpw | Centre universitaire de Mayotte     | FALSE      | kpi.ETU.S.cycle1_L |   1359 | 1.0000000 | 1 359        | 100%       |    1 | 189.01252 |
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
| Z2FY5 | Université de la Nouvelle-Calédonie  | FALSE      | kpi.ETU.S.cycle2_M |    230 | 0.0669383 | 230          | 7%         |   68 | 128.49162 |
| RN4E6 | Université d’Évry-Val-d’Essonne      | FALSE      | kpi.ETU.S.cycle2_M |    434 | 0.0685841 | 434          | 7%         |   67 |  21.91919 |
| HAU8L | Université de Nîmes                  | TRUE       | kpi.ETU.S.cycle2_M |    489 | 0.0906731 | 489          | 9%         |   66 | 186.64122 |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.ETU.S.cycle2_M |    345 | 0.1336691 | 345          | 13%        |   65 |  78.58770 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:-------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| 5cZyU | Université de Paris                  | TRUE       | kpi.ETU.S.cycle2_M |  30894 | 0.5304419 | 30 894       | 53%        |    4 |  116.9076 |
| etBz7 | Université Claude Bernard - Lyon 1   | TRUE       | kpi.ETU.S.cycle2_M |  22062 | 0.5579384 | 22 062       | 56%        |    3 |  128.1780 |
| G2qA7 | Université Paris-Saclay              | FALSE      | kpi.ETU.S.cycle2_M |  26460 | 0.5654088 | 26 460       | 57%        |    2 |  252.5050 |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.ETU.S.cycle2_M |  11283 | 0.6282644 | 11 283       | 63%        |    1 |        NA |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.ETU.S.cycle2_M |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ETU.S.cycle3_D

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi                | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:-------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte                    | FALSE      | kpi.ETU.S.cycle3_D |      0 | 0.0000000 | 0            | 0%         |   67 |        NA |
| Lr94O | Université de Bourgogne                            | TRUE       | kpi.ETU.S.cycle3_D |      0 | 0.0000000 | 0            | 0%         |   67 | 0.0000000 |
| 7Mpgt | Université de Franche-Comté                        | TRUE       | kpi.ETU.S.cycle3_D |      0 | 0.0000000 | 0            | 0%         |   67 | 0.0000000 |
| RN4E6 | Université d’Évry-Val-d’Essonne                    | FALSE      | kpi.ETU.S.cycle3_D |      1 | 0.0001580 | 1            | 0%         |   66 | 0.4098361 |
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.ETU.S.cycle3_D |      6 | 0.0004522 | 6            | 0%         |   65 | 0.8498584 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:-------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| Y7ch7 | Université Grenoble Alpes            | TRUE       | kpi.ETU.S.cycle3_D |   2873 | 0.0548607 | 2 873        | 5%         |    4 |  81.87518 |
| bxPQe | Sorbonne Université                  | TRUE       | kpi.ETU.S.cycle3_D |   2881 | 0.0587719 | 2 881        | 6%         |    3 |  62.03704 |
| G2qA7 | Université Paris-Saclay              | FALSE      | kpi.ETU.S.cycle3_D |   4047 | 0.0864781 | 4 047        | 9%         |    2 | 157.83931 |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.ETU.S.cycle3_D |   2350 | 0.1308536 | 2 350        | 13%        |    1 | 890.15152 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.ETU.S.cycle3_D |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.ETU.S.DU_DE

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi             | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:----------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| BWbvP | Université d’Artois                      | TRUE       | kpi.ETU.S.DU_DE |     90 | 0.0075707 | 90           | 1%         |   69 | 109.75610 |
| 5tVy4 | Université Bretagne Sud                  | TRUE       | kpi.ETU.S.DU_DE |     77 | 0.0080637 | 77           | 1%         |   68 | 120.31250 |
| EW53M | Université Polytechnique Hauts-de-France | TRUE       | kpi.ETU.S.DU_DE |    114 | 0.0094795 | 114          | 1%         |   67 | 215.09434 |
| 3Z5e6 | Université Gustave Eiffel                | FALSE      | kpi.ETU.S.DU_DE |    147 | 0.0097629 | 147          | 1%         |   66 |        NA |
| zepT6 | Université de la Polynésie Française     | FALSE      | kpi.ETU.S.DU_DE |     46 | 0.0178225 | 46           | 2%         |   65 |  40.35088 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi             | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:----------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| bxPQe | Sorbonne Université                  | TRUE       | kpi.ETU.S.DU_DE |   7072 | 0.1442676 | 7 072        | 14%        |    4 |  119.0372 |
| TWBzp | Université Panthéon-Assas            | FALSE      | kpi.ETU.S.DU_DE |   3559 | 0.1640470 | 3 559        | 16%        |    3 |  123.8344 |
| 5cZyU | Université de Paris                  | TRUE       | kpi.ETU.S.DU_DE |  10195 | 0.1750455 | 10 195       | 18%        |    2 |  147.8393 |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.ETU.S.DU_DE |   4170 | 0.2321956 | 4 170        | 23%        |    1 |        NA |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.ETU.S.DU_DE |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.BIA.S.A

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| xJdyB | Aix-Marseille Université        | TRUE       | kpi.BIA.S.A |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vxHYt | Avignon Université              | TRUE       | kpi.BIA.S.A |     NA |   NA | N/A          | N/A        |   NA |        NA |
| RS4WF | CY Cergy Paris Université       | FALSE      | kpi.BIA.S.A |     NA |   NA | N/A          | N/A        |   NA |        NA |
| pVJpw | Centre universitaire de Mayotte | FALSE      | kpi.BIA.S.A |     NA |   NA | N/A          | N/A        |   NA |        NA |
| atbEK | La Rochelle Université          | TRUE       | kpi.BIA.S.A |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.BIA.S.A |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie                | FALSE      | kpi.BIA.S.A |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française               | FALSE      | kpi.BIA.S.A |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                            | FALSE      | kpi.BIA.S.A |     NA |   NA | N/A          | N/A        |   NA |        NA |
| yH19Y | Université du Littoral Côte d’Opale                | TRUE       | kpi.BIA.S.A |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.BIA.S.B

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| xJdyB | Aix-Marseille Université        | TRUE       | kpi.BIA.S.B |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vxHYt | Avignon Université              | TRUE       | kpi.BIA.S.B |     NA |   NA | N/A          | N/A        |   NA |        NA |
| RS4WF | CY Cergy Paris Université       | FALSE      | kpi.BIA.S.B |     NA |   NA | N/A          | N/A        |   NA |        NA |
| pVJpw | Centre universitaire de Mayotte | FALSE      | kpi.BIA.S.B |     NA |   NA | N/A          | N/A        |   NA |        NA |
| atbEK | La Rochelle Université          | TRUE       | kpi.BIA.S.B |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.BIA.S.B |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie                | FALSE      | kpi.BIA.S.B |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française               | FALSE      | kpi.BIA.S.B |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                            | FALSE      | kpi.BIA.S.B |     NA |   NA | N/A          | N/A        |   NA |        NA |
| yH19Y | Université du Littoral Côte d’Opale                | TRUE       | kpi.BIA.S.B |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.BIA.S.C

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| xJdyB | Aix-Marseille Université        | TRUE       | kpi.BIA.S.C |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vxHYt | Avignon Université              | TRUE       | kpi.BIA.S.C |     NA |   NA | N/A          | N/A        |   NA |        NA |
| RS4WF | CY Cergy Paris Université       | FALSE      | kpi.BIA.S.C |     NA |   NA | N/A          | N/A        |   NA |        NA |
| pVJpw | Centre universitaire de Mayotte | FALSE      | kpi.BIA.S.C |     NA |   NA | N/A          | N/A        |   NA |        NA |
| atbEK | La Rochelle Université          | TRUE       | kpi.BIA.S.C |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.BIA.S.C |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie                | FALSE      | kpi.BIA.S.C |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française               | FALSE      | kpi.BIA.S.C |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                            | FALSE      | kpi.BIA.S.C |     NA |   NA | N/A          | N/A        |   NA |        NA |
| yH19Y | Université du Littoral Côte d’Opale                | TRUE       | kpi.BIA.S.C |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.BIA.S.titulaires

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi                  | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:---------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| xJdyB | Aix-Marseille Université        | TRUE       | kpi.BIA.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vxHYt | Avignon Université              | TRUE       | kpi.BIA.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| RS4WF | CY Cergy Paris Université       | FALSE      | kpi.BIA.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| pVJpw | Centre universitaire de Mayotte | FALSE      | kpi.BIA.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| atbEK | La Rochelle Université          | TRUE       | kpi.BIA.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi                  | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:---------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.BIA.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie                | FALSE      | kpi.BIA.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française               | FALSE      | kpi.BIA.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                            | FALSE      | kpi.BIA.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |
| yH19Y | Université du Littoral Côte d’Opale                | TRUE       | kpi.BIA.S.titulaires |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.masseSalariale

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                      |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:-------------------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.FIN.S.masseSalariale |   1669563 | 0.1726121 | 1.7M€        | 17%        |   68 |  194.5542 |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.FIN.S.masseSalariale |   9019346 | 0.1980367 | 9M€          | 20%        |   67 |  119.8539 |
| OJZ4a | Université de Haute-Alsace           | FALSE      | kpi.FIN.S.masseSalariale |  80493139 | 0.6536094 | 80M€         | 65%        |   66 |  120.8115 |
| G2qA7 | Université Paris-Saclay              | FALSE      | kpi.FIN.S.masseSalariale | 330372170 | 0.6860005 | 330M€        | 69%        |   65 |  122.3841 |
| HAU8L | Université de Nîmes                  | TRUE       | kpi.FIN.S.masseSalariale |  20682089 | 0.6960349 | 21M€         | 70%        |   64 |  179.3573 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                | Comparable | kpi                      |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------|:-----------|:-------------------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis | TRUE       | kpi.FIN.S.masseSalariale | 135311959 | 0.8624770 | 135M€        | 86%        |    3 |  121.9693 |
| 9xlel | Le Mans Université                           | TRUE       | kpi.FIN.S.masseSalariale |  89239805 | 0.8691082 | 89M€         | 87%        |    2 |  132.2899 |
| ti37C | Université Rennes 2                          | TRUE       | kpi.FIN.S.masseSalariale | 110259303 | 0.8702093 | 110M€        | 87%        |    1 |  130.3243 |
| qUCQp | Nantes Université                            | TRUE       | kpi.FIN.S.masseSalariale |        NA |        NA | N/A          | N/A        |   NA |        NA |
| hy4EW | Université de Guyane                         | FALSE      | kpi.FIN.S.masseSalariale |        NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.SCSP

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi            |   valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:---------------|---------:|----------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.FIN.S.SCSP |  9642272 | 0.2117142 | 9.6M€        | 21%        |   68 |  422.6216 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.FIN.S.SCSP | 63039652 | 0.5461735 | 63M€         | 55%        |   67 |  109.3084 |
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.FIN.S.SCSP |  5667133 | 0.5859113 | 5.7M€        | 59%        |   66 |  199.1814 |
| OJZ4a | Université de Haute-Alsace           | FALSE      | kpi.FIN.S.SCSP | 81505600 | 0.6618307 | 82M€         | 66%        |   65 |  117.4418 |
| NLCOF | Université de Corse Pasquale Paoli   | FALSE      | kpi.FIN.S.SCSP | 45499751 | 0.6730802 | 45M€         | 67%        |   64 |  127.8109 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi            |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:---------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| z3hdL | Université des Antilles                | FALSE      | kpi.FIN.S.SCSP |  97264516 | 0.8998906 | 97M€         | 90%        |    3 |  107.1700 |
| HqAYu | Université Toulouse - Jean Jaurès      | TRUE       | kpi.FIN.S.SCSP | 181666433 | 0.9152949 | 182M€        | 92%        |    2 |  126.6716 |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.FIN.S.SCSP | 106604738 | 0.9261143 | 107M€        | 93%        |    1 |  116.5979 |
| qUCQp | Nantes Université                      | TRUE       | kpi.FIN.S.SCSP |        NA |        NA | N/A          | N/A        |   NA |        NA |
| hy4EW | Université de Guyane                   | FALSE      | kpi.FIN.S.SCSP |        NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.recettesFormation

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi                         |  valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:----------------------------|--------:|----------:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte          | FALSE      | kpi.FIN.S.recettesFormation |   75098 | 0.0077642 | 0.08M€       | 1%         |   64 |  30.83461 |
| n1W55 | Université de Perpignan Via Domitia      | TRUE       | kpi.FIN.S.recettesFormation | 1684725 | 0.0208868 | 1.7M€        | 2%         |   63 |  59.64260 |
| EW53M | Université Polytechnique Hauts-de-France | TRUE       | kpi.FIN.S.recettesFormation | 2378456 | 0.0211359 | 2.4M€        | 2%         |   62 |  56.50268 |
| atbEK | La Rochelle Université                   | TRUE       | kpi.FIN.S.recettesFormation | 2066209 | 0.0235176 | 2.1M€        | 2%         |   61 | 100.05119 |
| LsQ24 | Université Le Havre Normandie            | TRUE       | kpi.FIN.S.recettesFormation | 2054563 | 0.0246609 | 2.1M€        | 2%         |   60 |  75.12086 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:----------------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |
| hy4EW | Université de Guyane                   | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie    | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française   | FALSE      | kpi.FIN.S.recettesFormation |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.recettesRecherche

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                     | Comparable | kpi                         |  valeur |      norm | valeur_label | norm_label | rang |  evolution |
|:------|:----------------------------------|:-----------|:----------------------------|--------:|----------:|:-------------|:-----------|-----:|-----------:|
| pVJpw | Centre universitaire de Mayotte   | FALSE      | kpi.FIN.S.recettesRecherche |       0 | 0.0000000 | 0M€          | 0%         |   65 |    0.00000 |
| C6Ps7 | Université Paris Dauphine - PSL   | FALSE      | kpi.FIN.S.recettesRecherche |  668266 | 0.0057898 | 0.67M€       | 1%         |   64 |   35.31869 |
| gap5Q | Université Toulouse Capitole      | TRUE       | kpi.FIN.S.recettesRecherche |  809405 | 0.0069165 | 0.81M€       | 1%         |   63 |   83.19699 |
| HqAYu | Université Toulouse - Jean Jaurès | TRUE       | kpi.FIN.S.recettesRecherche | 1513574 | 0.0076259 | 1.5M€        | 1%         |   62 |  106.89349 |
| 7Gzub | Université Jean Moulin - Lyon 3   | TRUE       | kpi.FIN.S.recettesRecherche | 1078776 | 0.0081709 | 1.1M€        | 1%         |   61 | 1020.41838 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:----------------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| qUCQp | Nantes Université                    | TRUE       | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| hy4EW | Université de Guyane                 | FALSE      | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| HAU8L | Université de Nîmes                  | TRUE       | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles              | FALSE      | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.investissements

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                       |   valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------------------|---------:|----------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.FIN.S.investissements |    45073 | 0.0009897 | 0.05M€       | 0%         |   68 |  536.5833 |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.FIN.S.investissements |  2672875 | 0.0232202 | 2.7M€        | 2%         |   67 |  160.9172 |
| 6G2TU | Université Paris 1 - Panthéon Sorbonne | TRUE       | kpi.FIN.S.investissements |  6789803 | 0.0273703 | 6.8M€        | 3%         |   66 |  293.4136 |
| ti37C | Université Rennes 2                    | TRUE       | kpi.FIN.S.investissements |  6589597 | 0.0520077 | 6.6M€        | 5%         |   65 |  154.1178 |
| 5cZyU | Université de Paris                    | TRUE       | kpi.FIN.S.investissements | 35870601 | 0.0538666 | 36M€         | 5%         |   64 |  132.0454 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi                       |   valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:--------------------------|---------:|----------:|:-------------|:-----------|-----:|----------:|
| 7Gzub | Université Jean Moulin - Lyon 3 | TRUE       | kpi.FIN.S.investissements | 31210228 | 0.2363931 | 31M€         | 24%        |    3 |  379.0728 |
| HAU8L | Université de Nîmes             | TRUE       | kpi.FIN.S.investissements |  7709292 | 0.2594485 | 7.7M€        | 26%        |    2 |  774.2536 |
| RN4E6 | Université d’Évry-Val-d’Essonne | FALSE      | kpi.FIN.S.investissements | 31010281 | 0.3026222 | 31M€         | 30%        |    1 | 1863.2160 |
| qUCQp | Nantes Université               | TRUE       | kpi.FIN.S.investissements |       NA |        NA | N/A          | N/A        |   NA |        NA |
| hy4EW | Université de Guyane            | FALSE      | kpi.FIN.S.investissements |       NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.IMO.S.état_satisfaisant

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                         | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:----------------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte        | FALSE      | kpi.IMO.S.état_satisfaisant |      0 | 0.0000000 | 0            | 0%         |   63 |        NA |
| C6Ps7 | Université Paris Dauphine - PSL        | FALSE      | kpi.IMO.S.état_satisfaisant |      0 | 0.0000000 | 0            | 0%         |   63 |        NA |
| hy4EW | Université de Guyane                   | FALSE      | kpi.IMO.S.état_satisfaisant |      0 | 0.0000000 | 0            | 0%         |   63 |        NA |
| NLCOF | Université de Corse Pasquale Paoli     | FALSE      | kpi.IMO.S.état_satisfaisant |      2 | 0.0645161 | 2            | 6%         |   62 |       200 |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.IMO.S.état_satisfaisant |      1 | 0.1250000 | 1            | 12%        |   61 |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                         | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:----------------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| hlX1r | Université de Poitiers               | TRUE       | kpi.IMO.S.état_satisfaisant |    133 | 0.9432624 | 133          | 94%        |    2 |  92.36111 |
| BWbvP | Université d’Artois                  | TRUE       | kpi.IMO.S.état_satisfaisant |     35 | 1.0000000 | 35           | 100%       |    1 |  97.22222 |
| HAU8L | Université de Nîmes                  | TRUE       | kpi.IMO.S.état_satisfaisant |      4 | 1.0000000 | 4            | 100%       |    1 | 133.33333 |
| tIJ02 | Université Jean Monnet               | TRUE       | kpi.IMO.S.état_satisfaisant |     NA |        NA | N/A          | N/A        |   NA |        NA |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.IMO.S.état_satisfaisant |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.IMO.S.énergie_ABC

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                | Comparable | kpi                   | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------|:-----------|:----------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte              | FALSE      | kpi.IMO.S.énergie_ABC |      0 |    0 | 0            | 0%         |   61 |        NA |
| 7Gzub | Université Jean Moulin - Lyon 3              | TRUE       | kpi.IMO.S.énergie_ABC |      0 |    0 | 0            | 0%         |   61 |        NA |
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis | TRUE       | kpi.IMO.S.énergie_ABC |      0 |    0 | 0            | 0%         |   61 |        NA |
| 8k883 | Université Sorbonne Nouvelle - Paris 3       | TRUE       | kpi.IMO.S.énergie_ABC |      0 |    0 | 0            | 0%         |   61 |        NA |
| hy4EW | Université de Guyane                         | FALSE      | kpi.IMO.S.énergie_ABC |      0 |    0 | 0            | 0%         |   61 |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                   | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:----------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| cEt92 | Université de La Réunion               | FALSE      | kpi.IMO.S.énergie_ABC |     66 | 0.7096774 | 66           | 71%        |    3 | 104.76190 |
| 1I7hJ | Université Paul-Valéry - Montpellier 3 | TRUE       | kpi.IMO.S.énergie_ABC |     37 | 0.7551020 | 37           | 76%        |    2 |  86.04651 |
| LsQ24 | Université Le Havre Normandie          | TRUE       | kpi.IMO.S.énergie_ABC |     18 | 1.0000000 | 18           | 100%       |    1 |  94.73684 |
| tIJ02 | Université Jean Monnet                 | TRUE       | kpi.IMO.S.énergie_ABC |     NA |        NA | N/A          | N/A        |   NA |        NA |
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.IMO.S.énergie_ABC |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.IMO.S.GES_ABC

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi               | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte        | FALSE      | kpi.IMO.S.GES_ABC |      0 |    0 | 0            | 0%         |   58 |        NA |
| 7Gzub | Université Jean Moulin - Lyon 3        | TRUE       | kpi.IMO.S.GES_ABC |      0 |    0 | 0            | 0%         |   58 |        NA |
| C6Ps7 | Université Paris Dauphine - PSL        | FALSE      | kpi.IMO.S.GES_ABC |      0 |    0 | 0            | 0%         |   58 |        NA |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.IMO.S.GES_ABC |      0 |    0 | 0            | 0%         |   58 |        NA |
| hy4EW | Université de Guyane                   | FALSE      | kpi.IMO.S.GES_ABC |      0 |    0 | 0            | 0%         |   58 |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi               | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| Mz286 | Université de Pau et des Pays de l’Adour | TRUE       | kpi.IMO.S.GES_ABC |     40 | 0.8695652 | 40           | 87%        |    3 |        NA |
| LsQ24 | Université Le Havre Normandie            | TRUE       | kpi.IMO.S.GES_ABC |     17 | 0.9444444 | 17           | 94%        |    2 |  89.47368 |
| 1I7hJ | Université Paul-Valéry - Montpellier 3   | TRUE       | kpi.IMO.S.GES_ABC |     48 | 0.9795918 | 48           | 98%        |    1 | 192.00000 |
| tIJ02 | Université Jean Monnet                   | TRUE       | kpi.IMO.S.GES_ABC |     NA |        NA | N/A          | N/A        |   NA |        NA |
| PpsCQ | Université Paris sciences et lettres     | FALSE      | kpi.IMO.S.GES_ABC |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.IMO.S.propriété_propre

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                | Comparable | kpi                        | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------|:-----------|:---------------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| atbEK | La Rochelle Université                       | TRUE       | kpi.IMO.S.propriété_propre |      0 |    0 | 0            | 0%         |   46 |         0 |
| 9xlel | Le Mans Université                           | TRUE       | kpi.IMO.S.propriété_propre |      0 |    0 | 0            | 0%         |   46 |        NA |
| LsQ24 | Université Le Havre Normandie                | TRUE       | kpi.IMO.S.propriété_propre |      0 |    0 | 0            | 0%         |   46 |        NA |
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis | TRUE       | kpi.IMO.S.propriété_propre |      0 |    0 | 0            | 0%         |   46 |        NA |
| C6Ps7 | Université Paris Dauphine - PSL              | FALSE      | kpi.IMO.S.propriété_propre |      0 |    0 | 0            | 0%         |   46 |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                        | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:---------------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| p25Q3 | Université de Caen Normandie         | TRUE       | kpi.IMO.S.propriété_propre |     80 | 0.8602151 | 80           | 86%        |    3 | 727.27273 |
| hlX1r | Université de Poitiers               | TRUE       | kpi.IMO.S.propriété_propre |    122 | 0.8652482 | 122          | 87%        |    2 |  92.42424 |
| gap5Q | Université Toulouse Capitole         | TRUE       | kpi.IMO.S.propriété_propre |     30 | 0.9375000 | 30           | 94%        |    1 |  96.77419 |
| tIJ02 | Université Jean Monnet               | TRUE       | kpi.IMO.S.propriété_propre |     NA |        NA | N/A          | N/A        |   NA |        NA |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.IMO.S.propriété_propre |     NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.dotPres

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.K.dotPres | 0.2117142 | 0.2117142 | 21%          | 21%        |   68 |  89.09672 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.K.dotPres | 0.5461735 | 0.5461735 | 55%          | 55%        |   67 |  87.18785 |
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.K.dotPres | 0.5859113 | 0.5859113 | 59%          | 59%        |   66 |  69.64531 |
| OJZ4a | Université de Haute-Alsace           | FALSE      | kpi.K.dotPres | 0.6618307 | 0.6618307 | 66%          | 66%        |   65 |  86.03892 |
| NLCOF | Université de Corse Pasquale Paoli   | FALSE      | kpi.K.dotPres | 0.6730802 | 0.6730802 | 67%          | 67%        |   64 |  98.55056 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| z3hdL | Université des Antilles                | FALSE      | kpi.K.dotPres | 0.8998906 | 0.8998906 | 90%          | 90%        |    3 |  101.1923 |
| HqAYu | Université Toulouse - Jean Jaurès      | TRUE       | kpi.K.dotPres | 0.9152949 | 0.9152949 | 92%          | 92%        |    2 |  102.6024 |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.K.dotPres | 0.9261143 | 0.9261143 | 93%          | 93%        |    1 |  104.0976 |
| qUCQp | Nantes Université                      | TRUE       | kpi.K.dotPres |        NA |        NA | N/A          | N/A        |   NA |        NA |
| hy4EW | Université de Guyane                   | FALSE      | kpi.K.dotPres |        NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.resPetu

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.K.resPetu | 2917.792 | 2917.792 | 3k€          | 3k€        |   67 |  11.39254 |
| TWBzp | Université Panthéon-Assas              | FALSE      | kpi.K.resPetu | 5075.020 | 5075.020 | 5k€          | 5k€        |   66 |  92.48971 |
| 7Gzub | Université Jean Moulin - Lyon 3        | TRUE       | kpi.K.resPetu | 5380.942 | 5380.942 | 5k€          | 5k€        |   65 | 129.97044 |
| HAU8L | Université de Nîmes                    | TRUE       | kpi.K.resPetu | 5547.826 | 5547.826 | 6k€          | 6k€        |   64 | 125.43563 |
| 1I7hJ | Université Paul-Valéry - Montpellier 3 | TRUE       | kpi.K.resPetu | 6184.605 | 6184.605 | 6k€          | 6k€        |   63 | 115.79388 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                      | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| NLCOF | Université de Corse Pasquale Paoli | FALSE      | kpi.K.resPetu | 16786.52 | 16786.52 | 17k€         | 17k€       |    2 |  123.0564 |
| 3Z5e6 | Université Gustave Eiffel          | FALSE      | kpi.K.resPetu | 17823.09 | 17823.09 | 18k€         | 18k€       |    1 |  213.0270 |
| qUCQp | Nantes Université                  | TRUE       | kpi.K.resPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |
| C6Ps7 | Université Paris Dauphine - PSL    | FALSE      | kpi.K.resPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |
| hy4EW | Université de Guyane               | FALSE      | kpi.K.resPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.forPetu

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| pVJpw | Centre universitaire de Mayotte          | FALSE      | kpi.K.forPetu |  55.25975 |  55.25975 | 55€          | 55€        |   63 |  25.47996 |
| EW53M | Université Polytechnique Hauts-de-France | TRUE       | kpi.K.forPetu | 197.77615 | 197.77615 | 198€         | 198€       |   62 |  47.12002 |
| cEt92 | Université de La Réunion                 | FALSE      | kpi.K.forPetu | 204.75555 | 204.75555 | 205€         | 205€       |   61 |  46.70048 |
| n1W55 | Université de Perpignan Via Domitia      | TRUE       | kpi.K.forPetu | 209.59505 | 209.59505 | 210€         | 210€       |   60 |  64.07980 |
| g6rwB | Université Paris Nanterre                | TRUE       | kpi.K.forPetu | 248.35449 | 248.35449 | 248€         | 248€       |   59 |  75.47979 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| hy4EW | Université de Guyane                   | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie    | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française   | FALSE      | kpi.K.forPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.recPect

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| xJdyB | Aix-Marseille Université        | TRUE       | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vxHYt | Avignon Université              | TRUE       | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| RS4WF | CY Cergy Paris Université       | FALSE      | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| pVJpw | Centre universitaire de Mayotte | FALSE      | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| atbEK | La Rochelle Université          | TRUE       | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie                | FALSE      | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française               | FALSE      | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                            | FALSE      | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |
| yH19Y | Université du Littoral Côte d’Opale                | TRUE       | kpi.K.recPect |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.ensPetu

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| xJdyB | Aix-Marseille Université        | TRUE       | kpi.K.ensPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vxHYt | Avignon Université              | TRUE       | kpi.K.ensPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| RS4WF | CY Cergy Paris Université       | FALSE      | kpi.K.ensPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| pVJpw | Centre universitaire de Mayotte | FALSE      | kpi.K.ensPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| atbEK | La Rochelle Université          | TRUE       | kpi.K.ensPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.K.ensPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie                | FALSE      | kpi.K.ensPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française               | FALSE      | kpi.K.ensPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                            | FALSE      | kpi.K.ensPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |
| yH19Y | Université du Littoral Côte d’Opale                | TRUE       | kpi.K.ensPetu |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.titPper

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| xJdyB | Aix-Marseille Université        | TRUE       | kpi.K.titPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vxHYt | Avignon Université              | TRUE       | kpi.K.titPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| RS4WF | CY Cergy Paris Université       | FALSE      | kpi.K.titPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| pVJpw | Centre universitaire de Mayotte | FALSE      | kpi.K.titPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| atbEK | La Rochelle Université          | TRUE       | kpi.K.titPper |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.K.titPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie                | FALSE      | kpi.K.titPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française               | FALSE      | kpi.K.titPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                            | FALSE      | kpi.K.titPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| yH19Y | Université du Littoral Côte d’Opale                | TRUE       | kpi.K.titPper |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.biaPper

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:--------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| xJdyB | Aix-Marseille Université        | TRUE       | kpi.K.biaPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| vxHYt | Avignon Université              | TRUE       | kpi.K.biaPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| RS4WF | CY Cergy Paris Université       | FALSE      | kpi.K.biaPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| pVJpw | Centre universitaire de Mayotte | FALSE      | kpi.K.biaPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| atbEK | La Rochelle Université          | TRUE       | kpi.K.biaPper |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                      | Comparable | kpi           | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------------|:-----------|:--------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| V13Pk | Université de Versailles Saint-Quentin-en-Yvelines | TRUE       | kpi.K.biaPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie                | FALSE      | kpi.K.biaPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française               | FALSE      | kpi.K.biaPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                            | FALSE      | kpi.K.biaPper |     NA |   NA | N/A          | N/A        |   NA |        NA |
| yH19Y | Université du Littoral Côte d’Opale                | TRUE       | kpi.K.biaPper |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.dotPetu

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang |  evolution |
|:------|:-------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|-----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.K.dotPetu |  617.738 |  617.738 | 618          | 618        |   67 |   8.838321 |
| TWBzp | Université Panthéon-Assas            | FALSE      | kpi.K.dotPetu | 3690.034 | 3690.034 | 3 690        | 3 690      |   66 |  83.503089 |
| 7Gzub | Université Jean Moulin - Lyon 3      | TRUE       | kpi.K.dotPetu | 4131.131 | 4131.131 | 4 131        | 4 131      |   65 | 123.807678 |
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.K.dotPetu | 4170.076 | 4170.076 | 4 170        | 4 170      |   64 | 164.592133 |
| HAU8L | Université de Nîmes                  | TRUE       | kpi.K.dotPetu | 4482.856 | 4482.856 | 4 483        | 4 483      |   63 | 115.230882 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.K.dotPetu | 12313.47 | 12313.47 | 12 313       | 12 313     |    2 |  176.2458 |
| RN4E6 | Université d’Évry-Val-d’Essonne      | FALSE      | kpi.K.dotPetu | 12627.46 | 12627.46 | 12 627       | 12 627     |    1 |  163.9078 |
| qUCQp | Nantes Université                    | TRUE       | kpi.K.dotPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.K.dotPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |
| hy4EW | Université de Guyane                 | FALSE      | kpi.K.dotPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |

</details>
</details>

#### Détection automatique

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            |
|:------|:-----------------------------------------|
| 6g0Mb | Paris-Est Sup                            |
| 8A0mg | Université Bourgogne - Franche-Comté     |
| 86UpY | Université Paris Lumières                |
| 13fXQ | École nationale supérieure Louis Lumière |
| kWved | École normale supérieure de Lyon         |
| VaJ52 | Muséum national d’histoire naturelle     |

</details>

## Ecriture des données

[fr-cpesr-kpiesr.csv](data/fr-cpesr-kpiesr.csv)

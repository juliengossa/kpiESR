Mise à jour des données
================
2024-03-26

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
| fin  |        2009 |        2022 |    156 |
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
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.FIN.S.masseSalariale |   1864023 | 0.1890125 | 1.9M€        | 19%        |   70 |  217.2146 |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.FIN.S.masseSalariale |  11517364 | 0.2179722 | 11.5M€       | 22%        |   69 |  153.0489 |
| G2qA7 | Université Paris-Saclay              | FALSE      | kpi.FIN.S.masseSalariale | 334365635 | 0.6759195 | 334M€        | 68%        |   68 |  123.8635 |
| OJZ4a | Université de Haute-Alsace           | FALSE      | kpi.FIN.S.masseSalariale |  82837198 | 0.6835167 | 83M€         | 68%        |   67 |  124.3297 |
| Z2FY5 | Université de la Nouvelle-Calédonie  | FALSE      | kpi.FIN.S.masseSalariale |  27720989 | 0.7279341 | 28M€         | 73%        |   66 |  144.3514 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                | Comparable | kpi                      |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------|:-----------|:-------------------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| g6rwB | Université Paris Nanterre                    | TRUE       | kpi.FIN.S.masseSalariale | 183700870 | 0.8600053 | 184M€        | 86%        |    5 |  124.5519 |
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis | TRUE       | kpi.FIN.S.masseSalariale | 136154413 | 0.8727420 | 136M€        | 87%        |    4 |  122.7287 |
| 1I7hJ | Université Paul-Valéry - Montpellier 3       | TRUE       | kpi.FIN.S.masseSalariale | 105290087 | 0.8739183 | 105M€        | 87%        |    3 |  122.0574 |
| hy4EW | Université de Guyane                         | FALSE      | kpi.FIN.S.masseSalariale |  23796534 | 0.8772226 | 24M€         | 88%        |    2 |  168.3978 |
| z3hdL | Université des Antilles                      | FALSE      | kpi.FIN.S.masseSalariale |  92173097 | 0.9249267 | 92M€         | 92%        |    1 |  109.7025 |

</details>

##### kpi.FIN.S.SCSP

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi            |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:---------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.FIN.S.SCSP |   6370264 | 0.1205606 | 6.4M€        | 12%        |   70 |  279.2092 |
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.FIN.S.SCSP |   3723800 | 0.3775945 | 3.7M€        | 38%        |   69 |  130.8795 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.FIN.S.SCSP |  62108365 | 0.5541827 | 62M€         | 55%        |   68 |  107.6936 |
| 3Z5e6 | Université Gustave Eiffel            | FALSE      | kpi.FIN.S.SCSP | 175079902 | 0.6225772 | 175M€        | 62%        |   67 |  246.2723 |
| 90I54 | Université de Bordeaux               | TRUE       | kpi.FIN.S.SCSP | 359850709 | 0.6336613 | 360M€        | 63%        |   66 |  111.8019 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi            |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:---------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.FIN.S.SCSP | 100693049 | 0.8787062 | 101M€        | 88%        |    5 |  110.1321 |
| zepT6 | Université de la Polynésie Française   | FALSE      | kpi.FIN.S.SCSP |  29347132 | 0.8865381 | 29M€         | 89%        |    4 |  124.3496 |
| hy4EW | Université de Guyane                   | FALSE      | kpi.FIN.S.SCSP |  24450940 | 0.9013463 | 24M€         | 90%        |    3 |  150.7886 |
| HqAYu | Université Toulouse - Jean Jaurès      | TRUE       | kpi.FIN.S.SCSP | 177580558 | 0.9166297 | 178M€        | 92%        |    2 |  123.8226 |
| z3hdL | Université des Antilles                | FALSE      | kpi.FIN.S.SCSP |  95463551 | 0.9579454 | 95M€         | 96%        |    1 |  105.1857 |

</details>

##### kpi.FIN.S.recettesFormation

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi                         |  valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:----------------------------|--------:|----------:|:-------------|:-----------|-----:|----------:|
| z3hdL | Université des Antilles                  | FALSE      | kpi.FIN.S.recettesFormation | 1475165 | 0.0148028 | 1.5M€        | 1%         |   67 |  51.19193 |
| 7Mpgt | Université de Franche-Comté              | TRUE       | kpi.FIN.S.recettesFormation | 3778577 | 0.0167252 | 3.8M€        | 2%         |   66 |  63.83379 |
| EW53M | Université Polytechnique Hauts-de-France | TRUE       | kpi.FIN.S.recettesFormation | 2270000 | 0.0207992 | 2.3M€        | 2%         |   65 |  53.92620 |
| n1W55 | Université de Perpignan Via Domitia      | TRUE       | kpi.FIN.S.recettesFormation | 1843771 | 0.0229201 | 1.8M€        | 2%         |   64 |  65.27314 |
| LsQ24 | Université Le Havre Normandie            | TRUE       | kpi.FIN.S.recettesFormation | 1954360 | 0.0247041 | 2M€          | 2%         |   63 |  71.45714 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi                         |   valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:----------------------------|---------:|----------:|:-------------|:-----------|-----:|----------:|
| RS4WF | CY Cergy Paris Université            | FALSE      | kpi.FIN.S.recettesFormation | 37167591 | 0.1776978 | 37M€         | 18%        |    2 | 745.80249 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.FIN.S.recettesFormation | 26935546 | 0.2403414 | 27M€         | 24%        |    1 |  97.21146 |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.FIN.S.recettesFormation |       NA |        NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie  | FALSE      | kpi.FIN.S.recettesFormation |       NA |        NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.FIN.S.recettesFormation |       NA |        NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.recettesRecherche

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                | Comparable | kpi                         | valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------------|:-----------|:----------------------------|-------:|----------:|:-------------|:-----------|-----:|----------:|
| hy4EW | Université de Guyane                         | FALSE      | kpi.FIN.S.recettesRecherche |      0 | 0.0000000 | 0M€          | 0%         |   64 |        NA |
| cEt92 | Université de La Réunion                     | FALSE      | kpi.FIN.S.recettesRecherche |  81666 | 0.0006208 | 0.08M€       | 0%         |   63 |  14.15971 |
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis | TRUE       | kpi.FIN.S.recettesRecherche | 456211 | 0.0029243 | 0.46M€       | 0%         |   62 |  21.13606 |
| RN4E6 | Université d’Évry-Val-d’Essonne              | FALSE      | kpi.FIN.S.recettesRecherche | 358093 | 0.0036691 | 0.36M€       | 0%         |   61 |  23.17358 |
| 7Gzub | Université Jean Moulin - Lyon 3              | TRUE       | kpi.FIN.S.recettesRecherche | 515944 | 0.0039182 | 0.52M€       | 0%         |   60 | 488.03342 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                         | valeur | norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:----------------------------|-------:|-----:|:-------------|:-----------|-----:|----------:|
| tIJ02 | Université Jean Monnet                 | TRUE       | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| gap5Q | Université Toulouse Capitole           | TRUE       | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |
| z3hdL | Université des Antilles                | FALSE      | kpi.FIN.S.recettesRecherche |     NA |   NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.FIN.S.investissements

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                       |  valeur |      norm | valeur_label | norm_label | rang |  evolution |
|:------|:---------------------------------------|:-----------|:--------------------------|--------:|----------:|:-------------|:-----------|-----:|-----------:|
| pVJpw | Centre universitaire de Mayotte        | FALSE      | kpi.FIN.S.investissements |       0 | 0.0000000 | 0M€          | 0%         |   68 |    0.00000 |
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.FIN.S.investissements |  758333 | 0.0143519 | 0.76M€       | 1%         |   67 | 9027.77381 |
| 6G2TU | Université Paris 1 - Panthéon Sorbonne | TRUE       | kpi.FIN.S.investissements | 6532356 | 0.0268029 | 6.5M€        | 3%         |   66 |  282.28835 |
| TWBzp | Université Panthéon-Assas              | FALSE      | kpi.FIN.S.investissements | 3436000 | 0.0346920 | 3.4M€        | 3%         |   65 |   90.92744 |
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.FIN.S.investissements | 4157226 | 0.0362784 | 4.2M€        | 4%         |   64 |  250.28072 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi                       |   valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------------------|---------:|----------:|:-------------|:-----------|-----:|----------:|
| C6Ps7 | Université Paris Dauphine - PSL        | FALSE      | kpi.FIN.S.investissements | 30506000 | 0.2722000 | 31M€         | 27%        |    3 | 1132.2417 |
| NLCOF | Université de Corse Pasquale Paoli     | FALSE      | kpi.FIN.S.investissements | 18145200 | 0.2745891 | 18.1M€       | 27%        |    2 |  164.5732 |
| 1I7hJ | Université Paul-Valéry - Montpellier 3 | TRUE       | kpi.FIN.S.investissements | 63348095 | 0.5257956 | 63M€         | 53%        |    1 | 3008.2308 |
| 3Z5e6 | Université Gustave Eiffel              | FALSE      | kpi.FIN.S.investissements |       NA |        NA | N/A          | N/A        |   NA |        NA |
| hy4EW | Université de Guyane                   | FALSE      | kpi.FIN.S.investissements |       NA |        NA | N/A          | N/A        |   NA |        NA |

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
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.K.dotPres | 0.1205606 | 0.1205606 | 12%          | 12%        |   70 |  50.73611 |
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.K.dotPres | 0.3775945 | 0.3775945 | 38%          | 38%        |   69 |  44.88340 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.K.dotPres | 0.5541827 | 0.5541827 | 55%          | 55%        |   68 |  88.46639 |
| 3Z5e6 | Université Gustave Eiffel            | FALSE      | kpi.K.dotPres | 0.6225772 | 0.6225772 | 62%          | 62%        |   67 |  76.17786 |
| 90I54 | Université de Bordeaux               | TRUE       | kpi.K.dotPres | 0.6336613 | 0.6336613 | 63%          | 63%        |   66 |  86.73637 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|----------:|
| 8k883 | Université Sorbonne Nouvelle - Paris 3 | TRUE       | kpi.K.dotPres | 0.8787062 | 0.8787062 | 88%          | 88%        |    5 |  98.76884 |
| zepT6 | Université de la Polynésie Française   | FALSE      | kpi.K.dotPres | 0.8865381 | 0.8865381 | 89%          | 89%        |    4 |  99.20685 |
| hy4EW | Université de Guyane                   | FALSE      | kpi.K.dotPres | 0.9013463 | 0.9013463 | 90%          | 90%        |    3 | 106.08272 |
| HqAYu | Université Toulouse - Jean Jaurès      | TRUE       | kpi.K.dotPres | 0.9166297 | 0.9166297 | 92%          | 92%        |    2 | 102.75201 |
| z3hdL | Université des Antilles                | FALSE      | kpi.K.dotPres | 0.9579454 | 0.9579454 | 96%          | 96%        |    1 | 107.72057 |

</details>

##### kpi.K.resPetu

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                          | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:---------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| PpsCQ | Université Paris sciences et lettres   | FALSE      | kpi.K.resPetu | 3385.142 | 3385.142 | 3k€          | 3k€        |   69 |  13.21732 |
| TWBzp | Université Panthéon-Assas              | FALSE      | kpi.K.resPetu | 4749.808 | 4749.808 | 5k€          | 5k€        |   68 |  86.56288 |
| HAU8L | Université de Nîmes                    | TRUE       | kpi.K.resPetu | 5039.677 | 5039.677 | 5k€          | 5k€        |   67 | 113.94645 |
| 7Gzub | Université Jean Moulin - Lyon 3        | TRUE       | kpi.K.resPetu | 5366.794 | 5366.794 | 5k€          | 5k€        |   66 | 129.62869 |
| 1I7hJ | Université Paul-Valéry - Montpellier 3 | TRUE       | kpi.K.resPetu | 5950.828 | 5950.828 | 6k€          | 6k€        |   65 | 111.41689 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                      | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| RN4E6 | Université d’Évry-Val-d’Essonne    | FALSE      | kpi.K.resPetu | 15425.32 | 15425.32 | 15k€         | 15k€       |    4 |  164.2488 |
| NLCOF | Université de Corse Pasquale Paoli | FALSE      | kpi.K.resPetu | 16409.55 | 16409.55 | 16k€         | 16k€       |    3 |  120.2930 |
| bxPQe | Sorbonne Université                | TRUE       | kpi.K.resPetu | 16839.52 | 16839.52 | 17k€         | 17k€       |    2 |  124.3804 |
| 3Z5e6 | Université Gustave Eiffel          | FALSE      | kpi.K.resPetu | 19121.37 | 19121.37 | 19k€         | 19k€       |    1 |  228.5445 |
| C6Ps7 | Université Paris Dauphine - PSL    | FALSE      | kpi.K.resPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |

</details>

##### kpi.K.forPetu

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                            | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:-----------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| z3hdL | Université des Antilles                  | FALSE      | kpi.K.forPetu | 130.7654 | 130.7654 | 131€         | 131€       |   66 |  48.80500 |
| 7Mpgt | Université de Franche-Comté              | TRUE       | kpi.K.forPetu | 179.0540 | 179.0540 | 179€         | 179€       |   65 |  62.35463 |
| EW53M | Université Polytechnique Hauts-de-France | TRUE       | kpi.K.forPetu | 188.7577 | 188.7577 | 189€         | 189€       |   64 |  44.97138 |
| pVJpw | Centre universitaire de Mayotte          | FALSE      | kpi.K.forPetu | 215.4761 | 215.4761 | 215€         | 215€       |   63 |  99.35481 |
| n1W55 | Université de Perpignan Via Domitia      | TRUE       | kpi.K.forPetu | 229.3818 | 229.3818 | 229€         | 229€       |   62 |  70.12924 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                        | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:-------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| RN4E6 | Université d’Évry-Val-d’Essonne      | FALSE      | kpi.K.forPetu | 2494.872 | 2494.872 | 2495€        | 2495€      |    1 |  758.9286 |
| C6Ps7 | Université Paris Dauphine - PSL      | FALSE      | kpi.K.forPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.K.forPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |
| Z2FY5 | Université de la Nouvelle-Calédonie  | FALSE      | kpi.K.forPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |
| zepT6 | Université de la Polynésie Française | FALSE      | kpi.K.forPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |

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

| pid   | Etablissement                        | Comparable | kpi           |    valeur |      norm | valeur_label | norm_label | rang |  evolution |
|:------|:-------------------------------------|:-----------|:--------------|----------:|----------:|:-------------|:-----------|-----:|-----------:|
| PpsCQ | Université Paris sciences et lettres | FALSE      | kpi.K.dotPetu |  408.1148 |  408.1148 | 408          | 408        |   69 |   5.839126 |
| pVJpw | Centre universitaire de Mayotte      | FALSE      | kpi.K.dotPetu | 2740.1030 | 2740.1030 | 2 740        | 2 740      |   68 | 108.151368 |
| TWBzp | Université Panthéon-Assas            | FALSE      | kpi.K.dotPetu | 3627.7575 | 3627.7575 | 3 628        | 3 628      |   67 |  82.093821 |
| 7Gzub | Université Jean Moulin - Lyon 3      | TRUE       | kpi.K.dotPetu | 4015.3979 | 4015.3979 | 4 015        | 4 015      |   66 | 120.339236 |
| HAU8L | Université de Nîmes                  | TRUE       | kpi.K.dotPetu | 4152.6744 | 4152.6744 | 4 153        | 4 153      |   65 | 106.743635 |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                           | Comparable | kpi           |   valeur |     norm | valeur_label | norm_label | rang | evolution |
|:------|:----------------------------------------|:-----------|:--------------|---------:|---------:|:-------------|:-----------|-----:|----------:|
| zepT6 | Université de la Polynésie Française    | FALSE      | kpi.K.dotPetu | 11604.24 | 11604.24 | 11 604       | 11 604     |    4 |  166.0945 |
| m7K6T | Université Toulouse III - Paul Sabatier | TRUE       | kpi.K.dotPetu | 11708.70 | 11708.70 | 11 709       | 11 709     |    3 |  113.4247 |
| 3Z5e6 | Université Gustave Eiffel               | FALSE      | kpi.K.dotPetu | 11904.53 | 11904.53 | 11 905       | 11 905     |    2 |  174.1003 |
| RN4E6 | Université d’Évry-Val-d’Essonne         | FALSE      | kpi.K.dotPetu | 12091.49 | 12091.49 | 12 091       | 12 091     |    1 |  156.9508 |
| C6Ps7 | Université Paris Dauphine - PSL         | FALSE      | kpi.K.dotPetu |       NA |       NA | N/A          | N/A        |   NA |        NA |

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

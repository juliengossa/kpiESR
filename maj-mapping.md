MAJ Appariements
================
2022-10-02

## Chargement des données

<table>
<thead>
<tr>
<th style="text-align:left;">
dataset
</th>
<th style="text-align:right;">
nb_etabs
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
etab.19
</td>
<td style="text-align:right;">
75
</td>
</tr>
<tr>
<td style="text-align:left;">
etab.20
</td>
<td style="text-align:right;">
14
</td>
</tr>
<tr>
<td style="text-align:left;">
etab.21.1
</td>
<td style="text-align:right;">
8
</td>
</tr>
<tr>
<td style="text-align:left;">
etab.21.2
</td>
<td style="text-align:right;">
254
</td>
</tr>
</tbody>
</table>

## Chargement des données data

    ## Joining, by = c("pid", "UAI")
    ## Joining, by = c("pid", "UAI")
    ## Joining, by = c("pid", "UAI")
    ## Joining, by = c("pid", "UAI")
    ## `summarise()` has grouped output by 'pid'. You can override using the `.groups`
    ## argument.

### Détection des pids manquants

<details>
<summary>
Voir les données
</summary>

| pid | UAI      | enstit | ensnp | bia | etu                               | fin |
|:----|:---------|:-------|:------|:----|:----------------------------------|:----|
|     | 0352756F | NA     | NA    | NA  | Université Bretagne Loire         | NA  |
|     | 0352756F | NA     | NA    | NA  | Université européenne de Bretagne | NA  |

</details>

### Détection des doubles pid

<details>
<summary>
Voir les données
</summary>

| pid         | UAI      | enstit | ensnp | bia | etu                                                          | fin |
|:------------|:---------|:-------|:------|:----|:-------------------------------------------------------------|:----|
| z3hdL;hy4EW | 9710585J |        |       | NA  | Université des Antilles et de la Guyane                      | NA  |
| Z2FY5;zepT6 | 9830491S | NA     | NA    | NA  | Institut universitaire de formation des maîtres du Pacifique | NA  |

</details>

### Détection des doubles UAI

<details>
<summary>
Voir les données
</summary>

| pid   | UAI               | enstit                                                        | ensnp                                                         | bia                                                           | etu                                                           | fin |
|:------|:------------------|:--------------------------------------------------------------|:--------------------------------------------------------------|:--------------------------------------------------------------|:--------------------------------------------------------------|:----|
| QYw7j | 0180974L;0411068N | Institut national des sciences appliquées Centre Val de Loire | Institut national des sciences appliquées Centre Val de Loire | Institut national des sciences appliquées Centre Val de Loire | Institut national des sciences appliquées Centre Val de Loire | NA  |
| S8ntZ | 0632086A;0632033T | Clermont Auvergne INP                                         | Clermont Auvergne INP                                         | Clermont Auvergne INP                                         | SIGMA Clermont                                                | NA  |
| 54VTe | 0597139P;0590349J | Centrale Lille Institut                                       | Centrale Lille Institut                                       | Centrale Lille Institut                                       | Centrale Lille Institut                                       | NA  |
| 6kk6n | 0912423P;0940607Z | École normale supérieure Paris-Saclay                         | École normale supérieure Paris-Saclay                         | École normale supérieure Paris-Saclay                         | École normale supérieure Paris-Saclay                         | NA  |
| 3Z5e6 | 0772502B;0932056E | Université Gustave Eiffel                                     | Université Gustave Eiffel                                     | Université Gustave Eiffel                                     | Université Paris-Est Marne-la-Vallée                          | NA  |
| kWved | 0693817Z;0920812H | NA                                                            | NA                                                            | NA                                                            | École normale supérieure lettres et sciences humaines         | NA  |

</details>

### Détection des UAI vers plusieurs pid

<details>
<summary>
Voir les données
</summary>

| pid         | UAI      | dataset | enstit                     | ensnp                      | bia                        | etu                                                                                                                                                 | fin                        |
|:------------|:---------|:--------|:---------------------------|:---------------------------|:---------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------|
| cQN1f       | 0632033T | fin     | NA                         | NA                         | NA                         | NA                                                                                                                                                  | SIGMA Clermont             |
| S8ntZ       | 0632033T | fin     | Clermont Auvergne INP;NA   | Clermont Auvergne INP;NA   | Clermont Auvergne INP;NA   | SIGMA Clermont;École nationale supérieure de chimie de Clermont-Ferrand;Institut français de mécanique avancée;NA                                   | NA;SIGMA Clermont          |
| z3hdL;hy4EW | 9710585J | enstit  |                            |                            | NA                         | Université des Antilles et de la Guyane                                                                                                             | NA                         |
| z3hdL       | 9710585J | enstit  | Université des Antilles;NA | Université des Antilles;NA | Université des Antilles;NA | Université des Antilles;Institut universitaire de formation des maîtres de Guadeloupe;Institut universitaire de formation des maîtres de Martinique | Université des Antilles;NA |
| z3hdL       | 9710585J | ensnp   | Université des Antilles;NA | Université des Antilles;NA | Université des Antilles;NA | Université des Antilles;Institut universitaire de formation des maîtres de Guadeloupe;Institut universitaire de formation des maîtres de Martinique | Université des Antilles;NA |
| z3hdL;hy4EW | 9710585J | ensnp   |                            |                            | NA                         | Université des Antilles et de la Guyane                                                                                                             | NA                         |
| z3hdL;hy4EW | 9710585J | etu     |                            |                            | NA                         | Université des Antilles et de la Guyane                                                                                                             | NA                         |
| z3hdL       | 9710585J | etu     | Université des Antilles;NA | Université des Antilles;NA | Université des Antilles;NA | Université des Antilles;Institut universitaire de formation des maîtres de Guadeloupe;Institut universitaire de formation des maîtres de Martinique | Université des Antilles;NA |
| XDl91       | 9710585J | fin     | NA                         | NA                         | NA                         | NA                                                                                                                                                  | Université des Antilles    |
| z3hdL       | 9710585J | fin     | Université des Antilles;NA | Université des Antilles;NA | Université des Antilles;NA | Université des Antilles;Institut universitaire de formation des maîtres de Guadeloupe;Institut universitaire de formation des maîtres de Martinique | Université des Antilles;NA |

</details>

## Fix fin

### AutoFix fin

<details>
<summary>
Voir les données
</summary>

| UAI      | pid.x       | pid.y | etab                                                                        |
|:---------|:------------|:------|:----------------------------------------------------------------------------|
| 0632035V | K4lR3       | FvH4k | Université Clermont Auvergne                                                |
| 0751718K | TWBzp       | GBpkg | Université PARIS 2 - PANTHÉON ASSAS                                         |
| 0597065J | U8a0v       | Szqy5 | Université de Lille                                                         |
| 0751721N | 5cZyU       | O2v0H | Université PARIS 5 - RENÉ DESCARTES                                         |
| 0593279U | EW53M       | SuUZ2 | Université VALENCIENNES - HAINAUT-CAMBRÉSIS                                 |
| 0951793H | RS4WF       | W6CUQ | Université CERGY-PONTOISE                                                   |
| 0632033T | S8ntZ       | cQN1f | SIGMA Clermont                                                              |
| 0911101C | G2qA7       | u13se | Université PARIS 11 - PARIS SUD                                             |
| 0593561A | U8a0v       | QhvwL | Université LILLE 3 - CHARLES-DE-GAULLE                                      |
| 0630095L | S8ntZ       | UedNx | ENS CHIMIE CLERMONT-FERRAND                                                 |
| 0381839T | Y7ch7       | VrYMi | Université GRENOBLE 2 - PIERRE MENDÈS FRANCE                                |
| 9710585J | z3hdL;hy4EW | XDl91 | Université des Antilles                                                     |
| 9710585J | z3hdL;hy4EW | z3hdL | Université des Antilles                                                     |
| 0381840U | Y7ch7       | XfV3j | Université GRENOBLE 3 - STENDHAL                                            |
| 0570140T | t6Cq5       | fiHKV | ENI METZ                                                                    |
| 0593560Z | U8a0v       | j5sy1 | Université LILLE 2 - DROIT ET SANTÉ                                         |
| 0751720M | bxPQe       | kvciR | Université PARIS 4 - SORBONNE                                               |
| 0631525R | K4lR3       | n1E6T | Université CLERMONT-FERRAND 2 - BLAISE PASCAL                               |
| 0870862P | nkbwh       | nT44Q | ENSCI LIMOGES                                                               |
| 0593559Y | U8a0v       | qPCgk | Université LILLE 1 - SCIENCES TECHNOLOGIES                                  |
| 0341088Y | evv7S       | w3F5n | Université MONTPELLIER 2 - SCIENCES TECHNIQUES DU LANGUEDOC                 |
| 0440984F | qUCQp       | 7hB8r | Université NANTES                                                           |
| 0420093Y | fWJJA       | 7s7yT | ENI SAINT-ETIENNE                                                           |
| 0342321N | evv7S       | 7yd5d | Université de Montpellier                                                   |
| 0751723R | 5cZyU       | 5KpJ9 | Université PARIS 7 - DENIS DIDEROT                                          |
| 0590311T | 54VTe       | 67su6 | ENS CHIMIE LILLE                                                            |
| 0060931E | s3t8T       | 7CYWd | Université NICE - SOPHIA-ANTIPOLIS                                          |
| 0772502B | 3Z5e6       | 9Y8CD | Université MARNE-LA-VALLÉE                                                  |
| 0383493R | Y7ch7       | F2yh2 | Université Grenoble Alpes                                                   |
| 0596870X | U8a0v       | IZ3tY | Université Lille Nord de France                                             |
| 0751722P | bxPQe       | 3RMeh | Université PARIS 6 - PIERRE ET MARIE CURIE                                  |
| 0631262E | K4lR3       | 3itX6 | Université CLERMONT-FERRAND 1 - AUVERGNE                                    |
| 0341087X | evv7S       | 9ZF2M | Université MONTPELLIER 1                                                    |
| 0331764N | 90I54       | IXJPr | Université BORDEAUX 1 - SCIENCES TECHNOLOGIES                               |
| 0381838S | Y7ch7       | Mrr0h | Université GRENOBLE 1 - JOSEPH FOURIER                                      |
| 0631833A | S8ntZ       | gMz48 | IFMA CLERMONT FERRAND                                                       |
| 0332929E | 90I54       | vFsty | Université BORDEAUX 4 - MONTESQUIEU                                         |
| 0331765P | 90I54       | xE7KR | Université BORDEAUX 2 - VICTOR SEGALEN                                      |
| 0062126D | s3t8T       | RDy6Q | COMUE université côte d’azur                                                |
| 0755700N | PpsCQ       | Olkw0 | Université de recherche Paris sciences et lettres - PSL Research University |
| 0912330N | G2qA7       | dV766 | COMUE Université Paris-Saclay                                               |
| 0952199Z | RS4WF       | i9syi | Université Paris-Seine                                                      |
| 0383412C | Y7ch7       | hB4QE | COMUE Université Grenoble Alpes                                             |
| 0752744A | vQ6Hh       | WvkK5 | Académie des sciences d’outre-mer                                           |
| 0342255S | evv7S       | 4TeGd | Languedoc-Roussillon Universités                                            |
| 0352756F |             | XIGGw | Université Bretagne Loire                                                   |

</details>
<details>
<summary>
Check
</summary>

| UAI | pid.x | pid.y | etab |
|:----|:------|:------|:-----|

</details>

### Modifications manuelles du fix

<details>
<summary>
Voir les données
</summary>

| UAI      | pid.x | pid.y       | etab                                                                        |
|:---------|:------|:------------|:----------------------------------------------------------------------------|
| 0632035V | K4lR3 | FvH4k       | Université Clermont Auvergne                                                |
| 0751718K | TWBzp | GBpkg       | Université PARIS 2 - PANTHÉON ASSAS                                         |
| 0597065J | U8a0v | Szqy5       | Université de Lille                                                         |
| 0751721N | 5cZyU | O2v0H       | Université PARIS 5 - RENÉ DESCARTES                                         |
| 0593279U | EW53M | SuUZ2       | Université VALENCIENNES - HAINAUT-CAMBRÉSIS                                 |
| 0951793H | RS4WF | W6CUQ       | Université CERGY-PONTOISE                                                   |
| 0632033T | S8ntZ | cQN1f       | SIGMA Clermont                                                              |
| 0911101C | G2qA7 | u13se       | Université PARIS 11 - PARIS SUD                                             |
| 0593561A | U8a0v | QhvwL       | Université LILLE 3 - CHARLES-DE-GAULLE                                      |
| 0630095L | S8ntZ | UedNx       | ENS CHIMIE CLERMONT-FERRAND                                                 |
| 0381839T | Y7ch7 | VrYMi       | Université GRENOBLE 2 - PIERRE MENDÈS FRANCE                                |
| 0381840U | Y7ch7 | XfV3j       | Université GRENOBLE 3 - STENDHAL                                            |
| 0570140T | t6Cq5 | fiHKV       | ENI METZ                                                                    |
| 0593560Z | U8a0v | j5sy1       | Université LILLE 2 - DROIT ET SANTÉ                                         |
| 0751720M | bxPQe | kvciR       | Université PARIS 4 - SORBONNE                                               |
| 0631525R | K4lR3 | n1E6T       | Université CLERMONT-FERRAND 2 - BLAISE PASCAL                               |
| 0870862P | nkbwh | nT44Q       | ENSCI LIMOGES                                                               |
| 0593559Y | U8a0v | qPCgk       | Université LILLE 1 - SCIENCES TECHNOLOGIES                                  |
| 0341088Y | evv7S | w3F5n       | Université MONTPELLIER 2 - SCIENCES TECHNIQUES DU LANGUEDOC                 |
| 0440984F | qUCQp | 7hB8r       | Université NANTES                                                           |
| 0420093Y | fWJJA | 7s7yT       | ENI SAINT-ETIENNE                                                           |
| 0342321N | evv7S | 7yd5d       | Université de Montpellier                                                   |
| 0751723R | 5cZyU | 5KpJ9       | Université PARIS 7 - DENIS DIDEROT                                          |
| 0590311T | 54VTe | 67su6       | ENS CHIMIE LILLE                                                            |
| 0060931E | s3t8T | 7CYWd       | Université NICE - SOPHIA-ANTIPOLIS                                          |
| 0772502B | 3Z5e6 | 9Y8CD       | Université MARNE-LA-VALLÉE                                                  |
| 0383493R | Y7ch7 | F2yh2       | Université Grenoble Alpes                                                   |
| 0596870X | U8a0v | IZ3tY       | Université Lille Nord de France                                             |
| 0751722P | bxPQe | 3RMeh       | Université PARIS 6 - PIERRE ET MARIE CURIE                                  |
| 0631262E | K4lR3 | 3itX6       | Université CLERMONT-FERRAND 1 - AUVERGNE                                    |
| 0341087X | evv7S | 9ZF2M       | Université MONTPELLIER 1                                                    |
| 0331764N | 90I54 | IXJPr       | Université BORDEAUX 1 - SCIENCES TECHNOLOGIES                               |
| 0381838S | Y7ch7 | Mrr0h       | Université GRENOBLE 1 - JOSEPH FOURIER                                      |
| 0631833A | S8ntZ | gMz48       | IFMA CLERMONT FERRAND                                                       |
| 0332929E | 90I54 | vFsty       | Université BORDEAUX 4 - MONTESQUIEU                                         |
| 0331765P | 90I54 | xE7KR       | Université BORDEAUX 2 - VICTOR SEGALEN                                      |
| 0062126D | s3t8T | RDy6Q       | COMUE université côte d’azur                                                |
| 0755700N | PpsCQ | Olkw0       | Université de recherche Paris sciences et lettres - PSL Research University |
| 0912330N | G2qA7 | dV766       | COMUE Université Paris-Saclay                                               |
| 0952199Z | RS4WF | i9syi       | Université Paris-Seine                                                      |
| 0383412C | Y7ch7 | hB4QE       | COMUE Université Grenoble Alpes                                             |
| 0752744A | vQ6Hh | WvkK5       | Académie des sciences d’outre-mer                                           |
| 0342255S | evv7S | 4TeGd       | Languedoc-Roussillon Universités                                            |
| Manuel   | z3hdL | z3hdL;hy4EW | NA                                                                          |
| Manuel   | z3hdL | XDl91       | NA                                                                          |
| Manuel   | Z2FY5 | Z2FY5;zepT6 | NA                                                                          |

</details>

### Application du fix

### Check : données incomplètes Universités

<table>
<thead>
<tr>
<th style="text-align:left;">
pid
</th>
<th style="text-align:left;">
dataset
</th>
<th style="text-align:left;">
etab
</th>
<th style="text-align:left;">
UAI
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
etu
</td>
<td style="text-align:left;">
Université Bretagne Loire
</td>
<td style="text-align:left;">
0352756F
</td>
</tr>
<tr>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
etu
</td>
<td style="text-align:left;">
Université européenne de Bretagne
</td>
<td style="text-align:left;">
0352756F
</td>
</tr>
<tr>
<td style="text-align:left;">
4a8B2
</td>
<td style="text-align:left;">
bia
</td>
<td style="text-align:left;">
Université fédérale de Toulouse Midi-Pyrénées
</td>
<td style="text-align:left;">
0312758E
</td>
</tr>
<tr>
<td style="text-align:left;">
52U59
</td>
<td style="text-align:left;">
bia
</td>
<td style="text-align:left;">
Université confédérale Léonard de Vinci
</td>
<td style="text-align:left;">
0861420B
</td>
</tr>
<tr>
<td style="text-align:left;">
52U59
</td>
<td style="text-align:left;">
fin
</td>
<td style="text-align:left;">
Université confédérale Léonard de Vinci
</td>
<td style="text-align:left;">
0861420B
</td>
</tr>
<tr>
<td style="text-align:left;">
6g0Mb
</td>
<td style="text-align:left;">
fin
</td>
<td style="text-align:left;">
Université PARIS-EST
</td>
<td style="text-align:left;">
0772710C
</td>
</tr>
<tr>
<td style="text-align:left;">
86UpY
</td>
<td style="text-align:left;">
bia
</td>
<td style="text-align:left;">
Université Paris Lumières
</td>
<td style="text-align:left;">
0755698L
</td>
</tr>
<tr>
<td style="text-align:left;">
86UpY
</td>
<td style="text-align:left;">
etu
</td>
<td style="text-align:left;">
Université Paris Lumières
</td>
<td style="text-align:left;">
0755698L
</td>
</tr>
<tr>
<td style="text-align:left;">
86UpY
</td>
<td style="text-align:left;">
fin
</td>
<td style="text-align:left;">
Université Paris Lumières
</td>
<td style="text-align:left;">
0755698L
</td>
</tr>
<tr>
<td style="text-align:left;">
8A0mg
</td>
<td style="text-align:left;">
bia
</td>
<td style="text-align:left;">
Université Bourgogne - Franche-Comté
</td>
<td style="text-align:left;">
0251985X
</td>
</tr>
<tr>
<td style="text-align:left;">
8A0mg
</td>
<td style="text-align:left;">
etu
</td>
<td style="text-align:left;">
Université Bourgogne - Franche-Comté
</td>
<td style="text-align:left;">
0251985X
</td>
</tr>
<tr>
<td style="text-align:left;">
8A0mg
</td>
<td style="text-align:left;">
fin
</td>
<td style="text-align:left;">
Université BOURGOGNE FRANCHE-COMTÉ
</td>
<td style="text-align:left;">
0251985X
</td>
</tr>
<tr>
<td style="text-align:left;">
EPci7
</td>
<td style="text-align:left;">
bia
</td>
<td style="text-align:left;">
HESAM Université
</td>
<td style="text-align:left;">
0755581J
</td>
</tr>
<tr>
<td style="text-align:left;">
G1r6y
</td>
<td style="text-align:left;">
bia
</td>
<td style="text-align:left;">
Normandie Université
</td>
<td style="text-align:left;">
0142382N
</td>
</tr>
<tr>
<td style="text-align:left;">
iq0rG
</td>
<td style="text-align:left;">
bia
</td>
<td style="text-align:left;">
Université de Lyon
</td>
<td style="text-align:left;">
0694094A
</td>
</tr>
<tr>
<td style="text-align:left;">
iq0rG
</td>
<td style="text-align:left;">
fin
</td>
<td style="text-align:left;">
Université de Lyon
</td>
<td style="text-align:left;">
0694094A
</td>
</tr>
<tr>
<td style="text-align:left;">
XIGGw
</td>
<td style="text-align:left;">
fin
</td>
<td style="text-align:left;">
Université Bretagne Loire
</td>
<td style="text-align:left;">
0352756F
</td>
</tr>
</tbody>
</table>

## Chargement des données CPESR

<table>
<thead>
<tr>
<th style="text-align:right;">
nb_etabs
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
295
</td>
</tr>
</tbody>
</table>

### Détection des établissements en double

<table>
<thead>
<tr>
<th style="text-align:left;">
UAI
</th>
<th style="text-align:left;">
Etablissement
</th>
<th style="text-align:left;">
Type
</th>
<th style="text-align:left;">
Groupe
</th>
<th style="text-align:left;">
PerimEx
</th>
<th style="text-align:left;">
Association
</th>
<th style="text-align:left;">
Comparable
</th>
</tr>
</thead>
<tbody>
<tr>
</tr>
</tbody>
</table>

## Ajout des pid à cpesr

    ## Joining, by = "UAI"

### université cpesr double pid

<details>
<summary>
Voir les données
</summary>

| pid | UAI | Etablissement | Type | Groupe | PerimEx | Association | Comparable |
|:----|:----|:--------------|:-----|:-------|:--------|:------------|:-----------|

</details>

### université cpesr sans pid

<details>
<summary>
Voir les données
</summary>

| pid | UAI | Etablissement | Type | Groupe | PerimEx | Association | Comparable |
|:----|:----|:--------------|:-----|:-------|:--------|:------------|:-----------|

</details>

### pid hors cpesr

    ## Joining, by = "UAI"

<details>
<summary>
Voir les données
</summary>

| pid | UAI | etab |
|:----|:----|:-----|

</details>

### pid hors cpesr dans etab

<details>
<summary>
Voir les données
</summary>

    ## Joining, by = "UAI"

| pid | UAI | etab | Etablissement | Sigle | Type | Académie | Rattachement | Fusion | url.siteweb | url.wikidata | url.legifrance | twitter | dataset |
|:----|:----|:-----|:--------------|:------|:-----|:---------|:-------------|:-------|:------------|:-------------|:---------------|:--------|:--------|

</details>

### pid hors cpesr hors etab

<details>
<summary>
Voir les données
</summary>

    ## Joining, by = "UAI"

| pid | UAI | etab | Etablissement | Sigle | Type | Académie | Rattachement | Fusion | url.siteweb | url.wikidata | url.legifrance | twitter | dataset |
|:----|:----|:-----|:--------------|:------|:-----|:---------|:-------------|:-------|:------------|:-------------|:---------------|:--------|:--------|

</details>

## Créations du jeu de données établissement

    ## Joining, by = "UAI"
    ## Joining, by = "pid"

<details>
<summary>
Voir les données
</summary>

    ## `summarise()` has grouped output by 'Groupe'. You can override using the
    ## `.groups` argument.

| Groupe                   | nb_ds_4 | nb_ds_5 | nb_ds_1 | nb_ds_2 | nb_ds_3 |
|:-------------------------|--------:|--------:|--------:|--------:|--------:|
| Universités et assimilés |       5 |      65 |       0 |       0 |       0 |
| Regroupements            |       0 |       0 |       2 |       6 |       3 |
| Ecoles d’ingénieurs      |       1 |      30 |       1 |       0 |       0 |
| Autres établissements    |       4 |      26 |       3 |       6 |       3 |

</details>

### Vérification doublons

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement             | Groupe        | Groupe.détaillé | Type                                       | nb_datasets | UAI      | PerimEx | Association | Comparable | Sigle | Académie | Rattachement | Fusion | url.siteweb                  | url.wikidata                                | url.legifrance                                                               | twitter | dataset | Plotable |
|:------|:--------------------------|:--------------|:----------------|:-------------------------------------------|------------:|:---------|:--------|:------------|:-----------|:------|:---------|:-------------|:-------|:-----------------------------|:--------------------------------------------|:-----------------------------------------------------------------------------|:--------|:--------|:---------|
|       | Université Bretagne Loire | Regroupements | Regroupements   | Communauté d’universités et établissements |           1 | 0352756F |         |             | TRUE       | UBL   | Rennes   | NA           | NA     | <http://u-bretagneloire.fr/> | <https://www.wikidata.org/entity/Q21994834> | <http://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000031794321> | NA      | etab.19 | FALSE    |
| XIGGw | Université Bretagne Loire | Regroupements | Regroupements   | Communauté d’universités et établissements |           1 | 0352756F |         |             | TRUE       | UBL   | Rennes   | NA           | NA     | <http://u-bretagneloire.fr/> | <https://www.wikidata.org/entity/Q21994834> | <http://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000031794321> | NA      | etab.19 | FALSE    |

</details>
<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement             | Groupe        | Groupe.détaillé | Type                                       | nb_datasets | UAI      | PerimEx | Association | Comparable | Sigle | Académie | Rattachement | Fusion | url.siteweb                  | url.wikidata                                | url.legifrance                                                               | twitter | dataset | Plotable |
|:------|:--------------------------|:--------------|:----------------|:-------------------------------------------|------------:|:---------|:--------|:------------|:-----------|:------|:---------|:-------------|:-------|:-----------------------------|:--------------------------------------------|:-----------------------------------------------------------------------------|:--------|:--------|:---------|
|       | Université Bretagne Loire | Regroupements | Regroupements   | Communauté d’universités et établissements |           1 | 0352756F |         |             | TRUE       | UBL   | Rennes   | NA           | NA     | <http://u-bretagneloire.fr/> | <https://www.wikidata.org/entity/Q21994834> | <http://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000031794321> | NA      | etab.19 | FALSE    |
| XIGGw | Université Bretagne Loire | Regroupements | Regroupements   | Communauté d’universités et établissements |           1 | 0352756F |         |             | TRUE       | UBL   | Rennes   | NA           | NA     | <http://u-bretagneloire.fr/> | <https://www.wikidata.org/entity/Q21994834> | <http://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000031794321> | NA      | etab.19 | FALSE    |

</details>

### Wikidata manquants

<details>
<summary>
Voir les données
</summary>

| Groupe                   | pid         | Etablissement                                                | url.wikidata |
|:-------------------------|:------------|:-------------------------------------------------------------|:-------------|
| Autres établissements    | vQ6Hh       | Académie des sciences d’outre-mer                            | NA           |
| Autres établissements    | J8X6q       | Agence bibliographique de l’enseignement supérieur           | NA           |
| Autres établissements    | VfvdY       | Bibliothèque nationale et universitaire de Strasbourg        | NA           |
| Autres établissements    | 1bXaK       | Bibliothèque universitaire des langues et civilisations      | NA           |
| Autres établissements    | QuDx7       | Centre informatique national de l’enseignement supérieur     | NA           |
| Autres établissements    | fV2g5       | Centre technique du livre de l’enseignement supérieur        | NA           |
| Autres établissements    | 6kk6n       | École normale supérieure Paris-Saclay                        | NA           |
| Autres établissements    | Z2FY5;zepT6 | Institut universitaire de formation des maîtres du Pacifique | NA           |
| Ecoles d’ingénieurs      | S8ntZ       | Clermont Auvergne INP                                        | NA           |
| Ecoles d’ingénieurs      | J3Mu2       | INSA Hauts-de-France                                         | NA           |
| Universités et assimilés | qUCQp       | Nantes Université                                            | NA           |
| Universités et assimilés | K4lR3       | Université Clermont Auvergne                                 | NA           |
| Universités et assimilés | U8a0v       | Université de Lille                                          | NA           |
| Universités et assimilés | evv7S       | Université de Montpellier                                    | NA           |
| Universités et assimilés | EW53M       | Université Polytechnique Hauts-de-France                     | NA           |

</details>

#### Correction manuelle

<details>
<summary>
Voir les données
</summary>

| pid   | url.wikidata                               |
|:------|:-------------------------------------------|
| qUCQp | <https://www.wikidata.org/entity/Q259388>  |
| EW53M | <https://www.wikidata.org/entity/Q1548539> |
| evv7S | <https://www.wikidata.org/entity/Q776223>  |
| K4lR3 | <https://www.wikidata.org/entity/Q1319786> |
| U8a0v | <https://www.wikidata.org/entity/Q3551621> |
| 6kk6n | <https://www.wikidata.org/entity/Q273604>  |
| VfvdY | <https://www.wikidata.org/entity/Q630461>  |

</details>

### Sigles manquants

#### Sigles récupérables sur wikidata

    ## Warning in wdesr_get_item_status(item): The instance of wikidata item Q834819 is not recommended: université.
    ##   Reason is: Statut trop imprécis.
    ##   Please check https://www.wikidata.org/wiki/Q834819
    ##   using the guideline at https://github.com/cpesr

    ## Warning in wdesr_get_item_status(item): The instance of wikidata item Q74452784 is not recommended: université.
    ##   Reason is: Statut trop imprécis.
    ##   Please check https://www.wikidata.org/wiki/Q74452784
    ##   using the guideline at https://github.com/cpesr

    ## Warning in wdesr_get_item_status(item): The instance of wikidata item Q578023 is not recommended: université.
    ##   Reason is: Statut trop imprécis.
    ##   Please check https://www.wikidata.org/wiki/Q578023
    ##   using the guideline at https://github.com/cpesr

    ## Warning in wdesr_get_item_status(item): The instance of wikidata item Q2935605 is unknown by wikidataESR: campus.
    ##   Default level is set to 5.
    ##   Please check the property P31 at https://www.wikidata.org/wiki/Q2935605
    ##   using the guideline at https://github.com/cpesr

    ## Warning in rbind(deparse.level, ...): number of columns of result, 7, is not a
    ## multiple of vector length 6 of arg 2

    ## Warning in wdesr_get_item_status(item): The instance of wikidata item Q1665121 is not recommended: institut de technologie.
    ##   Reason is: Statut trop imprécis.
    ##   Please check https://www.wikidata.org/wiki/Q1665121
    ##   using the guideline at https://github.com/cpesr

    ## Warning in wdesr_get_item_status(item): The instance of wikidata item Q273458 is not recommended: école d'ingé.
    ##   Reason is: Statut trop imprécis.
    ##   Please check https://www.wikidata.org/wiki/Q273458
    ##   using the guideline at https://github.com/cpesr

    ## Warning in wdesr_get_item_status(item): The instance of wikidata item Q1267711 is not recommended: Grande ecole.
    ##   Reason is: Réserver aux écoles non contemporaines.
    ##   Please check https://www.wikidata.org/wiki/Q1267711
    ##   using the guideline at https://github.com/cpesr

    ## Warning in wdesr_get_item_status(item): The instance of wikidata item Q202660 is not recommended: institution éducative.
    ##   Reason is: Statut trop imprécis.
    ##   Please check https://www.wikidata.org/wiki/Q202660
    ##   using the guideline at https://github.com/cpesr

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                         | Sigle                                   |
|:------|:------------------------------------------------------|:----------------------------------------|
| 4k25D | Université de Strasbourg                              | Unistra                                 |
| 7Gzub | Université Jean Moulin - Lyon 3                       | Lyon 3                                  |
| 8k883 | Université Sorbonne Nouvelle - Paris 3                | Paris 3                                 |
| 9wAap | Université de Rennes 1                                | UR1                                     |
| atbEK | La Rochelle Université                                | La Rochelle Université                  |
| BWbvP | Université d’Artois                                   | U. Artois                               |
| C701f | Université de Toulon                                  | Ustv                                    |
| cEt92 | Université de La Réunion                              | UFOI                                    |
| cqkij | Université de Tours                                   | université de Tours                     |
| cqyN7 | Université Sorbonne Paris Nord                        | UP13                                    |
| CUBKB | Université Lumière - Lyon 2                           | Lyon 2                                  |
| etBz7 | Université Claude Bernard - Lyon 1                    | UCBL                                    |
| evv7S | Université de Montpellier                             | Université de Montpellier               |
| G2qA7 | Université Paris-Saclay                               | UPSaclay                                |
| g6rwB | Université Paris Nanterre                             | Paris X                                 |
| HCBvW | Université d’Orléans                                  | Université d’Orléans                    |
| hlX1r | Université de Poitiers                                | UnivPoitiers                            |
| hy4EW | Université de Guyane                                  | Université de Guyane                    |
| IXHyv | Université d’Angers                                   | U. Angers                               |
| LsQ24 | Université Le Havre Normandie                         | ULH                                     |
| m7K6T | Université Toulouse III - Paul Sabatier               | Université Toulouse III                 |
| nkbwh | Université de Limoges                                 | Unilim                                  |
| NLCOF | Université de Corse Pasquale Paoli                    | université de Corse                     |
| qUCQp | Nantes Université                                     | UN                                      |
| RS4WF | CY Cergy Paris Université                             | CY                                      |
| t6Cq5 | Université de Lorraine                                | université de Lorraine                  |
| ti37C | Université Rennes 2                                   | Rennes 2                                |
| TWBzp | Université Panthéon-Assas                             | Assas                                   |
| U8a0v | Université de Lille                                   | UDL                                     |
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis          | UP8                                     |
| Z2FY5 | Université de la Nouvelle-Calédonie                   | Université de la Nouvelle-Calédonie     |
| z3hdL | Université des Antilles                               | UnivAG                                  |
| 4a8B2 | Université fédérale de Toulouse Midi-Pyrénées         | université de Toulouse                  |
| 52U59 | Université confédérale Léonard de Vinci               | université confédérale Léonard-de-Vinci |
| 86UpY | Université Paris Lumières                             | UPL                                     |
| 8A0mg | Université Bourgogne - Franche-Comté                  | Comue de Bourgogne Franche-Comté        |
| DmOC1 | Campus Condorcet                                      | Campus Condorcet                        |
| G1r6y | Normandie Université                                  | Normandie Université                    |
| 2ALYK | Institut polytechnique de Grenoble                    | INPG                                    |
| gCAyK | Centrale Nantes                                       | Centrale nantes                         |
| m84Aa | CentraleSupélec                                       | CentraleSupelec                         |
| OYA17 | ISAE-Supméca                                          | supméca                                 |
| 0Mvk5 | Collège de France                                     | Collège de France                       |
| 6a498 | Casa de Velázquez de Madrid                           | Casa Velasquez                          |
| 6kk6n | École normale supérieure Paris-Saclay                 | ENS Cachan                              |
| tr5VV | Observatoire de Paris                                 | Observatoire de Paris - PSL             |
| VfvdY | Bibliothèque nationale et universitaire de Strasbourg | BNU                                     |

</details>

#### Sigles toujours manquants et fix automatique

<details>
<summary>
Voir les données
</summary>

| UAI      | pid         | Etablissement                                                | Sigle | url.wikidata |
|:---------|:------------|:-------------------------------------------------------------|:------|:-------------|
| 0755040W | 1bXaK       | Bibliothèque universitaire des langues et civilisations      | NA    | NA           |
| 0772428W | fV2g5       | Centre technique du livre de l’enseignement supérieur        | NA    | NA           |
| 0341920C | J8X6q       | Agence bibliographique de l’enseignement supérieur           | NA    | NA           |
| 0342032Z | QuDx7       | Centre informatique national de l’enseignement supérieur     | NA    | NA           |
| 0752744A | vQ6Hh       | Académie des sciences d’outre-mer                            | NA    | NA           |
| 0632086A | S8ntZ       | Clermont Auvergne INP                                        | NA    | NA           |
| 9830491S | Z2FY5;zepT6 | Institut universitaire de formation des maîtres du Pacifique | NA    | NA           |

</details>

### Ecriture des fichiers

<details>
<summary>
Voir les données
</summary>

| pid         | Etablissement                                                                                                                | Groupe                   | Groupe.détaillé                                                                               | Type                                          | nb_datasets | UAI      | PerimEx | Association | Comparable | Sigle                                                        | Académie            | Rattachement                        | Fusion | url.siteweb                                    | url.wikidata                                 | url.legifrance                                                                                                                                                                                               | twitter                               | dataset   | Plotable |
|:------------|:-----------------------------------------------------------------------------------------------------------------------------|:-------------------------|:----------------------------------------------------------------------------------------------|:----------------------------------------------|------------:|:---------|:--------|:------------|:-----------|:-------------------------------------------------------------|:--------------------|:------------------------------------|:-------|:-----------------------------------------------|:---------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------|:----------|:---------|
| xJdyB       | Aix-Marseille Université                                                                                                     | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0134009M | IDEx    | Udice       | TRUE       | AMU                                                          | Aix-Marseille       | NA                                  | TRUE   | <https://www.univ-amu.fr/>                     | <https://www.wikidata.org/entity/Q2302586>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046004125/>                                                                                                                                               | <https://twitter.com/univamu>         | etab.21.2 | TRUE     |
| vxHYt       | Avignon Université                                                                                                           | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0840685N |         | AUREF       | TRUE       | AU                                                           | Aix-Marseille       | NA                                  | NA     | <https://univ-avignon.fr/>                     | <https://www.wikidata.org/entity/Q2033119>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000032101280/>                                                                                                                                               | <https://twitter.com/univavignon>     | etab.21.2 | TRUE     |
| pVJpw       | Centre universitaire de Mayotte                                                                                              | Universités et assimilés | Universités et assimilés                                                                      | Autre établissement                           |           5 | 9760358K |         |             | FALSE      | CU de Mayotte                                                | Mayotte             | NA                                  | NA     | <http://www.univ-mayotte.fr/>                  | <https://www.wikidata.org/entity/Q2946102>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000042896857/>                                                                                                                                               | NA                                    | etab.21.2 | TRUE     |
| RS4WF       | CY Cergy Paris Université                                                                                                    | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0952259P | ISITE   |             | FALSE      | CY                                                           | Versailles          | NA                                  | NA     | <https://www.cyu.fr/>                          | <https://www.wikidata.org/entity/Q74452784>  | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000042393673/>                                                                                                                                               | <https://twitter.com/UniversiteCergy> | etab.21.2 | TRUE     |
| atbEK       | La Rochelle Université                                                                                                       | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0171463Y |         | AUREF       | TRUE       | La Rochelle Université                                       | Poitiers            | NA                                  | NA     | <https://www.univ-larochelle.fr/>              | <https://www.wikidata.org/entity/Q1500822>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000041885628/>                                                                                                                                               | <https://twitter.com/UnivLaRochelle>  | etab.21.2 | TRUE     |
| 9xlel       | Le Mans Université                                                                                                           | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0720916E |         | AUREF       | TRUE       | LMU                                                          | Nantes              | NA                                  | NA     | <http://www.univ-lemans.fr/>                   | <https://www.wikidata.org/entity/Q834825>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000042841466/>                                                                                                                                               | <https://twitter.com/LeMansUniv>      | etab.21.2 | TRUE     |
| qUCQp       | Nantes Université                                                                                                            | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           4 | 0442953W | ISITE   |             | TRUE       | UN                                                           | Nantes              | NA                                  | NA     | <https://www.univ-nantes.fr/>                  | <https://www.wikidata.org/entity/Q259388>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044155976/>                                                                                                                                               | <https://twitter.com/NantesUniv>      | etab.21.2 | TRUE     |
| bxPQe       | Sorbonne Université                                                                                                          | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0755890V | IDEx    | Udice       | TRUE       | Sorbonne U                                                   | Paris               | NA                                  | NA     | <https://www.sorbonne-universite.fr/>          | <https://www.wikidata.org/entity/Q41497113>  | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045593456/>                                                                                                                                               | <https://twitter.com/Sorbonne_Univ_>  | etab.21.2 | TRUE     |
| Mz90U       | Université Bordeaux Montaigne                                                                                                | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0331766R |         | AUREF       | TRUE       | UBM                                                          | Bordeaux            | NA                                  | NA     | <http://www.u-bordeaux-montaigne.fr/>          | <https://www.wikidata.org/entity/Q13342>     | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000041885628/>                                                                                                                                               | <https://twitter.com/UBMontaigne>     | etab.21.2 | TRUE     |
| 5tVy4       | Université Bretagne Sud                                                                                                      | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0561718N |         | AUREF       | TRUE       | UBS                                                          | Rennes              | NA                                  | NA     | <http://www.univ-ubs.fr/>                      | <https://www.wikidata.org/entity/Q1125958>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000039645865/>                                                                                                                                               | <https://twitter.com/ubs_universite>  | etab.21.2 | TRUE     |
| etBz7       | Université Claude Bernard - Lyon 1                                                                                           | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0691774D | IDEx    | Udice       | TRUE       | UCBL                                                         | Lyon                | NA                                  | NA     | <https://www.univ-lyon1.fr/>                   | <https://www.wikidata.org/entity/Q4032>      | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/UnivLyon1>       | etab.21.2 | TRUE     |
| K4lR3       | Université Clermont Auvergne                                                                                                 | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           4 | 0632084Y | ISITE   |             | TRUE       | UCA                                                          | Clermont-Ferrand    | NA                                  | NA     | NA                                             | <https://www.wikidata.org/entity/Q1319786>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046004125/>                                                                                                                                               | NA                                    | etab.21.2 | TRUE     |
| s3t8T       | Université Côte d’Azur                                                                                                       | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0062205P | IDEx    | Udice       | TRUE       | UCA                                                          | Nice                | NA                                  | NA     | <https://univ-cotedazur.fr/>                   | <https://www.wikidata.org/entity/Q80186910>  | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/Univ_CotedAzur>  | etab.21.2 | TRUE     |
| IXHyv       | Université d’Angers                                                                                                          | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0490970N |         | AUREF       | TRUE       | U. Angers                                                    | Nantes              | NA                                  | NA     | <https://www.univ-angers.fr/>                  | <https://www.wikidata.org/entity/Q1538727>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/UnivAngers>      | etab.21.2 | TRUE     |
| BWbvP       | Université d’Artois                                                                                                          | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0623957P |         | AUREF       | TRUE       | U. Artois                                                    | Lille               | NA                                  | NA     | <http://www.univ-artois.fr/>                   | <https://www.wikidata.org/entity/Q475504>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044250174/>                                                                                                                                               | <https://twitter.com/Univ_Artois>     | etab.21.2 | TRUE     |
| RN4E6       | Université d’Évry-Val-d’Essonne                                                                                              | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0911975C |         |             | FALSE      | UEVE                                                         | Versailles          | NA                                  | NA     | <https://www.univ-evry.fr/>                    | <https://www.wikidata.org/entity/Q1531014>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000038559711/>                                                                                                                                               | <https://twitter.com/UnivEvry>        | etab.21.2 | TRUE     |
| HCBvW       | Université d’Orléans                                                                                                         | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0450855K |         |             | TRUE       | Université d’Orléans                                         | Orléans-Tours       | NA                                  | NA     | <https://www.univ-orleans.fr/fr>               | <https://www.wikidata.org/entity/Q13334>     | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046004125/>                                                                                                                                               | <https://twitter.com/Univ_Orleans>    | etab.21.2 | TRUE     |
| 90I54       | Université de Bordeaux                                                                                                       | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0333298F | IDEx    | Udice       | TRUE       | UBx                                                          | Bordeaux            | NA                                  | TRUE   | <https://www.u-bordeaux.fr/>                   | <https://www.wikidata.org/entity/Q13344>     | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/univbordeaux>    | etab.21.2 | TRUE     |
| Lr94O       | Université de Bourgogne                                                                                                      | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0211237F | ISITE   |             | TRUE       | uB                                                           | Dijon               | NA                                  | NA     | <http://www.u-bourgogne.fr/>                   | <https://www.wikidata.org/entity/Q287072>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/univbourgogne>   | etab.21.2 | TRUE     |
| 06SE7       | Université de Bretagne Occidentale                                                                                           | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0290346U |         |             | TRUE       | UBO                                                          | Rennes              | NA                                  | NA     | <http://www.univ-brest.fr/>                    | <https://www.wikidata.org/entity/Q1857334>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/UBO_UnivBrest>   | etab.21.2 | TRUE     |
| p25Q3       | Université de Caen Normandie                                                                                                 | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0141408E |         | AUREF       | TRUE       | UNICAEN                                                      | Caen                | NA                                  | NA     | <http://www.unicaen.fr/>                       | <https://www.wikidata.org/entity/Q568554>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000031056872/>                                                                                                                                               | <https://twitter.com/universite_caen> | etab.21.2 | TRUE     |
| NLCOF       | Université de Corse Pasquale Paoli                                                                                           | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 7200664J |         | AUREF       | FALSE      | université de Corse                                          | Corse               | NA                                  | NA     | <https://www.universita.corsica/fr/>           | <https://www.wikidata.org/entity/Q335841>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/univcorse>       | etab.21.2 | TRUE     |
| 7Mpgt       | Université de Franche-Comté                                                                                                  | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0251215K | ISITE   |             | TRUE       | UFC                                                          | Besançon            | NA                                  | NA     | <https://www.univ-fcomte.fr/>                  | <https://www.wikidata.org/entity/Q829449>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/fc_univ>         | etab.21.2 | TRUE     |
| hy4EW       | Université de Guyane                                                                                                         | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 9730429D |         |             | FALSE      | Université de Guyane                                         | Guyane              | NA                                  | NA     | <http://www.univ-guyane.fr/>                   | <https://www.wikidata.org/entity/Q16682067>  | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000030784348/>                                                                                                                                               | <https://twitter.com/univguyane>      | etab.21.2 | TRUE     |
| OJZ4a       | Université de Haute-Alsace                                                                                                   | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0681166Y |         | AUREF       | FALSE      | UHA                                                          | Strasbourg          | NA                                  | NA     | <https://www.uha.fr/>                          | <https://www.wikidata.org/entity/Q280183>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000043623826/>                                                                                                                                               | <https://twitter.com/UHA68>           | etab.21.2 | TRUE     |
| Z2FY5       | Université de la Nouvelle-Calédonie                                                                                          | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 9830445S |         |             | FALSE      | Université de la Nouvelle-Calédonie                          | Nouvelle-Calédonie  | NA                                  | NA     | <https://unc.nc/>                              | <https://www.wikidata.org/entity/Q734332>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000042434584/>                                                                                                                                               | <https://twitter.com/unc_nc>          | etab.21.2 | TRUE     |
| zepT6       | Université de la Polynésie Française                                                                                         | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 9840349G |         |             | FALSE      | UPF                                                          | Polynésie Française | NA                                  | NA     | <http://www.upf.pf/>                           | <https://www.wikidata.org/entity/Q1695245>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000029497163/>                                                                                                                                               | <https://twitter.com/univpf>          | etab.21.2 | TRUE     |
| cEt92       | Université de La Réunion                                                                                                     | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 9740478B |         | AUREF       | FALSE      | UFOI                                                         | La Réunion          | NA                                  | NA     | <http://www.univ-reunion.fr/>                  | <https://www.wikidata.org/entity/Q834819>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045785146/>                                                                                                                                               | <https://twitter.com/univ_reunion>    | etab.21.2 | TRUE     |
| U8a0v       | Université de Lille                                                                                                          | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           4 | 0597239Y | ISITE   | ex CURIF    | TRUE       | UDL                                                          | Lille               | NA                                  | NA     | <https://www.univ-lille.fr>                    | <https://www.wikidata.org/entity/Q3551621>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | NA                                    | etab.21.2 | TRUE     |
| nkbwh       | Université de Limoges                                                                                                        | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0870669E |         | AUREF       | TRUE       | Unilim                                                       | Limoges             | NA                                  | NA     | <https://www.unilim.fr/>                       | <https://www.wikidata.org/entity/Q2661290>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045863746/>                                                                                                                                               | <https://twitter.com/unilim>          | etab.21.2 | TRUE     |
| t6Cq5       | Université de Lorraine                                                                                                       | Universités et assimilés | Universités et assimilés                                                                      | Grand établissement                           |           5 | 0542493S | ISITE   | ex CURIF    | TRUE       | université de Lorraine                                       | Nancy-Metz          | NA                                  | TRUE   | <http://www.univ-lorraine.fr/>                 | <https://www.wikidata.org/entity/Q4173330>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/Univ_Lorraine>   | etab.21.2 | TRUE     |
| evv7S       | Université de Montpellier                                                                                                    | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           4 | 0342490X | ISITE   | ex CURIF    | TRUE       | Université de Montpellier                                    | Montpellier         | NA                                  | NA     | <https://www.umontpellier.fr>                  | <https://www.wikidata.org/entity/Q776223>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | NA                                    | etab.21.2 | TRUE     |
| HAU8L       | Université de Nîmes                                                                                                          | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0301687W |         | AUREF       | TRUE       | UNÎMES                                                       | Montpellier         | NA                                  | NA     | <http://www.unimes.fr/>                        | <https://www.wikidata.org/entity/Q2496121>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000039656571/>                                                                                                                                               | <https://twitter.com/unimesfr>        | etab.21.2 | TRUE     |
| 5cZyU       | Université de Paris                                                                                                          | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0755976N | IDEx    | Udice       | TRUE       | UPC                                                          | Paris               | NA                                  | TRUE   | <https://u-paris.fr/>                          | <https://www.wikidata.org/entity/Q55849612>  | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045593456/>                                                                                                                                               | <https://twitter.com/Univ_Paris>      | etab.21.2 | TRUE     |
| Mz286       | Université de Pau et des Pays de l’Adour                                                                                     | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0640251A | ISITE   | AUREF       | TRUE       | UPPA                                                         | Bordeaux            | NA                                  | NA     | <https://www.univ-pau.fr/>                     | <https://www.wikidata.org/entity/Q572968>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000041885628/>                                                                                                                                               | <https://twitter.com/universite_uppa> | etab.21.2 | TRUE     |
| n1W55       | Université de Perpignan Via Domitia                                                                                          | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0660437S |         | AUREF       | TRUE       | UPVD                                                         | Montpellier         | NA                                  | NA     | <https://www.univ-perp.fr/>                    | <https://www.wikidata.org/entity/Q304872>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046004125/>                                                                                                                                               | <https://twitter.com/upvd1>           | etab.21.2 | TRUE     |
| 8j5s2       | Université de Picardie Jules-Verne                                                                                           | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0801344B |         | AUREF       | TRUE       | UPJV                                                         | Amiens              | NA                                  | NA     | <https://www.u-picardie.fr/>                   | <https://www.wikidata.org/entity/Q947747>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/UPJV_Univ>       | etab.21.2 | TRUE     |
| hlX1r       | Université de Poitiers                                                                                                       | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0860856N |         | AUREF       | TRUE       | UnivPoitiers                                                 | Poitiers            | NA                                  | NA     | <https://www.univ-poitiers.fr/>                | <https://www.wikidata.org/entity/Q661056>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045863746/>                                                                                                                                               | <https://twitter.com/UnivPoitiers>    | etab.21.2 | TRUE     |
| 57OsX       | Université de Reims Champagne-Ardenne                                                                                        | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0511296G |         | AUREF       | TRUE       | URCA                                                         | Reims               | NA                                  | NA     | <https://www.univ-reims.fr/>                   | <https://www.wikidata.org/entity/Q2496149>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000042165440/>                                                                                                                                               | <https://twitter.com/universitereims> | etab.21.2 | TRUE     |
| 9wAap       | Université de Rennes 1                                                                                                       | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0350936C |         | ex CURIF    | TRUE       | UR1                                                          | Rennes              | NA                                  | NA     | <https://www.univ-rennes1.fr/>                 | <https://www.wikidata.org/entity/Q726595>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/UnivRennes1>     | etab.21.2 | TRUE     |
| G4572       | Université de Rouen Normandie                                                                                                | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0761904G |         | AUREF       | TRUE       | URN                                                          | Rouen               | NA                                  | NA     | <https://www.univ-rouen.fr/>                   | <https://www.wikidata.org/entity/Q494247>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | NA                                    | etab.21.2 | TRUE     |
| 4k25D       | Université de Strasbourg                                                                                                     | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0673021V | IDEx    | Udice       | TRUE       | Unistra                                                      | Strasbourg          | NA                                  | TRUE   | <http://www.unistra.fr/>                       | <https://www.wikidata.org/entity/Q157575>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/unistra>         | etab.21.2 | TRUE     |
| C701f       | Université de Toulon                                                                                                         | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0830766G |         | AUREF       | TRUE       | Ustv                                                         | Nice                | NA                                  | NA     | <http://www.univ-tln.fr/>                      | <https://www.wikidata.org/entity/Q1816857>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000032101280/>                                                                                                                                               | <https://twitter.com/univtoulon>      | etab.21.2 | TRUE     |
| cqkij       | Université de Tours                                                                                                          | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0370800U |         | AUREF       | TRUE       | université de Tours                                          | Orléans-Tours       | NA                                  | NA     | <https://www.univ-tours.fr/>                   | <https://www.wikidata.org/entity/Q494335>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045785146/>                                                                                                                                               | <https://twitter.com/UnivTours>       | etab.21.2 | TRUE     |
| V13Pk       | Université de Versailles Saint-Quentin-en-Yvelines                                                                           | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0781944P |         |             | TRUE       | UVSQ                                                         | Versailles          | NA                                  | NA     | <http://www.uvsq.fr/>                          | <https://www.wikidata.org/entity/Q186638>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/uvsq>            | etab.21.2 | TRUE     |
| z3hdL       | Université des Antilles                                                                                                      | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 9710585J |         |             | FALSE      | UnivAG                                                       | Guadeloupe          | NA                                  | NA     | <http://www.univ-antilles.fr/>                 | <https://www.wikidata.org/entity/Q16682075>  | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046004125/>                                                                                                                                               | <https://twitter.com/UnivAntilles>    | etab.21.2 | TRUE     |
| yH19Y       | Université du Littoral Côte d’Opale                                                                                          | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0595964M |         | AUREF       | TRUE       | ULCO                                                         | Lille               | NA                                  | NA     | <http://www.univ-littoral.fr/>                 | <https://www.wikidata.org/entity/Q3551755>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044250174/>                                                                                                                                               | <https://twitter.com/ULCO_Univ>       | etab.21.2 | TRUE     |
| Y7ch7       | Université Grenoble Alpes                                                                                                    | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0383546Y | IDEx    | Udice       | TRUE       | UGA                                                          | Grenoble            | NA                                  | NA     | <https://www.univ-grenoble-alpes.fr/>          | <https://www.wikidata.org/entity/Q945876>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/UGrenobleAlpes>  | etab.21.2 | TRUE     |
| 3Z5e6       | Université Gustave Eiffel                                                                                                    | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0772894C | ISITE   |             | FALSE      | UGE                                                          | Créteil             | NA                                  | NA     | <https://www.univ-gustave-eiffel.fr/>          | <https://www.wikidata.org/entity/Q65153823>  | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000042963564/>                                                                                                                                               | <https://twitter.com/UGustaveEiffel>  | etab.21.2 | TRUE     |
| tIJ02       | Université Jean Monnet                                                                                                       | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0421095M |         |             | TRUE       | UJM                                                          | Lyon                | NA                                  | NA     | <https://www.univ-st-etienne.fr/fr/index.html> | <https://www.wikidata.org/entity/Q623154>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/Univ_St_Etienne> | etab.21.2 | TRUE     |
| 7Gzub       | Université Jean Moulin - Lyon 3                                                                                              | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0692437Z |         |             | TRUE       | Lyon 3                                                       | Lyon                | NA                                  | NA     | <http://www.univ-lyon3.fr/>                    | <https://www.wikidata.org/entity/Q4027>      | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000034632305/>                                                                                                                                               | <https://twitter.com/UJML>            | etab.21.2 | TRUE     |
| LsQ24       | Université Le Havre Normandie                                                                                                | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0762762P |         | AUREF       | TRUE       | ULH                                                          | Rouen               | NA                                  | NA     | <https://www.univ-lehavre.fr/>                 | <https://www.wikidata.org/entity/Q1784954>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000030001652/>                                                                                                                                               | NA                                    | etab.21.2 | TRUE     |
| CUBKB       | Université Lumière - Lyon 2                                                                                                  | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0691775E |         | AUREF       | TRUE       | Lyon 2                                                       | Lyon                | NA                                  | NA     | <http://www.univ-lyon2.fr/>                    | <https://www.wikidata.org/entity/Q4041>      | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000034632305/>                                                                                                                                               | <https://twitter.com/univ_lyon2>      | etab.21.2 | TRUE     |
| TWBzp       | Université Panthéon-Assas                                                                                                    | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           4 | 0751718K |         |             | FALSE      | Assas                                                        | Paris               | NA                                  | NA     | <https://www.u-paris2.fr/fr>                   | <https://www.wikidata.org/entity/Q662976>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000042393667/>                                                                                                                                               | <https://twitter.com/AssasParis2>     | etab.21.1 | TRUE     |
| 6G2TU       | Université Paris 1 - Panthéon Sorbonne                                                                                       | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0751717J |         | ex CURIF    | TRUE       | Paris 1                                                      | Paris               | NA                                  | NA     | <http://www.univ-paris1.fr/>                   | <https://www.wikidata.org/entity/Q999763>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046004125/>                                                                                                                                               | <https://twitter.com/SorbonneParis1>  | etab.21.2 | TRUE     |
| Uxr7Z       | Université Paris 8 - Vincennes - Saint-Denis                                                                                 | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0931827F |         | AUREF       | TRUE       | UP8                                                          | Créteil             | NA                                  | NA     | <http://www.univ-paris8.fr/>                   | <https://www.wikidata.org/entity/Q1194988>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000030001844/>                                                                                                                                               | <https://twitter.com/UnivParis8>      | etab.21.2 | TRUE     |
| C6Ps7       | Université Paris Dauphine - PSL                                                                                              | Universités et assimilés | Universités et assimilés                                                                      | Grand établissement                           |           5 | 0750736T |         |             | FALSE      | Paris-Dauphine                                               | Paris               | NA                                  | NA     | <http://www.dauphine.fr/>                      | <https://www.wikidata.org/entity/Q1546437>   | NA                                                                                                                                                                                                           | NA                                    | etab.19   | TRUE     |
| g6rwB       | Université Paris Nanterre                                                                                                    | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0921204J |         | ex CURIF    | TRUE       | Paris X                                                      | Versailles          | NA                                  | NA     | <https://www.parisnanterre.fr/>                | <https://www.wikidata.org/entity/Q1394262>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000031131400/>                                                                                                                                               | <https://twitter.com/uparisnanterre>  | etab.21.2 | TRUE     |
| PpsCQ       | Université Paris sciences et lettres                                                                                         | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0756036D |         |             | FALSE      | PSL                                                          | Paris               | NA                                  | NA     | <https://www.psl.eu/>                          | <https://www.wikidata.org/entity/Q1163431>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046114901/>                                                                                                                                               | <https://twitter.com/psl_univ>        | etab.21.2 | TRUE     |
| vb71K       | Université Paris-Est Créteil                                                                                                 | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0941111X |         |             | TRUE       | UPEC                                                         | Créteil             | NA                                  | NA     | <https://www.u-pec.fr/>                        | <https://www.wikidata.org/entity/Q980688>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046127480/>                                                                                                                                               | <https://twitter.com/UPECactus>       | etab.21.2 | TRUE     |
| G2qA7       | Université Paris-Saclay                                                                                                      | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0912408Y | IDEx    | Udice       | FALSE      | UPSaclay                                                     | Versailles          | NA                                  | NA     | <https://www.universite-paris-saclay.fr/>      | <https://www.wikidata.org/entity/Q109409389> | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/UnivParisSaclay> | etab.21.2 | TRUE     |
| 1I7hJ       | Université Paul-Valéry - Montpellier 3                                                                                       | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0341089Z |         | AUREF       | TRUE       | UPV                                                          | Montpellier         | NA                                  | NA     | <https://www.univ-montp3.fr/>                  | <https://www.wikidata.org/entity/Q2912244>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000039656571/>                                                                                                                                               | <https://twitter.com/univpaulvalery>  | etab.21.2 | TRUE     |
| EW53M       | Université Polytechnique Hauts-de-France                                                                                     | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0597132G |         |             | TRUE       | UPHF                                                         | Lille               | NA                                  | NA     | <https://www.uphf.fr/>                         | <https://www.wikidata.org/entity/Q1548539>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000039700476/>                                                                                                                                               | <https://twitter.com/UphfOfficiel>    | etab.21.2 | TRUE     |
| ti37C       | Université Rennes 2                                                                                                          | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0350937D |         | AUREF       | TRUE       | Rennes 2                                                     | Rennes              | NA                                  | NA     | <http://www.univ-rennes2.fr/>                  | <https://www.wikidata.org/entity/Q459026>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044518469/>                                                                                                                                               | <https://twitter.com/Univ_Rennes2>    | etab.21.2 | TRUE     |
| zCa4j       | Université Savoie Mont Blanc                                                                                                 | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0730858L |         | AUREF       | TRUE       | USMB                                                         | Grenoble            | NA                                  | NA     | <https://www.univ-smb.fr/>                     | <https://www.wikidata.org/entity/Q2496158>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000042637106/>                                                                                                                                               | <https://twitter.com/Univ_Savoie>     | etab.21.2 | TRUE     |
| 8k883       | Université Sorbonne Nouvelle - Paris 3                                                                                       | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0751719L |         |             | TRUE       | Paris 3                                                      | Paris               | NA                                  | NA     | <http://www.univ-paris3.fr/>                   | <https://www.wikidata.org/entity/Q571293>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000034258649/>                                                                                                                                               | <https://twitter.com/SorbonneParis3>  | etab.21.2 | TRUE     |
| cqyN7       | Université Sorbonne Paris Nord                                                                                               | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0931238R |         |             | TRUE       | UP13                                                         | Créteil             | NA                                  | NA     | <http://www.univ-paris13.fr/>                  | <https://www.wikidata.org/entity/Q1780212>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/univ_spn>        | etab.21.2 | TRUE     |
| HqAYu       | Université Toulouse - Jean Jaurès                                                                                            | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0311383K |         | ex CURIF    | TRUE       | UT2                                                          | Toulouse            | NA                                  | NA     | <https://www.univ-tlse2.fr/>                   | <https://www.wikidata.org/entity/Q1933558>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000030717234/>                                                                                                                                               | <https://twitter.com/UTJeanJaures>    | etab.21.2 | TRUE     |
| 542Id       | Université Toulouse Capitole                                                                                                 | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0311382J |         | AUREF       | TRUE       | UT1                                                          | Toulouse            | NA                                  | NA     | <http://www.ut-capitole.fr/>                   | <https://www.wikidata.org/entity/Q590201>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046004125/>                                                                                                                                               | <https://twitter.com/UT1Capitole>     | etab.21.2 | TRUE     |
| m7K6T       | Université Toulouse III - Paul Sabatier                                                                                      | Universités et assimilés | Universités et assimilés                                                                      | Université                                    |           5 | 0311384L |         | ex CURIF    | TRUE       | Université Toulouse III                                      | Toulouse            | NA                                  | NA     | <http://www.univ-tlse3.fr/>                    | <https://www.wikidata.org/entity/Q1273188>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045523189/>                                                                                                                                               | <https://twitter.com/UT3PaulSabatier> | etab.21.2 | TRUE     |
| DmOC1       | Campus Condorcet                                                                                                             | Regroupements            | Regroupements                                                                                 | Pôle de recherche et d’enseignement supérieur |           2 | 0932560C |         |             | TRUE       | Campus Condorcet                                             | Créteil             | NA                                  | NA     | <http://www.campus-condorcet.fr/>              | <https://www.wikidata.org/entity/Q2935605>   | <https://www.legifrance.gouv.fr/affichTexte.do;jsessionid=246872C91C05C701104337EF770924CE.tplgfr37s_1?cidTexte=JORFTEXT000036337899&dateTexte=&oldAction=rechJO&categorieLien=id&idJO=JORFCONT000036334118> | NA                                    | etab.19   | TRUE     |
| EPci7       | HESAM Université                                                                                                             | Regroupements            | Regroupements                                                                                 | Communauté d’universités et établissements    |           2 | 0755581J |         |             | TRUE       | HESAM                                                        | Paris               | NA                                  | NA     | <http://www.hesam.eu/>                         | <https://www.wikidata.org/entity/Q3128622>   | <http://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000031107612>                                                                                                                                 | NA                                    | etab.19   | TRUE     |
| G1r6y       | Normandie Université                                                                                                         | Regroupements            | Regroupements                                                                                 | Communauté d’universités et établissements    |           2 | 0142382N |         |             | TRUE       | Normandie Université                                         | Caen                | NA                                  | NA     | <http://www.normandie-univ.fr/>                | <https://www.wikidata.org/entity/Q3343880>   | <http://legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000030001652&dateTexte=&categorieLien=id>                                                                                                         | NA                                    | etab.19   | TRUE     |
| 6g0Mb       | Paris-Est Sup                                                                                                                | Regroupements            | Regroupements                                                                                 | Communauté d’universités et établissements    |           3 | 0772710C |         |             | TRUE       | UPE                                                          | Créteil             | NA                                  | NA     | <http://www.univ-paris-est.fr/fr/>             | <https://www.wikidata.org/entity/Q3551472>   | <http://legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000030227257&dateTexte=&categorieLien=id>                                                                                                         | NA                                    | etab.19   | TRUE     |
| 8A0mg       | Université Bourgogne - Franche-Comté                                                                                         | Regroupements            | Regroupements                                                                                 | Communauté d’universités et établissements    |           3 | 0251985X |         |             | TRUE       | Comue de Bourgogne Franche-Comté                             | Besançon            | NA                                  | NA     | <http://www.ubfc.fr/>                          | <https://www.wikidata.org/entity/Q3359833>   | <http://legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000030348096&dateTexte=&categorieLien=id>                                                                                                         | NA                                    | etab.19   | TRUE     |
|             | Université Bretagne Loire                                                                                                    | Regroupements            | Regroupements                                                                                 | Communauté d’universités et établissements    |           1 | 0352756F |         |             | TRUE       | UBL                                                          | Rennes              | NA                                  | NA     | <http://u-bretagneloire.fr/>                   | <https://www.wikidata.org/entity/Q21994834>  | <http://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000031794321>                                                                                                                                 | NA                                    | etab.19   | FALSE    |
| XIGGw       | Université Bretagne Loire                                                                                                    | Regroupements            | Regroupements                                                                                 | Communauté d’universités et établissements    |           1 | 0352756F |         |             | TRUE       | UBL                                                          | Rennes              | NA                                  | NA     | <http://u-bretagneloire.fr/>                   | <https://www.wikidata.org/entity/Q21994834>  | <http://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000031794321>                                                                                                                                 | NA                                    | etab.19   | FALSE    |
| 52U59       | Université confédérale Léonard de Vinci                                                                                      | Regroupements            | Regroupements                                                                                 | Communauté d’universités et établissements    |           2 | 0861420B |         |             | TRUE       | université confédérale Léonard-de-Vinci                      | Poitiers            | NA                                  | NA     | <http://www.u-ldevinci.fr/>                    | <https://www.wikidata.org/entity/Q20735682>  | <http://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000030890104>                                                                                                                                 | NA                                    | etab.19   | TRUE     |
| iq0rG       | Université de Lyon                                                                                                           | Regroupements            | Regroupements                                                                                 | Communauté d’universités et établissements    |           2 | 0694094A |         |             | TRUE       | UDL                                                          | Lyon                | NA                                  | NA     | <http://www.universite-lyon.fr/>               | <https://www.wikidata.org/entity/Q10176>     | <http://legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000030199354&dateTexte=&categorieLien=id>                                                                                                         | NA                                    | etab.19   | TRUE     |
| 4a8B2       | Université fédérale de Toulouse Midi-Pyrénées                                                                                | Regroupements            | Regroupements                                                                                 | Communauté d’universités et établissements    |           2 | 0312758E |         |             | TRUE       | université de Toulouse                                       | Toulouse            | NA                                  | NA     | <http://www.univ-toulouse.fr/>                 | <https://www.wikidata.org/entity/Q578023>    | <http://legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000030717234>                                                                                                                                     | NA                                    | etab.19   | TRUE     |
| 86UpY       | Université Paris Lumières                                                                                                    | Regroupements            | Regroupements                                                                                 | Communauté d’universités et établissements    |           3 | 0755698L |         |             | TRUE       | UPL                                                          | Paris               | NA                                  | NA     | <http://www.u-plum.fr/>                        | <https://www.wikidata.org/entity/Q3551474>   | <http://legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000030001844&dateTexte=&categorieLien=id>                                                                                                         | NA                                    | etab.19   | TRUE     |
| jYUcF       | Arts et Métiers Sciences et Technologies                                                                                     | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | Grand établissement                           |           5 | 0753237L |         |             | TRUE       | Arts et Métiers                                              | Paris               | NA                                  | NA     | <https://artsetmetiers.fr/>                    | <https://www.wikidata.org/entity/Q2570220>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045175055/>                                                                                                                                               | <https://twitter.com/ArtsetMetiers_>  | etab.21.2 | TRUE     |
| S88MV       | Bordeaux INP                                                                                                                 | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | Grand établissement                           |           5 | 0333232J |         |             | TRUE       | IPB                                                          | Bordeaux            | NA                                  | NA     | <https://www.ipb.fr/>                          | <https://www.wikidata.org/entity/Q3152470>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000041885628/>                                                                                                                                               | <https://twitter.com/BordeauxINP>     | etab.21.2 | TRUE     |
| 54VTe       | Centrale Lille Institut                                                                                                      | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0597139P |         |             | TRUE       | CLI                                                          | Lille               | NA                                  | NA     | <https://centralelille.fr/>                    | <https://www.wikidata.org/entity/Q273461>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/Centralelille>   | etab.21.2 | TRUE     |
| fWJJA       | Centrale Lyon                                                                                                                | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0690187D |         |             | TRUE       | EC Lyon                                                      | Lyon                | NA                                  | NA     | <https://www.ec-lyon.fr/>                      | <https://www.wikidata.org/entity/Q10177>     | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/CentraleLyon>    | etab.21.2 | TRUE     |
| 1tI7C       | Centrale Marseille                                                                                                           | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0133774G |         |             | TRUE       | ECM                                                          | Aix-Marseille       | NA                                  | NA     | <https://www.centrale-marseille.fr/>           | <https://www.wikidata.org/entity/Q273454>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000033158822/>                                                                                                                                               | <https://twitter.com/CentraleMars>    | etab.21.2 | TRUE     |
| gCAyK       | Centrale Nantes                                                                                                              | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0440100V |         |             | TRUE       | Centrale nantes                                              | Nantes              | NA                                  | NA     | <http://www.ec-nantes.fr/>                     | <https://www.wikidata.org/entity/Q273458>    | <http://www.legifrance.gouv.fr/affichTexte.do?dateTexte=&categorieLien=id&cidTexte=JORFTEXT000000517472&fastPos=1&fastReqId=701362281&oldAction=rechExpTexteJorf>                                            | <https://twitter.com/CentraleNantes>  | etab.20   | TRUE     |
| m84Aa       | CentraleSupélec                                                                                                              | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | Grand établissement                           |           5 | 0912341A |         |             | TRUE       | CentraleSupelec                                              | Versailles          | NA                                  | NA     | <http://www.centralesupelec.fr/>               | <https://www.wikidata.org/entity/Q19203245>  | <http://legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000030001939&dateTexte=&categorieLien=id>                                                                                                         | NA                                    | etab.19   | TRUE     |
| uhDO3       | Chimie ParisTech-PSL                                                                                                         | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           |                                               |           5 | 0753375L |         |             | TRUE       | ENS Chimie de Paris                                          | Paris               | Sorbonne Université                 | NA     | <https://www.chimie-paristech.fr/>             | <https://www.wikidata.org/entity/Q2963665>   | NA                                                                                                                                                                                                           | NA                                    | etab.19   | TRUE     |
| S8ntZ       | Clermont Auvergne INP                                                                                                        | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0632086A |         |             | TRUE       | Clermont Auvergne INP                                        | NA                  | NA                                  | NA     | NA                                             | NA                                           | NA                                                                                                                                                                                                           | NA                                    | NA        | TRUE     |
| XR16q       | Conservatoire national des arts et métiers                                                                                   | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | Grand établissement                           |           4 | 0753471R |         |             | TRUE       | CNAM                                                         | Paris               | NA                                  | NA     | <http://www.cnam.fr/>                          | <https://www.wikidata.org/entity/Q524289>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045382365/>                                                                                                                                               | <https://twitter.com/LeCnam>          | etab.21.2 | TRUE     |
| dPmxa       | École nationale d’ingénieurs de Brest                                                                                        | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0290119X |         |             | TRUE       | ENIB                                                         | Rennes              | NA                                  | NA     | <http://www.enib.fr/>                          | <https://www.wikidata.org/entity/Q273564>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/ENIB_INFO>       | etab.21.2 | TRUE     |
| MHneW       | École nationale d’ingénieurs de Tarbes                                                                                       | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0650048Z |         |             | TRUE       | ENI Tarbes                                                   | Toulouse            | NA                                  | NA     | <http://www.enit.fr/>                          | <https://www.wikidata.org/entity/Q3578096>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000039700476/>                                                                                                                                               | <https://twitter.com/ENITarbes>       | etab.21.2 | TRUE     |
| WjVHD       | École nationale supérieure d’informatique pour l’industrie et l’entreprise                                                   | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0912266U |         |             | TRUE       | ENSIIE                                                       | Versailles          | NA                                  | NA     | <https://www.ensiie.fr/>                       | <https://www.wikidata.org/entity/Q3578204>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000039700476/>                                                                                                                                               | <https://twitter.com/ensiie>          | etab.21.2 | TRUE     |
| I4SPK       | École nationale supérieure d’ingénieurs de Caen                                                                              | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0141720U |         |             | TRUE       | ENSI Caen                                                    | Caen                | NA                                  | NA     | <http://www.ensicaen.fr/>                      | <https://www.wikidata.org/entity/Q3578208>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000034010781/>                                                                                                                                               | <https://twitter.com/ENSICAEN>        | etab.21.2 | TRUE     |
| GJYxj       | École nationale supérieure de chimie de Montpellier                                                                          | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0340112M |         |             | TRUE       | ENS Chimie Montpellier                                       | Montpellier         | Université de Montpellier           | NA     | <http://www.enscm.fr/>                         | <https://www.wikidata.org/entity/Q948420>    | NA                                                                                                                                                                                                           | <https://twitter.com/enscmchimiemtp>  | etab.20   | TRUE     |
| kFcnq       | École nationale supérieure de chimie de Rennes                                                                               | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0350077U |         |             | TRUE       | ENSCR                                                        | Rennes              | NA                                  | NA     | <http://www.ensc-rennes.fr/>                   | <https://www.wikidata.org/entity/Q3578223>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/ENSCR>           | etab.21.2 | TRUE     |
| tdEpy       | École nationale supérieure de l’électronique et de ses applications de Cergy                                                 | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0951376E |         |             | TRUE       | ENSEA                                                        | Versailles          | NA                                  | NA     | <https://www.ensea.fr/fr>                      | <https://www.wikidata.org/entity/Q2707341>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000042580485/>                                                                                                                                               | <https://twitter.com/ensea1>          | etab.21.2 | TRUE     |
| IlIW8       | École nationale supérieure de mécanique et d’aérotechnique de Poitiers                                                       | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0860073M |         |             | TRUE       | ISAE-ENSMA                                                   | Poitiers            | NA                                  | NA     | <https://www.ensma.fr/>                        | <https://www.wikidata.org/entity/Q391044>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045863746/>                                                                                                                                               | <https://twitter.com/isae_ensma>      | etab.21.2 | TRUE     |
| cWx2t       | École nationale supérieure de mécanique et des microtechniques                                                               | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0250082D |         |             | TRUE       | ENS2M                                                        | Besançon            | NA                                  | NA     | <https://www.ens2m.fr/>                        | <https://www.wikidata.org/entity/Q3578235>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/ENSMMOfficiel>   | etab.21.2 | TRUE     |
| J3Mu2       | INSA Hauts-de-France                                                                                                         | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | Institut ou école extérieur aux universités   |           1 | 0597131F |         |             | TRUE       | INSA Hauts-de-France                                         | Lille               | NA                                  | NA     | NA                                             | NA                                           | NA                                                                                                                                                                                                           | NA                                    | etab.19   | FALSE    |
| QYw7j       | Institut national des sciences appliquées Centre Val de Loire                                                                | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0180974L |         |             | TRUE       | INSA CVL                                                     | Orléans-Tours       | NA                                  | NA     | <http://www.insa-centrevaldeloire.fr/>         | <https://www.wikidata.org/entity/Q15651478>  | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/insacvl>         | etab.21.2 | TRUE     |
| 8k41p       | Institut national des sciences appliquées de Lyon                                                                            | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0690192J |         |             | TRUE       | INSA Lyon                                                    | Lyon                | NA                                  | NA     | <http://www.insa-lyon.fr/>                     | <https://www.wikidata.org/entity/Q1633859>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/insadelyon>      | etab.21.2 | TRUE     |
| 3GxJ8       | Institut national des sciences appliquées de Rennes                                                                          | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0350097R |         |             | TRUE       | INSA Rennes                                                  | Rennes              | NA                                  | NA     | <https://www.insa-rennes.fr/>                  | <https://www.wikidata.org/entity/Q1934614>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/INSA_Rennes>     | etab.21.2 | TRUE     |
| TeXD3       | Institut national des sciences appliquées de Rouen Normandie                                                                 | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0760165S |         |             | TRUE       | INSA Rouen Normandie                                         | Rouen               | NA                                  | NA     | <https://www.insa-rouen.fr/>                   | <https://www.wikidata.org/entity/Q1665112>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000030001652/>                                                                                                                                               | <https://twitter.com/insarouen>       | etab.21.2 | TRUE     |
| ab5z5       | Institut national des sciences appliquées de Strasbourg                                                                      | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0670190T |         |             | TRUE       | INSA Strasbourg                                              | Strasbourg          | NA                                  | NA     | <https://www.insa-strasbourg.fr/fr/>           | <https://www.wikidata.org/entity/Q521036>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/Insa_Strasbourg> | etab.21.2 | TRUE     |
| dj88d       | Institut national des sciences appliquées de Toulouse                                                                        | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0310152X |         |             | TRUE       | INSA Toulouse                                                | Toulouse            | NA                                  | NA     | <http://www.insa-toulouse.fr/>                 | <https://www.wikidata.org/entity/Q858979>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000030717234/>                                                                                                                                               | <https://twitter.com/INSAToulouse>    | etab.21.2 | TRUE     |
| 2ALYK       | Institut polytechnique de Grenoble                                                                                           | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | Grand établissement                           |           5 | 0381912X |         |             | TRUE       | INPG                                                         | Grenoble            | NA                                  | NA     | <http://www.grenoble-inp.fr/>                  | <https://www.wikidata.org/entity/Q1665121>   | NA                                                                                                                                                                                                           | NA                                    | etab.19   | TRUE     |
| OYA17       | ISAE-Supméca                                                                                                                 | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0930603A |         |             | TRUE       | supméca                                                      | Créteil             | NA                                  | NA     | <http://www.supmeca.fr/>                       | <https://www.wikidata.org/entity/Q1267711>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000042580485/>                                                                                                                                               | <https://twitter.com/supmeca>         | etab.21.2 | TRUE     |
| mMex4       | Toulouse INP                                                                                                                 | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0311381H |         |             | TRUE       | INPT                                                         | Toulouse            | NA                                  | NA     | <https://www.inp-toulouse.fr/>                 | <https://www.wikidata.org/entity/Q3152453>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000032752890/>                                                                                                                                               | <https://twitter.com/INP_Toulouse>    | etab.21.2 | TRUE     |
| PVnB4       | Université de technologie de Belfort-Montbéliard                                                                             | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0900424X |         |             | TRUE       | UTBM                                                         | Besançon            | NA                                  | NA     | <http://www.utbm.fr/>                          | <https://www.wikidata.org/entity/Q2399264>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/utbm_fr>         | etab.21.2 | TRUE     |
| H3nOd       | Université de technologie de Compiègne                                                                                       | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0601223D |         |             | TRUE       | UTC                                                          | Amiens              | NA                                  | NA     | <https://www.utc.fr/>                          | <https://www.wikidata.org/entity/Q622906>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/utc_compiegne>   | etab.21.2 | TRUE     |
| 8tVLr       | Université de technologie de Troyes                                                                                          | Ecoles d’ingénieurs      | Ecoles d’ingénieurs                                                                           | École                                         |           5 | 0101060Y |         |             | TRUE       | UTT                                                          | Reims               | NA                                  | NA     | <https://www.utt.fr/>                          | <https://www.wikidata.org/entity/Q1037208>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045100322/>                                                                                                                                               | <https://twitter.com/UTTroyes>        | etab.21.2 | TRUE     |
| vQ6Hh       | Académie des sciences d’outre-mer                                                                                            | Autres établissements    | Autres                                                                                        | Autre établissement                           |           1 | 0752744A |         |             | TRUE       | Académie des sciences d’outre-mer                            | NA                  | NA                                  | NA     | NA                                             | NA                                           | NA                                                                                                                                                                                                           | NA                                    | NA        | FALSE    |
| J8X6q       | Agence bibliographique de l’enseignement supérieur                                                                           | Autres établissements    | Autres                                                                                        | Autre établissement                           |           2 | 0341920C |         |             | TRUE       | Agence bibliographique de l’enseignement supérieur           | NA                  | NA                                  | NA     | NA                                             | NA                                           | NA                                                                                                                                                                                                           | NA                                    | NA        | FALSE    |
| VfvdY       | Bibliothèque nationale et universitaire de Strasbourg                                                                        | Autres établissements    | Autres                                                                                        | Autre établissement                           |           2 | 0671451N |         |             | TRUE       | BNU                                                          | NA                  | NA                                  | NA     | NA                                             | <https://www.wikidata.org/entity/Q630461>    | NA                                                                                                                                                                                                           | NA                                    | NA        | FALSE    |
| 1bXaK       | Bibliothèque universitaire des langues et civilisations                                                                      | Autres établissements    | Autres                                                                                        | Autre établissement                           |           1 | 0755040W |         |             | TRUE       | Bibliothèque universitaire des langues et civilisations      | NA                  | NA                                  | NA     | NA                                             | NA                                           | NA                                                                                                                                                                                                           | NA                                    | NA        | FALSE    |
| QuDx7       | Centre informatique national de l’enseignement supérieur                                                                     | Autres établissements    | Autres                                                                                        | Autre établissement                           |           2 | 0342032Z |         |             | TRUE       | Centre informatique national de l’enseignement supérieur     | NA                  | NA                                  | NA     | NA                                             | NA                                           | NA                                                                                                                                                                                                           | NA                                    | NA        | FALSE    |
| fV2g5       | Centre technique du livre de l’enseignement supérieur                                                                        | Autres établissements    | Autres                                                                                        | Autre établissement                           |           2 | 0772428W |         |             | TRUE       | Centre technique du livre de l’enseignement supérieur        | NA                  | NA                                  | NA     | NA                                             | NA                                           | NA                                                                                                                                                                                                           | NA                                    | NA        | FALSE    |
| 8JlNN       | Observatoire de la Côte d’Azur                                                                                               | Autres établissements    | Autres                                                                                        | Autre établissement                           |           4 | 0060099A |         |             | TRUE       | OCA                                                          | Nice                | Université Nice - Sophia-Antipolis  | NA     | <https://www.oca.eu/>                          | <https://www.wikidata.org/entity/Q2991466>   | NA                                                                                                                                                                                                           | NA                                    | etab.19   | TRUE     |
| T6qPJ       | École nationale supérieure des arts et industries textiles                                                                   | Autres établissements    | Ecoles d’art et de design                                                                     | École                                         |           5 | 0590338X |         |             | TRUE       | ENSAIT                                                       | Lille               | NA                                  | NA     | <http://www.ensait.fr/>                        | <https://www.wikidata.org/entity/Q273582>    | <http://www.legifrance.gouv.fr/affichTexte.do?dateTexte=&categorieLien=id&cidTexte=JORFTEXT000000246728&fastPos=1&fastReqId=421881616&oldAction=rechExpTexteJorf>                                            | <https://twitter.com/ENSAITinfo>      | etab.20   | TRUE     |
| wp55m       | IAE Paris - Sorbonne Business School                                                                                         | Autres établissements    | Ecoles de commerce                                                                            | École                                         |           5 | 0753364Z |         |             | TRUE       | IAE Paris                                                    | Paris               | NA                                  | NA     | <http://www.iae-paris.com/>                    | <https://www.wikidata.org/entity/Q3151899>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045410971/>                                                                                                                                               | <https://twitter.com/iaeparis>        | etab.21.2 | TRUE     |
| zHvr4       | École nationale supérieure des arts et techniques du théâtre                                                                 | Autres établissements    | Ecoles des arts du spectacle                                                                  | École                                         |           5 | 0693735K |         |             | TRUE       | ENSATT                                                       | Lyon                | NA                                  | NA     | <http://www.ensatt.fr/>                        | <https://www.wikidata.org/entity/Q3578242>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000039700476/>                                                                                                                                               | <https://twitter.com/Ensatt>          | etab.21.2 | TRUE     |
| 13fXQ       | École nationale supérieure Louis Lumière                                                                                     | Autres établissements    | Ecoles des arts du spectacle                                                                  | École                                         |           5 | 0932066R |         |             | TRUE       | ENSLL                                                        | Créteil             | NA                                  | NA     | <http://www.ens-louis-lumiere.fr/>             | <https://www.wikidata.org/entity/Q273466>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046107963/>                                                                                                                                               | <https://twitter.com/ENSLouisLumiere> | etab.21.2 | TRUE     |
| 6a498       | Casa de Velázquez de Madrid                                                                                                  | Autres établissements    | Ecoles françaises à l’étranger                                                                | Autre établissement                           |           3 | 1340004B |         |             | TRUE       | Casa Velasquez                                               | NA                  | NA                                  | NA     | <http://www.casadevelazquez.org/>              | <https://www.wikidata.org/entity/Q2470271>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044447707/>                                                                                                                                               | <https://twitter.com/casadevelazquez> | etab.21.2 | FALSE    |
| td273       | École française d’Athènes                                                                                                    | Autres établissements    | Ecoles françaises à l’étranger                                                                | Autre établissement                           |           3 | 1260001S |         |             | TRUE       | EFA                                                          | NA                  | NA                                  | NA     | <http://www.efa.gr/>                           | <https://www.wikidata.org/entity/Q273548>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000029626861/>                                                                                                                                               | NA                                    | etab.21.2 | FALSE    |
| TSGYA       | École française d’Extrême-Orient                                                                                             | Autres établissements    | Ecoles françaises à l’étranger                                                                | Autre établissement                           |           4 | 0751794T |         |             | TRUE       | EFEO                                                         | Paris               | NA                                  | NA     | <https://www.efeo.fr/>                         | <https://www.wikidata.org/entity/Q273559>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045352241/>                                                                                                                                               | <https://twitter.com/EFEO_Paris>      | etab.21.2 | TRUE     |
| BOl78       | École française de Rome                                                                                                      | Autres établissements    | Ecoles françaises à l’étranger                                                                | Autre établissement                           |           2 | 1270009V |         |             | TRUE       | EFR                                                          | NA                  | NA                                  | NA     | <http://www.efrome.it/>                        | <https://www.wikidata.org/entity/Q273542>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000029626861/>                                                                                                                                               | <https://twitter.com/ef_rome>         | etab.21.2 | FALSE    |
| 5eUBS       | Institut français d’archéologie orientale du Caire                                                                           | Autres établissements    | Ecoles françaises à l’étranger                                                                | Autre établissement                           |           2 | 3010001R |         |             | TRUE       | IFAO                                                         | NA                  | NA                                  | NA     | <https://www.ifao.egnet.net/>                  | <https://www.wikidata.org/entity/Q1472454>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000029626861/>                                                                                                                                               | <https://twitter.com/ifaocaire>       | etab.21.2 | FALSE    |
| kWved       | École normale supérieure de Lyon                                                                                             | Autres établissements    | Ecoles normales supérieures                                                                   | École                                         |           5 | 0694123G |         |             | TRUE       | ENS de Lyon                                                  | Lyon                | NA                                  | NA     | <http://www.ens-lyon.eu/>                      | <https://www.wikidata.org/entity/Q10159>     | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046115381/>                                                                                                                                               | <https://twitter.com/ENSdeLyon>       | etab.21.2 | TRUE     |
| j5bS4       | École normale supérieure de Rennes                                                                                           | Autres établissements    | Ecoles normales supérieures                                                                   | École                                         |           5 | 0352440M |         |             | TRUE       | ENS Rennes                                                   | Rennes              | NA                                  | NA     | <http://www.ens-rennes.fr/>                    | <https://www.wikidata.org/entity/Q2852691>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046014387/>                                                                                                                                               | <https://twitter.com/ENSRennes>       | etab.21.2 | TRUE     |
| 6kk6n       | École normale supérieure Paris-Saclay                                                                                        | Autres établissements    | Ecoles normales supérieures                                                                   | École                                         |           5 | 0912423P |         |             | TRUE       | ENS Cachan                                                   | NA                  | NA                                  | NA     | NA                                             | <https://www.wikidata.org/entity/Q273604>    | NA                                                                                                                                                                                                           | NA                                    | NA        | TRUE     |
| 8618D       | École normale supérieure PSL                                                                                                 | Autres établissements    | Ecoles normales supérieures                                                                   | École normale supérieure                      |           5 | 0753455Y |         |             | TRUE       | ENS ULM                                                      | Paris               | NA                                  | NA     | <http://www.ens.fr/>                           | <https://www.wikidata.org/entity/Q83259>     | NA                                                                                                                                                                                                           | NA                                    | etab.19   | TRUE     |
| u79ZJ       | Sciences Po                                                                                                                  | Autres établissements    | Instituts d’études politiques                                                                 | Grand établissement                           |           4 | 0753431X |         |             | TRUE       | IEP de Paris                                                 | Paris               | NA                                  | NA     | <https://www.sciencespo.fr/>                   | <https://www.wikidata.org/entity/Q859363>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044345627/>                                                                                                                                               | <https://twitter.com/sciencespo>      | etab.21.2 | TRUE     |
| G8QBG       | Sciences Po Aix                                                                                                              | Autres établissements    | Instituts d’études politiques                                                                 | Autre établissement                           |           5 | 0130221V |         |             | TRUE       | IEP d’Aix-en-Provence                                        | Aix-Marseille       | NA                                  | NA     | <http://www.sciencespo-aix.fr/>                | <https://www.wikidata.org/entity/Q1139065>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000041924076/>                                                                                                                                               | <https://twitter.com/Sciences_Po_Aix> | etab.21.2 | TRUE     |
| DOunC       | Sciences Po Bordeaux                                                                                                         | Autres établissements    | Instituts d’études politiques                                                                 | Autre établissement                           |           5 | 0330192E |         |             | TRUE       | IEP Bordeaux                                                 | Bordeaux            | NA                                  | NA     | <https://www.sciencespobordeaux.fr/>           | <https://www.wikidata.org/entity/Q1252062>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000043936590/>                                                                                                                                               | <https://twitter.com/ScPoBx>          | etab.21.2 | TRUE     |
| 851ij       | Sciences Po Grenoble                                                                                                         | Autres établissements    | Instituts d’études politiques                                                                 | Institut d’étude politique                    |           5 | 0380134P |         |             | TRUE       | IEP de Grenoble                                              | Grenoble            | Université Pierre Mendès France     | NA     | <http://www.sciencespo-grenoble.fr/>           | <https://www.wikidata.org/entity/Q3151959>   | NA                                                                                                                                                                                                           | NA                                    | etab.19   | TRUE     |
| F77ic       | Sciences Po Lille                                                                                                            | Autres établissements    | Instituts d’études politiques                                                                 | Autre établissement                           |           5 | 0595876S |         |             | TRUE       | IEP de Lille                                                 | Lille               | Université Lille 2 - Droit et Santé | NA     | <http://iep.univ-lille2.fr/>                   | <https://www.wikidata.org/entity/Q3151958>   | NA                                                                                                                                                                                                           | <https://twitter.com/ScPoLille>       | etab.20   | TRUE     |
| hfCvd       | Sciences Po Lyon                                                                                                             | Autres établissements    | Instituts d’études politiques                                                                 | Autre établissement                           |           5 | 0690173N |         |             | TRUE       | IEP de Lyon                                                  | Lyon                | NA                                  | NA     | <https://www.sciencespo-lyon.fr/>              | <https://www.wikidata.org/entity/Q2253344>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000039700476/>                                                                                                                                               | <https://twitter.com/scpolyon>        | etab.21.2 | TRUE     |
| JaqkX       | Sciences Po Rennes                                                                                                           | Autres établissements    | Instituts d’études politiques                                                                 | Autre établissement                           |           5 | 0352317D |         |             | TRUE       | IEP de Rennes                                                | Rennes              | NA                                  | NA     | <http://www.sciencespo-rennes.fr/>             | <https://www.wikidata.org/entity/Q3151965>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046004125/>                                                                                                                                               | <https://twitter.com/Sc_Po_Rennes>    | etab.21.2 | TRUE     |
| dQaK0       | Sciences Po Toulouse                                                                                                         | Autres établissements    | Instituts d’études politiques                                                                 | Autre établissement                           |           5 | 0310133B |         |             | TRUE       | IEP de Toulouse                                              | Toulouse            | NA                                  | NA     | <http://www.sciencespo-toulouse.fr/>           | <https://www.wikidata.org/entity/Q1664755>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000043936588/>                                                                                                                                               | <https://twitter.com/SciencesPo_Tlse> | etab.21.2 | TRUE     |
| 0Mvk5       | Collège de France                                                                                                            | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | Grand établissement                           |           4 | 0753480A |         |             | TRUE       | Collège de France                                            | Paris               | NA                                  | NA     | <https://www.college-de-france.fr/>            | <https://www.wikidata.org/entity/Q202660>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000039700158/>                                                                                                                                               | <https://twitter.com/cdf1530>         | etab.21.2 | TRUE     |
| SsRkf       | École des hautes études en santé publique                                                                                    | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | Grand établissement                           |           5 | 0350095N |         |             | TRUE       | EHESP                                                        | Rennes              | NA                                  | NA     | <https://www.ehesp.fr/>                        | <https://www.wikidata.org/entity/Q1587855>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046201684/>                                                                                                                                               | <https://twitter.com/EHESP>           | etab.21.2 | TRUE     |
| y52D7       | École des hautes études en sciences sociales                                                                                 | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | Grand établissement                           |           5 | 0753742K |         |             | TRUE       | EHESS                                                        | Paris               | NA                                  | NA     | <https://www.ehess.fr/fr>                      | <https://www.wikidata.org/entity/Q273518>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000039700158/>                                                                                                                                               | <https://twitter.com/EHESS_fr>        | etab.21.2 | TRUE     |
| wAASR       | École nationale des Chartes                                                                                                  | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | Grand établissement                           |           5 | 0753478Y |         |             | TRUE       | ENC                                                          | Paris               | NA                                  | NA     | <http://www.enc-sorbonne.fr/>                  | <https://www.wikidata.org/entity/Q273570>    | NA                                                                                                                                                                                                           | NA                                    | etab.19   | TRUE     |
| 59da6       | École nationale supérieure des sciences de l’information et des bibliothèques                                                | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | Grand établissement                           |           5 | 0692459Y |         |             | TRUE       | ENSSIB                                                       | Lyon                | NA                                  | NA     | <https://www.enssib.fr/>                       | <https://www.wikidata.org/entity/Q2791269>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045159906/>                                                                                                                                               | <https://twitter.com/enssib>          | etab.21.2 | TRUE     |
| QXnpG       | École pratique des hautes études                                                                                             | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | Grand établissement                           |           5 | 0753486G |         |             | TRUE       | EPHE                                                         | Paris               | NA                                  | NA     | <http://www.ephe.fr/>                          | <https://www.wikidata.org/entity/Q273631>    | <https://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000032490129&dateTexte=&categorieLien=id>                                                                                                    | NA                                    | etab.19   | TRUE     |
| RdQr7       | Institut de physique du globe                                                                                                | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | Grand établissement                           |           5 | 0753428U |         |             | TRUE       | IPG                                                          | Paris               | NA                                  | NA     | <http://www.ipgp.fr/>                          | <https://www.wikidata.org/entity/Q3152060>   | NA                                                                                                                                                                                                           | NA                                    | etab.19   | TRUE     |
| FDijq       | Institut national d’histoire de l’art                                                                                        | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | Grand établissement                           |           3 | 0755026F |         |             | TRUE       | INHA                                                         | Paris               | NA                                  | NA     | <https://www.inha.fr/fr/>                      | <https://www.wikidata.org/entity/Q3152376>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000046070770/>                                                                                                                                               | <https://twitter.com/INHA_Fr>         | etab.21.2 | FALSE    |
| Dk1Th       | Institut national des langues et civilisations orientales                                                                    | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | Grand établissement                           |           5 | 0753488J |         |             | FALSE      | INALCO                                                       | Paris               | NA                                  | NA     | <http://www.inalco.fr/>                        | <https://www.wikidata.org/entity/Q1430113>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000042876998/>                                                                                                                                               | <https://twitter.com/Inalco>          | etab.21.2 | TRUE     |
| a2a9U       | Institut national supérieur de formation et de recherche pour l’éducation des jeunes handicapés et les enseignements adaptés | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | École                                         |           5 | 0922605G |         |             | TRUE       | INS HEA                                                      | Versailles          | NA                                  | NA     | <http://www.inshea.fr/>                        | <https://www.wikidata.org/entity/Q3152454>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000039700476/>                                                                                                                                               | <https://twitter.com/ins_hea>         | etab.21.2 | TRUE     |
| Hm42K       | Institut national universitaire Jean-François Champollion                                                                    | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | Autre établissement                           |           5 | 0811293R |         |             | FALSE      | INUC                                                         | Toulouse            | NA                                  | NA     | <https://www.univ-jfc.fr/>                     | <https://www.wikidata.org/entity/Q929515>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000036109496/>                                                                                                                                               | <https://twitter.com/UnivChampollion> | etab.21.2 | TRUE     |
| Z2FY5;zepT6 | Institut universitaire de formation des maîtres du Pacifique                                                                 | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | École                                         |           1 | 9830491S |         |             | TRUE       | Institut universitaire de formation des maîtres du Pacifique | NA                  | NA                                  | NA     | NA                                             | NA                                           | NA                                                                                                                                                                                                           | NA                                    | NA        | FALSE    |
| VaJ52       | Muséum national d’histoire naturelle                                                                                         | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | Grand établissement                           |           5 | 0753494R |         |             | TRUE       | MNHN                                                         | Paris               | NA                                  | NA     | <http://www.mnhn.fr/fr>                        | <https://www.wikidata.org/entity/Q838691>    | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045772257/>                                                                                                                                               | <https://twitter.com/Le_Museum>       | etab.21.2 | TRUE     |
| tr5VV       | Observatoire de Paris                                                                                                        | Autres établissements    | Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d’ingénieurs) | Grand établissement                           |           5 | 0753496T |         |             | TRUE       | Observatoire de Paris - PSL                                  | Paris               | NA                                  | NA     | <http://www.obspm.fr/>                         | <https://www.wikidata.org/entity/Q461340>    | NA                                                                                                                                                                                                           | NA                                    | etab.19   | TRUE     |

</details>
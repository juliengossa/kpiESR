MAJ Appariements
================
2024-09-06

## Chargement des données

### Sauvegarde SIREN SIRET

### Statistiques

| dataset   | nb_etabs |
|:----------|---------:|
| etab.19   |       75 |
| etab.20   |       14 |
| etab.21.2 |        7 |
| etab.22   |       10 |
| etab.23   |       33 |
| etab.24   |      232 |

## Fix Typologie manquante

## Chargement des données data

    ## Joining with `by = join_by(pid, UAI)`
    ## Joining with `by = join_by(pid, UAI)`
    ## Joining with `by = join_by(pid, UAI)`
    ## Joining with `by = join_by(pid, UAI)`
    ## Joining with `by = join_by(pid)`

    ## Warning in full_join(., imo %>% rename(imo = etab)): Detected an unexpected many-to-many relationship between `x` and `y`.
    ## ℹ Row 2 of `x` matches multiple rows in `y`.
    ## ℹ Row 104 of `y` matches multiple rows in `x`.
    ## ℹ If a many-to-many relationship is expected, set `relationship =
    ##   "many-to-many"` to silence this warning.

    ## `summarise()` has grouped output by 'pid'. You can override using the `.groups`
    ## argument.

### Détection des pids manquants

<details>
<summary>
Voir les données
</summary>

| pid | UAI      | enstit | ensnp | bia | etu                               | fin | imo |
|:----|:---------|:-------|:------|:----|:----------------------------------|:----|:----|
|     | 0352756F | NA     | NA    | NA  | Université européenne de Bretagne | NA  | NA  |
|     | 0352756F | NA     | NA    | NA  | Université Bretagne Loire         | NA  | NA  |

</details>

### Détection des doubles pid

<details>
<summary>
Voir les données
</summary>

| pid               | UAI      | enstit | ensnp | bia | etu                                                          | fin | imo                                                                                                                                                                                   |
|:------------------|:---------|:-------|:------|:----|:-------------------------------------------------------------|:----|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| z3hdL;hy4EW       | 9710585J |        |       | NA  | Université des Antilles et de la Guyane                      | NA  | NA                                                                                                                                                                                    |
| Z2FY5;zepT6       | 9830491S | NA     | NA    | NA  | Institut universitaire de formation des maîtres du Pacifique | NA  | NA                                                                                                                                                                                    |
| jYUcF,IXHyv       | NA       | NA     | NA    | NA  | NA                                                           | NA  | ENSAM - École nationale supérieure d’arts et métiers,Université d’Angers                                                                                                              |
| G4572,TeXD3,u79ZJ | NA       | NA     | NA    | NA  | NA                                                           | NA  | Université de Rouen Normandie,INSA-Rouen - Institut national des sciences appliquées de Rouen,IEP-Paris - Institut d’études politiques de Paris,PARTIES COMMUNES PARTENAIRE GÉNÉRIQUE |
| I4SPK,p25Q3       | NA       | NA     | NA    | NA  | NA                                                           | NA  | École nationale supérieure d’ingénieurs de Caen,Université de Caen Normandie                                                                                                          |
| m7K6T,mMex4       | NA       | NA     | NA    | NA  | NA                                                           | NA  | Toulouse-III “Université Paul Sabatier”,INPT - Institut national polytechnique Toulouse,PARTIES COMMUNES PARTENAIRE GÉNÉRIQUE                                                         |

</details>

### Détection des doubles UAI

<details>
<summary>
Voir les données
</summary>

| pid   | UAI               | enstit                                                        | ensnp                                                         | bia                                                           | etu | fin | imo                                                                                                                                   |
|:------|:------------------|:--------------------------------------------------------------|:--------------------------------------------------------------|:--------------------------------------------------------------|:----|:----|:--------------------------------------------------------------------------------------------------------------------------------------|
| 54VTe | 0597139P;0590349J | Centrale Lille Institut                                       | Centrale Lille Institut                                       | Centrale Lille Institut                                       | NA  | NA  | Centrale Lille Institut                                                                                                               |
| 6kk6n | 0912423P;0940607Z | École normale supérieure Paris-Saclay                         | École normale supérieure Paris-Saclay                         | École normale supérieure Paris-Saclay                         | NA  | NA  | ENS Paris-Saclay                                                                                                                      |
| 3Z5e6 | 0772502B;0932056E | Université Gustave Eiffel                                     | Université Gustave Eiffel                                     | Université Gustave Eiffel                                     | NA  | NA  | UGE - Université Gustave Eiffel                                                                                                       |
| 3Z5e6 | 0772502B;0932056E | Université Gustave Eiffel                                     | Université Gustave Eiffel                                     | Université Gustave Eiffel                                     | NA  | NA  | UGE - Université Gustave Eiffel,Centre d’études et d’expertise sur les risques,l’environnement,la mobilité et l’aménagement (CEREMA)  |
| QYw7j | 0180974L;0411068N | Institut national des sciences appliquées Centre Val de Loire | Institut national des sciences appliquées Centre Val de Loire | Institut national des sciences appliquées Centre Val de Loire | NA  | NA  | INERIS - INST NAT DE L’ENVIRONNEMENT INDUS ET DES RISQUES,INSA-CVL - Institut national des sciences appliquées du Centre Val de Loire |
| QYw7j | 0180974L;0411068N | Institut national des sciences appliquées Centre Val de Loire | Institut national des sciences appliquées Centre Val de Loire | Institut national des sciences appliquées Centre Val de Loire | NA  | NA  | INSA-CVL - Institut national des sciences appliquées du Centre Val de Loire                                                           |

</details>

### Détection des UAI vers plusieurs pid

<details>
<summary>
Voir les données
</summary>

| pid         | UAI      | dataset | enstit                     | ensnp                      | bia                        | etu                                                                                                                                                 | fin                        |
|:------------|:---------|:--------|:---------------------------|:---------------------------|:---------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------|
| a5ZAn       | 0301687W | fin     | NA                         | NA                         | NA                         | NA                                                                                                                                                  | CUFR de Nîmes              |
| HAU8L       | 0301687W | fin     | Université de Nîmes        | Université de Nîmes        | Université de Nîmes        | Université de Nîmes;Centre universitaire de formation et de recherche de Nîmes                                                                      | UNÎMES                     |
| z3hdL       | 9710585J | enstit  | Université des Antilles;NA | Université des Antilles;NA | Université des Antilles;NA | Université des Antilles;Institut universitaire de formation des maîtres de Martinique;Institut universitaire de formation des maîtres de Guadeloupe | Université des Antilles;NA |
| z3hdL;hy4EW | 9710585J | enstit  |                            |                            | NA                         | Université des Antilles et de la Guyane                                                                                                             | NA                         |
| z3hdL       | 9710585J | ensnp   | Université des Antilles;NA | Université des Antilles;NA | Université des Antilles;NA | Université des Antilles;Institut universitaire de formation des maîtres de Martinique;Institut universitaire de formation des maîtres de Guadeloupe | Université des Antilles;NA |
| z3hdL;hy4EW | 9710585J | ensnp   |                            |                            | NA                         | Université des Antilles et de la Guyane                                                                                                             | NA                         |

</details>

## Fix fin

### AutoFix fin

<details>
<summary>
Voir les données
</summary>

| UAI      | pid   | pid.fin | etab                                       |
|:---------|:------|:--------|:-------------------------------------------|
| 0751722P | bxPQe | 3RMeh   | Université PARIS 6 - PIERRE ET MARIE CURIE |
| 0631262E | K4lR3 | 3itX6   | Université CLERMONT-FERRAND 1 - AUVERGNE   |
| 0751723R | 5cZyU | 5KpJ9   | Université PARIS 7 - DENIS DIDEROT         |
| 0590311T | 54VTe | 67su6   | ENS CHIMIE LILLE                           |
| 0060931E | s3t8T | 7CYWd   | Université NICE - SOPHIA-ANTIPOLIS         |
| 0440984F | qUCQp | 7hB8r   | Université NANTES                          |

</details>
<details>
<summary>
Check
</summary>

| UAI | pid | pid.fin | etab |
|:----|:----|:--------|:-----|

</details>

### Modifications manuelles du fix

<details>
<summary>
Voir les données
</summary>

| UAI      | pid.dst | pid.src | etab                                       |
|:---------|:--------|:--------|:-------------------------------------------|
| 0751722P | bxPQe   | 3RMeh   | Université PARIS 6 - PIERRE ET MARIE CURIE |
| 0631262E | K4lR3   | 3itX6   | Université CLERMONT-FERRAND 1 - AUVERGNE   |
| 0751723R | 5cZyU   | 5KpJ9   | Université PARIS 7 - DENIS DIDEROT         |
| 0590311T | 54VTe   | 67su6   | ENS CHIMIE LILLE                           |
| 0060931E | s3t8T   | 7CYWd   | Université NICE - SOPHIA-ANTIPOLIS         |
| 0440984F | qUCQp   | 7hB8r   | Université NANTES                          |

</details>

## Fix imo

### Autofix imo

    ## Joining with `by = join_by(pid)`

<details>
<summary>
Check sans correspondance
</summary>

| pid   | etab.imo                                                                                                                                             | pid.imo     | UAI      | etab                                   | n_match |
|:------|:-----------------------------------------------------------------------------------------------------------------------------------------------------|:------------|:---------|:---------------------------------------|--------:|
| 2ALYK | IPG - Institut polytechnique Grenoble,Université Grenoble Alpes                                                                                      | 2ALYK,Y7ch7 | 0381912X | Institut polytechnique de Grenoble     |       2 |
| Y7ch7 | IPG - Institut polytechnique Grenoble,Université Grenoble Alpes                                                                                      | 2ALYK,Y7ch7 | 0381838S | Université Grenoble Alpes              |       2 |
| 6G2TU | Paris-I “Université Panthéon-Sorbonne”,Paris-II “Université Panthéon-Assas”                                                                          | 6G2TU,TWBzp | 0751717J | Université Paris 1 - Panthéon Sorbonne |       2 |
| TWBzp | Paris-I “Université Panthéon-Sorbonne”,Paris-II “Université Panthéon-Assas”                                                                          | 6G2TU,TWBzp | 0751718K | Université Paris-Panthéon-Assas        |       2 |
| 5cZyU | ENS - École Normale Supérieure,CROUS de l’académie de Paris (CROUS de Paris),Centre national de la recherche scientifique (CNRS),Université de Paris | 8618D,5cZyU | 0751723R | Université Paris Cité                  |       2 |
| 8618D | ENS - École Normale Supérieure,CROUS de l’académie de Paris (CROUS de Paris),Centre national de la recherche scientifique (CNRS),Université de Paris | 8618D,5cZyU | 0753455Y | École normale supérieure PSL           |       2 |

</details>

Les bâtiments entre plusieurs établissements sont exclus du jeu de
données.

<details>
<summary>
Nombre d’exclusion
</summary>

| Année | n_batiments | n_exclus | part  |
|------:|------------:|---------:|:------|
|  2017 |        6339 |       17 | 0.27% |
|  2018 |        6357 |       20 | 0.31% |
|  2019 |        6380 |       21 | 0.33% |
|  2020 |        6350 |       25 | 0.39% |
|  2021 |        6406 |       25 | 0.39% |
|  2022 |        6407 |       27 | 0.42% |

</details>

## Application du fix

### Check : données incomplètes Universités

| pid   | etab                                                                                                                                                                                                                                                                                                                                                           | datasets                             |
|:------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------|
|       | Université Bretagne Loire;Université Bretagne Loire;Université européenne de Bretagne                                                                                                                                                                                                                                                                          | etu fin etu                          |
| 4a8B2 | Université fédérale de Toulouse Midi-Pyrénées;Université fédérale de Toulouse Midi-Pyrénées                                                                                                                                                                                                                                                                    | bia fin                              |
| 52U59 | Université confédérale Léonard de Vinci;Université confédérale Léonard de Vinci                                                                                                                                                                                                                                                                                | bia fin                              |
| 6g0Mb | Université PARIS-EST                                                                                                                                                                                                                                                                                                                                           | fin                                  |
| 86UpY | Université Paris Lumières;Université Paris Lumières;Université Paris Lumières                                                                                                                                                                                                                                                                                  | bia etu fin                          |
| 8A0mg | Université BOURGOGNE FRANCHE-COMTÉ;Université Bourgogne - Franche-Comté;Université Bourgogne - Franche-Comté                                                                                                                                                                                                                                                   | fin bia etu                          |
| EPci7 | HESAM Université                                                                                                                                                                                                                                                                                                                                               | bia                                  |
| G1r6y | Normandie Université                                                                                                                                                                                                                                                                                                                                           | bia                                  |
| PpsCQ | Université Paris sciences et lettres;Université Paris sciences et lettres;Université Paris sciences et lettres;Université Paris sciences et lettres;Université Paris sciences et lettres;Université de Paris sciences et lettres;Université de recherche Paris sciences et lettres - PSL Research University;Université de recherche Paris-Sciences-et-Lettres | enstit ensnp bia bia etu fin fin etu |
| iq0rG | Université de Lyon;Université de Lyon                                                                                                                                                                                                                                                                                                                          | bia fin                              |
| tIJ02 | Université Jean Monnet;Université Jean Monnet;Université Jean Monnet;Université Jean Monnet;Université SAINT-ETIENNE - JEAN MONNET                                                                                                                                                                                                                             | enstit ensnp bia etu fin             |
| u79ZJ | IEP-Paris - Institut d’études politiques de Paris,Paris-II “Université Panthéon-Assas”                                                                                                                                                                                                                                                                         | imo                                  |
| uCPtX | Université Sorbonne Paris Cité (USPC)                                                                                                                                                                                                                                                                                                                          | fin                                  |

## Chargement des données CPESR

| nb_etabs |
|---------:|
|      294 |

### Détection des établissements en double

| UAI | Etablissement | Type | Groupe | PerimEx | Association | Comparable |
|:----|:--------------|:-----|:-------|:--------|:------------|:-----------|

## Ajout des pid à cpesr

    ## Joining with `by = join_by(UAI)`

### Détection double pid

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

    ## Joining with `by = join_by(UAI)`

<details>
<summary>
Voir les données
</summary>

| pid                           | UAI      | etab                                                                                                                                                                                                                                               |
|:------------------------------|:---------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 2ALYK,Y7ch7                   | NA       | IPG - Institut polytechnique Grenoble,Université Grenoble Alpes                                                                                                                                                                                    |
| 6G2TU,TWBzp                   | NA       | Paris-I “Université Panthéon-Sorbonne”,Paris-II “Université Panthéon-Assas”                                                                                                                                                                        |
| 8618D,5cZyU                   | NA       | ENS - École Normale Supérieure,CROUS de l’académie de Paris (CROUS de Paris),Centre national de la recherche scientifique (CNRS),Université de Paris                                                                                               |
| 8DrrS                         | 0755449R | Musée du Quai Branly                                                                                                                                                                                                                               |
| 8k883,bxPQe,6G2TU,5cZyU,QXnpG | NA       | Paris-III “Université La Sorbonne Nouvelle”,Sorbonne Université,Paris-I “Université Panthéon-Sorbonne”,EDUCATION NATIONALE SERVICES DÉCONCENTRÉS,Université de Paris,Chancellerie des Universités de Paris,EPHE - École pratique des hautes études |
| 8k883,bxPQe,6G2TU,O2v0H,QXnpG | NA       | Paris-III “Université La Sorbonne Nouvelle”,Sorbonne Université,Paris-I “Université Panthéon-Sorbonne”,EDUCATION NATIONALE SERVICES DÉCONCENTRÉS,Université de Paris,Chancellerie des Universités de Paris,EPHE - École pratique des hautes études |

</details>

### pid hors cpesr dans etab

<details>
<summary>
Voir les données
</summary>

    ## Joining with `by = join_by(UAI)`

| pid   | UAI      | etab                                     | Etablissement                                          | Sigle | Type                                       | Typologie | Secteur | Statut | EPE | Fusion | Vague | Académie | url.siteweb                          | url.wikidata                                | url.legifrance                                                                                       | twitter | siren | siret | dataset | Rattachement |
|:------|:---------|:-----------------------------------------|:-------------------------------------------------------|:------|:-------------------------------------------|:----------|:--------|:-------|:----|:-------|:------|:---------|:-------------------------------------|:--------------------------------------------|:-----------------------------------------------------------------------------------------------------|:--------|:------|:------|:--------|:-------------|
| FKt2q | 0753655R | Fondation Maison des Sciences de l’homme | Fondation Maison des Sciences de l’homme               | FMSH  | Autre établissement                        | NA        | NA      | NA     | NA  | NA     | NA    | Paris    | <http://www.fmsh.fr/>                | <https://www.wikidata.org/entity/Q3075494>  | NA                                                                                                   | NA      | NA    | NA    | etab.19 | NA           |
| t6C0i | 0333178A | COMUE D’AQUITAINE                        | Communauté d’universités et établissements d’Aquitaine | NA    | Communauté d’universités et établissements | NA        | NA      | NA     | NA  | NA     | NA    | Bordeaux | <http://www.cue-aquitaine.fr/>       | <https://www.wikidata.org/entity/Q16541346> | <http://legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000030348150&dateTexte=&categorieLien=id> | NA      | NA    | NA    | etab.19 | NA           |
| uCPtX | 0755598C | Université Sorbonne Paris Cité (USPC)    | Université Sorbonne Paris Cité                         | NA    | Communauté d’universités et établissements | NA        | NA      | NA     | NA  | NA     | NA    | Paris    | <http://www.sorbonne-paris-cite.fr/> | <https://www.wikidata.org/entity/Q3491149>  | <http://legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000030002051&dateTexte=&categorieLien=id> | NA      | NA    | NA    | etab.19 | NA           |

</details>

### pid hors cpesr hors etab

<details>
<summary>
Voir les données
</summary>

    ## Joining with `by = join_by(UAI)`

| pid                           | UAI      | etab                                                                                                                                                                                                                                               | Etablissement | Sigle | Type  | Typologie | Secteur | Statut | EPE | Fusion | Vague | Académie | url.siteweb | url.wikidata | url.legifrance | twitter | siren | siret | dataset | Rattachement |
|:------------------------------|:---------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------|:------|:------|:----------|:--------|:-------|:----|:-------|:------|:---------|:------------|:-------------|:---------------|:--------|:------|:------|:--------|:-------------|
| 2ALYK,Y7ch7                   | NA       | IPG - Institut polytechnique Grenoble,Université Grenoble Alpes                                                                                                                                                                                    | NA            | NA    | École | NA        | NA      | NA     | NA  | NA     | NA    | NA       | NA          | NA           | NA             | NA      | NA    | NA    | etab.24 | NA           |
| 6G2TU,TWBzp                   | NA       | Paris-I “Université Panthéon-Sorbonne”,Paris-II “Université Panthéon-Assas”                                                                                                                                                                        | NA            | NA    | École | NA        | NA      | NA     | NA  | NA     | NA    | NA       | NA          | NA           | NA             | NA      | NA    | NA    | etab.24 | NA           |
| 8618D,5cZyU                   | NA       | ENS - École Normale Supérieure,CROUS de l’académie de Paris (CROUS de Paris),Centre national de la recherche scientifique (CNRS),Université de Paris                                                                                               | NA            | NA    | École | NA        | NA      | NA     | NA  | NA     | NA    | NA       | NA          | NA           | NA             | NA      | NA    | NA    | etab.24 | NA           |
| 8DrrS                         | 0755449R | Musée du Quai Branly                                                                                                                                                                                                                               | NA            | NA    | NA    | NA        | NA      | NA     | NA  | NA     | NA    | NA       | NA          | NA           | NA             | NA      | NA    | NA    | NA      | NA           |
| 8k883,bxPQe,6G2TU,5cZyU,QXnpG | NA       | Paris-III “Université La Sorbonne Nouvelle”,Sorbonne Université,Paris-I “Université Panthéon-Sorbonne”,EDUCATION NATIONALE SERVICES DÉCONCENTRÉS,Université de Paris,Chancellerie des Universités de Paris,EPHE - École pratique des hautes études | NA            | NA    | École | NA        | NA      | NA     | NA  | NA     | NA    | NA       | NA          | NA           | NA             | NA      | NA    | NA    | etab.24 | NA           |
| 8k883,bxPQe,6G2TU,O2v0H,QXnpG | NA       | Paris-III “Université La Sorbonne Nouvelle”,Sorbonne Université,Paris-I “Université Panthéon-Sorbonne”,EDUCATION NATIONALE SERVICES DÉCONCENTRÉS,Université de Paris,Chancellerie des Universités de Paris,EPHE - École pratique des hautes études | NA            | NA    | École | NA        | NA      | NA     | NA  | NA     | NA    | NA       | NA          | NA           | NA             | NA      | NA    | NA    | etab.24 | NA           |

</details>

## Créations du jeu de données établissement

    ## Joining with `by = join_by(UAI)`
    ## Joining with `by = join_by(pid)`

<details>
<summary>
Voir les données
</summary>

    ## `summarise()` has grouped output by 'Groupe'. You can override using the
    ## `.groups` argument.

| Groupe                   | nb_ds_3 | nb_ds_4 | nb_ds_5 | nb_ds_6 | nb_ds_1 | nb_ds_2 |
|:-------------------------|--------:|--------:|--------:|--------:|--------:|--------:|
| Universités et assimilés |       1 |       1 |       2 |      66 |       0 |       0 |
| Regroupements            |       4 |       0 |       0 |       0 |       1 |       5 |
| Ecoles d’ingénieurs      |       0 |       0 |       1 |      30 |       1 |       0 |
| Autres établissements    |       4 |       2 |       5 |      25 |       1 |       4 |

</details>

### Vérification doublons

<details>
<summary>
Voir les données
</summary>

| pid | Etablissement | Groupe | Groupe.détaillé | Type | nb_datasets | UAI | PerimEx | Association | Comparable | Sigle | Typologie | Secteur | Statut | EPE | Fusion | Vague | Académie | url.siteweb | url.wikidata | url.legifrance | twitter | siren | siret | dataset | Rattachement | Plotable |
|:----|:--------------|:-------|:----------------|:-----|------------:|:----|:--------|:------------|:-----------|:------|:----------|:--------|:-------|:----|:-------|:------|:---------|:------------|:-------------|:---------------|:--------|:------|:------|:--------|:-------------|:---------|

</details>
<details>
<summary>
Voir les données
</summary>

| pid | Etablissement | Groupe | Groupe.détaillé | Type | nb_datasets | UAI | PerimEx | Association | Comparable | Sigle | Typologie | Secteur | Statut | EPE | Fusion | Vague | Académie | url.siteweb | url.wikidata | url.legifrance | twitter | siren | siret | dataset | Rattachement | Plotable |
|:----|:--------------|:-------|:----------------|:-----|------------:|:----|:--------|:------------|:-----------|:------|:----------|:--------|:-------|:----|:-------|:------|:---------|:------------|:-------------|:---------------|:--------|:------|:------|:--------|:-------------|:---------|

</details>

### Wikidata manquants

<details>
<summary>
Voir les données
</summary>

| Groupe                | pid   | Etablissement                                            | url.wikidata |
|:----------------------|:------|:---------------------------------------------------------|:-------------|
| Autres établissements | vQ6Hh | Académie des sciences d’outre-mer                        | NA           |
| Autres établissements | J8X6q | Agence bibliographique de l’enseignement supérieur       | NA           |
| Autres établissements | VfvdY | Bibliothèque nationale et universitaire de Strasbourg    | NA           |
| Autres établissements | 1bXaK | Bibliothèque universitaire des langues et civilisations  | NA           |
| Autres établissements | QuDx7 | Centre informatique national de l’enseignement supérieur | NA           |
| Autres établissements | fV2g5 | Centre technique du livre de l’enseignement supérieur    | NA           |

</details>

#### Correction manuelle

<details>
<summary>
Voir les données
</summary>

| pid   | url.wikidata                               |
|:------|:-------------------------------------------|
| VfvdY | <https://www.wikidata.org/entity/Q630461>  |
| J8X6q | <https://www.wikidata.org/entity/Q2826570> |

</details>

### Sigles manquants

#### Sigles récupérables sur wikidata

    ## Warning: There were 12 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `wikidata.alias = `$`(...)`.
    ## Caused by warning in `wdesr_get_item_status()`:
    ## ! The instance of wikidata item Q13334 is not recommended: université.
    ##   Reason is: Statut trop imprécis.
    ##   Please check https://www.wikidata.org/wiki/Q13334
    ##   using the guideline at https://github.com/cpesr
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 11 remaining warnings.

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                                | Sigle                |
|:------|:---------------------------------------------|:---------------------|
| 91D9w | Université de Rennes 1                       | UR1                  |
| BWbvP | Université d’Artois                          | U. Artois            |
| G2qA7 | Université Paris-Saclay                      | UPSaclay             |
| HCBvW | Université d’Orléans                         | Université d’Orléans |
| TWBzp | Université Panthéon-Assas                    | Assas                |
| Uxr7Z | Université Paris 8 - Vincennes - Saint-Denis | UP8                  |

</details>

#### Sigles toujours manquants et fix automatique

<details>
<summary>
Voir les données
</summary>

| UAI      | pid   | Etablissement                                            | Sigle | url.wikidata |
|:---------|:------|:---------------------------------------------------------|:------|:-------------|
| 0755040W | 1bXaK | Bibliothèque universitaire des langues et civilisations  | NA    | NA           |
| 0342032Z | QuDx7 | Centre informatique national de l’enseignement supérieur | NA    | NA           |
| 0772428W | fV2g5 | Centre technique du livre de l’enseignement supérieur    | NA    | NA           |
| 0752744A | vQ6Hh | Académie des sciences d’outre-mer                        | NA    | NA           |
| 0912423P | 6kk6n | École normale supérieure Paris-Saclay                    | NA    | NA           |
| 0632086A | S8ntZ | Clermont Auvergne INP                                    | NA    | NA           |

</details>

#### Réduction de “Université” à “U.” dans les sigles

### Ecriture des fichiers

<details>
<summary>
Voir les données
</summary>

| pid   | Etablissement                   | Groupe                   | Groupe.détaillé          | Type                | nb_datasets | UAI      | PerimEx | Association | Comparable | Sigle           | Typologie                                | Secteur | Statut | EPE  | Fusion | Vague   | Académie      | url.siteweb                       | url.wikidata                                | url.legifrance                                                 | twitter                               | siren     | siret          | dataset | Rattachement | Plotable |
|:------|:--------------------------------|:-------------------------|:-------------------------|:--------------------|------------:|:---------|:--------|:------------|:-----------|:----------------|:-----------------------------------------|:--------|:-------|:-----|:-------|:--------|:--------------|:----------------------------------|:--------------------------------------------|:---------------------------------------------------------------|:--------------------------------------|:----------|:---------------|:--------|:-------------|:---------|
| xJdyB | Aix-Marseille Université        | Universités et assimilés | Universités et assimilés | Université          |           6 | 0134009M | IDEx    | Udice       | TRUE       | AMU             | Université pluridisciplinaire avec santé | public  | EPSCP  | NA   | TRUE   | Vague C | Aix-Marseille | <https://www.univ-amu.fr/>        | <https://www.wikidata.org/entity/Q2302586>  | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000024502554/> | <https://twitter.com/univamu>         | 130015332 | 13001533200013 | etab.24 | NA           | TRUE     |
| vxHYt | Avignon Université              | Universités et assimilés | Universités et assimilés | Université          |           6 | 0840685N |         | AUREF       | TRUE       | AU              | Université pluridisciplinaire hors santé | public  | EPSCP  | NA   | NA     | Vague C | Aix-Marseille | <https://univ-avignon.fr/>        | <https://www.wikidata.org/entity/Q2033119>  | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000000503527>  | <https://twitter.com/univavignon>     | 198406852 | 19840685200204 | etab.24 | NA           | TRUE     |
| RS4WF | CY Cergy Paris Université       | Universités et assimilés | Universités et assimilés | Université          |           6 | 0952259P | ISITE   |             | FALSE      | CYU             | Université pluridisciplinaire hors santé | public  | EPSCP  | TRUE | NA     | Vague E | Versailles    | <https://www.cyu.fr/>             | <https://www.wikidata.org/entity/Q74452784> | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000039287925/> | <https://twitter.com/UniversiteCergy> | 130025976 | 13002597600015 | etab.24 | NA           | TRUE     |
| pVJpw | Centre universitaire de Mayotte | Universités et assimilés | Universités et assimilés | Autre établissement |           6 | 9760358K |         |             | FALSE      | CUFR de Mayotte | Université pluridisciplinaire hors santé | public  | EPSCP  | NA   | NA     | Vague E | Mayotte       | <http://www.univ-mayotte.fr/>     | <https://www.wikidata.org/entity/Q2946102>  | NA                                                             | <https://twitter.com/CufrMayotte>     | 130016314 | 13001631400010 | etab.24 | NA           | TRUE     |
| atbEK | La Rochelle Université          | Universités et assimilés | Universités et assimilés | Université          |           6 | 0171463Y |         | AUREF       | TRUE       | U. La Rochelle  | Université pluridisciplinaire hors santé | public  | EPSCP  | NA   | NA     | Vague B | Poitiers      | <https://www.univ-larochelle.fr/> | <https://www.wikidata.org/entity/Q1500822>  | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000000726433/> | <https://twitter.com/UnivLaRochelle>  | 191700327 | 19170032700015 | etab.24 | NA           | TRUE     |
| 9xlel | Le Mans Université              | Universités et assimilés | Universités et assimilés | Université          |           6 | 0720916E |         | AUREF       | TRUE       | LMU             | Université pluridisciplinaire hors santé | public  | EPSCP  | NA   | NA     | Vague B | Nantes        | <http://www.univ-lemans.fr/>      | <https://www.wikidata.org/entity/Q834825>   | <https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000000883893/> | <https://twitter.com/LeMansUniv>      | 197209166 | 19720916600010 | etab.24 | NA           | TRUE     |

</details>

## Autres vérifications

### Portée variables finances

    ## Warning: Using an external vector in selections was deprecated in tidyselect 1.1.0.
    ## ℹ Please use `all_of()` or `any_of()` instead.
    ##   # Was:
    ##   data %>% select(vars)
    ## 
    ##   # Now:
    ##   data %>% select(all_of(vars))
    ## 
    ## See <https://tidyselect.r-lib.org/reference/faq-external-vector.html>.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
    ## generated.

    ## `summarise()` has grouped output by 'Année'. You can override using the
    ## `.groups` argument.

![](maj-mapping_files/figure-gfm/disp.fin-1.png)<!-- -->

### Portée variables finances 2021

    ## `summarise()` has grouped output by 'Année'. You can override using the
    ## `.groups` argument.

![](maj-mapping_files/figure-gfm/disp.fin.21-1.png)<!-- -->

### Incohérence BIATSS

| Année | etablissement_id_paysage_actuel | Etablissement | Catégorie | Corps | Effectif | effectif_femmes | effectif_hommes |
|------:|:--------------------------------|:--------------|:----------|:------|---------:|----------------:|----------------:|

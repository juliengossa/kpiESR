Mise à jour des données
================
2021-11-17

Ce document décrit le processus de mise à jour des données kpiESR, et
notamment la fusion et l’amélioration de trois versions du jeu de donnée
sur les établissements (2021, 2020 et 2019), et trois jeux de données
(enseignants, étudiants et finances).

Ces jeux sont notés `etab.21`, `etab.20`, `etab.19`, `ens`, `etu` et
`fin`.

<details>
<summary>
Voir les données
</summary>

| data    | Nb.uais | Rentrée.min | Rentrée.max |
|:--------|--------:|:------------|:------------|
| etab.21 |     260 | NA          | NA          |
| etab.20 |     264 | NA          | NA          |
| etab.19 |     327 | NA          | NA          |
| ens     |     175 | 2010        | 2019        |
| etu     |     215 | 2006        | 2020        |
| fin     |     189 | 2009        | 2020        |

</details>

### Méthodologie :

1.  Recherche des UAI manquants dans tous les jeux de données
2.  Constitution des données universités
    1.  Identification des universités dans `etab.21`
    2.  Identification des correspondances manquantes avec `ens`, `etu`
        et `fin`
    3.  Recherche de ces correspondances dans `etab.20` et `etab.19`
    4.  Recherche de correspondances dans les établissements hors
        `etab.x`
    5.  Création manuelle des corrections
    6.  Vérification des données manquantes après correction
3.  Constitution des données non université
    1.  Identification des établissements avec données complètes
    2.  Vérification d’éventuelle données complètes hors `etab.21`
    3.  Constitution de la liste des non universités avec données
        complètes
4.  Autres données manquantes
    1.  Détection et correction des wikidata manquants
    2.  Détection et correction des sigles manquants avec wikidata
    3.  Détection et correction manuelle des sigles encore manquants
5.  Fusion des jeux de données

## UAI manquants

<details>
<summary>
Voir les données
</summary>

| dataset | UAI | Etablissement                                |
|:--------|:----|:---------------------------------------------|
| etab.21 | NA  | Groupe Institut catholique d’arts et métiers |

</details>

## Constitution des données universités

### Identification des universités dans `etab.21`

<details>
<summary>
Voir les données
</summary>

| UAI      | etab.21                                            | etab.20                                            | etab.19                                            | ens       | etu       | fin       |
|:---------|:---------------------------------------------------|:---------------------------------------------------|:---------------------------------------------------|:----------|:----------|:----------|
| 0134009M | Aix-Marseille Université                           | Aix-Marseille Université                           | Aix-Marseille Université                           | 2010-2019 | 2011-2020 | 2010-2020 |
| 0840685N | Avignon Université                                 | Avignon Université                                 | Avignon Université                                 | 2010-2019 | 2006-2020 | 2009-2020 |
| 0952259P | CY Cergy Paris Université                          | CY Cergy Paris Université                          | NA                                                 | 2019-2019 | 2019-2020 | 2019-2020 |
| 0171463Y | La Rochelle Université                             | La Rochelle Université                             | La Rochelle Université                             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0720916E | Le Mans Université                                 | Le Mans Université                                 | Le Mans Université                                 | 2010-2019 | 2006-2020 | 2009-2020 |
| 0442953W | Nantes Université                                  | NA                                                 | NA                                                 | NA        | NA        | NA        |
| 0755890V | Sorbonne Université                                | Sorbonne Université                                | Sorbonne Université                                | 2017-2019 | 2017-2020 | 2017-2020 |
| 0331766R | Université Bordeaux Montaigne                      | Université Bordeaux-Montaigne                      | Université Bordeaux-Montaigne                      | 2010-2019 | 2006-2020 | 2009-2020 |
| 0561718N | Université Bretagne Sud                            | Université de Bretagne-Sud                         | Université de Bretagne-Sud                         | 2010-2019 | 2006-2020 | 2009-2020 |
| 0691774D | Université Claude Bernard - Lyon 1                 | Université Claude Bernard - Lyon 1                 | Université Claude Bernard - Lyon 1                 | 2010-2019 | 2006-2020 | 2009-2020 |
| 0632084Y | Université Clermont Auvergne                       | NA                                                 | NA                                                 | NA        | 2020-2020 | NA        |
| 0062205P | Université Côte d’Azur                             | Université Côte d’Azur                             | NA                                                 | 2019-2019 | 2019-2020 | 2019-2020 |
| 0490970N | Université d’Angers                                | Université d’Angers                                | Université d’Angers                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0623957P | Université d’Artois                                | Université d’Artois                                | Université d’Artois                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0911975C | Université d’Évry-Val-d’Essonne                    | Université d’Évry-Val d’Essonne                    | Université d’Évry-Val d’Essonne                    | 2010-2019 | 2006-2020 | 2009-2020 |
| 0450855K | Université d’Orléans                               | Université d’Orléans                               | Université d’Orléans                               | 2010-2019 | 2006-2020 | 2009-2020 |
| 0333298F | Université de Bordeaux                             | Université de Bordeaux                             | Université de Bordeaux                             | 2012-2019 | 2013-2020 | 2012-2020 |
| 0211237F | Université de Bourgogne                            | Université de Bourgogne                            | Université de Bourgogne                            | 2010-2019 | 2006-2020 | 2009-2020 |
| 0290346U | Université de Bretagne Occidentale                 | Université de Bretagne Occidentale                 | Université de Bretagne Occidentale                 | 2010-2019 | 2006-2020 | 2009-2020 |
| 0141408E | Université de Caen Normandie                       | Université de Caen Normandie                       | Université de Caen Normandie                       | 2010-2019 | 2006-2020 | 2009-2020 |
| 7200664J | Université de Corse Pasquale Paoli                 | Université de Corse Pasquale Paoli                 | Université de Corse Pasquale Paoli                 | 2010-2019 | 2006-2020 | 2009-2020 |
| 0251215K | Université de Franche-Comté                        | Université de Franche-Comté                        | Université de Franche-Comté                        | 2010-2019 | 2006-2020 | 2009-2020 |
| 9730429D | Université de Guyane                               | Université de Guyane                               | Université de Guyane                               | 2015-2019 | 2014-2020 | 2014-2020 |
| 0681166Y | Université de Haute-Alsace                         | Université de Haute-Alsace                         | Université de Haute-Alsace                         | 2010-2019 | 2006-2020 | 2009-2020 |
| 9830445S | Université de la Nouvelle-Calédonie                | Université de la Nouvelle-Calédonie                | Université de la Nouvelle-Calédonie                | 2010-2019 | 2006-2020 | 2009-2020 |
| 9840349G | Université de la Polynésie Française               | Université de la Polynésie Française               | Université de la Polynésie Française               | 2010-2019 | 2006-2020 | 2009-2020 |
| 9740478B | Université de La Réunion                           | Université de La Réunion                           | Université de La Réunion                           | 2010-2019 | 2006-2020 | 2009-2020 |
| 0597239Y | Université de Lille                                | NA                                                 | NA                                                 | NA        | NA        | NA        |
| 0870669E | Université de Limoges                              | Université de Limoges                              | Université de Limoges                              | 2010-2019 | 2006-2020 | 2009-2020 |
| 0542493S | Université de Lorraine                             | Université de Lorraine                             | Université de Lorraine                             | 2011-2019 | 2011-2020 | 2011-2020 |
| 0342490X | Université de Montpellier                          | NA                                                 | NA                                                 | NA        | NA        | NA        |
| 0301687W | Université de Nîmes                                | Université de Nîmes                                | Université de Nîmes                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0755976N | Université de Paris                                | Université de Paris                                | Université de Paris                                | 2019-2019 | 2019-2020 | 2019-2020 |
| 0640251A | Université de Pau et des Pays de l’Adour           | Université de Pau et des Pays de l’Adour           | Université de Pau et des Pays de l’Adour           | 2010-2019 | 2006-2020 | 2009-2020 |
| 0660437S | Université de Perpignan Via Domitia                | Université de Perpignan - Via Domitia              | Université de Perpignan - Via Domitia              | 2010-2019 | 2006-2020 | 2009-2020 |
| 0801344B | Université de Picardie Jules-Verne                 | Université de Picardie Jules-Verne                 | Université de Picardie Jules-Verne                 | 2010-2019 | 2006-2020 | 2009-2020 |
| 0860856N | Université de Poitiers                             | Université de Poitiers                             | Université de Poitiers                             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0511296G | Université de Reims Champagne-Ardenne              | Université de Reims Champagne-Ardenne              | Université de Reims Champagne-Ardenne              | 2010-2019 | 2006-2020 | 2009-2020 |
| 0350936C | Université de Rennes 1                             | Université de Rennes 1                             | Université de Rennes 1                             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0761904G | Université de Rouen Normandie                      | Université de Rouen                                | Université de Rouen                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0673021V | Université de Strasbourg                           | Université de Strasbourg                           | Université de Strasbourg                           | 2010-2019 | 2008-2020 | 2009-2020 |
| 0900424X | Université de technologie de Belfort-Montbéliard   | Université de technologie de Belfort-Montbéliard   | Université de technologie de Belfort-Montbéliard   | 2010-2019 | 2006-2020 | 2009-2020 |
| 0601223D | Université de technologie de Compiègne             | Université de technologie de Compiègne             | Université de technologie de Compiègne             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0101060Y | Université de technologie de Troyes                | Université de technologie de Troyes                | Université de technologie de Troyes                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0830766G | Université de Toulon                               | Université de Toulon                               | Université de Toulon                               | 2010-2019 | 2006-2020 | 2009-2020 |
| 0370800U | Université de Tours                                | Université de Tours                                | Université de Tours                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0781944P | Université de Versailles Saint-Quentin-en-Yvelines | Université de Versailles Saint-Quentin-en-Yvelines | Université de Versailles Saint-Quentin-en-Yvelines | 2010-2019 | 2006-2020 | 2009-2020 |
| 9710585J | Université des Antilles                            | Université des Antilles                            | Université des Antilles                            | 2010-2019 | 2006-2020 | 2009-2020 |
| 0595964M | Université du Littoral Côte d’Opale                | Université du Littoral Côte d’Opale                | Université du Littoral Côte d’Opale                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0383546Y | Université Grenoble Alpes                          | Université Grenoble Alpes                          | NA                                                 | 2019-2019 | 2019-2020 | 2019-2020 |
| 0772894C | Université Gustave Eiffel                          | Université Gustave Eiffel                          | NA                                                 | 2019-2019 | 2019-2020 | 2019-2020 |
| 0421095M | Université Jean Monnet                             | Université Jean Monnet                             | Université Jean Monnet                             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0692437Z | Université Jean Moulin - Lyon 3                    | Université Jean Moulin - Lyon 3                    | Université Jean Moulin - Lyon 3                    | 2010-2019 | 2006-2020 | 2009-2020 |
| 0762762P | Université Le Havre Normandie                      | Université Le Havre Normandie                      | Université du Havre                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0691775E | Université Lumière - Lyon 2                        | Université Lumière - Lyon 2                        | Université Lumière - Lyon 2                        | 2010-2019 | 2006-2020 | 2009-2020 |
| 0751718K | Université Panthéon-Assas                          | Université Panthéon-Assas                          | Université Panthéon-Assas                          | 2010-2019 | 2006-2020 | 2009-2020 |
| 0751717J | Université Paris 1 - Panthéon Sorbonne             | Université Paris 1 - Panthéon Sorbonne             | Université Paris 1 - Panthéon Sorbonne             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0931827F | Université Paris 8 - Vincennes - Saint-Denis       | Université Paris 8 - Vincennes - Saint-Denis       | Université Paris 8 - Vincennes - Saint-Denis       | 2010-2019 | 2006-2020 | 2009-2020 |
| 0921204J | Université Paris Nanterre                          | Université Paris Nanterre                          | Université Paris Nanterre                          | 2010-2019 | 2006-2020 | 2009-2020 |
| 0756036D | Université Paris sciences et lettres               | Université Paris sciences et lettres               | NA                                                 | NA        | 2019-2020 | 2019-2020 |
| 0941111X | Université Paris-Est Créteil                       | Université Paris-Est Créteil Val-de-Marne          | Université Paris-Est Créteil Val-de-Marne          | 2010-2019 | 2006-2020 | 2009-2020 |
| 0912408Y | Université Paris-Saclay                            | Université Paris-Saclay                            | NA                                                 | 2019-2019 | 2019-2020 | 2019-2020 |
| 0341089Z | Université Paul-Valéry - Montpellier 3             | Université Montpellier 3 - Paul-Valéry             | Université Montpellier 3 - Paul-Valéry             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0597132G | Université Polytechnique Hauts-de-France           | Université Polytechnique Hauts-de-France           | Université Polytechnique Hauts-de-France           | 2019-2019 | 2019-2020 | 2019-2020 |
| 0350937D | Université Rennes 2                                | Université Rennes 2                                | Université Rennes 2                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0730858L | Université Savoie Mont Blanc                       | Université Savoie Mont Blanc                       | Université Savoie Mont Blanc                       | 2010-2019 | 2006-2020 | 2009-2020 |
| 0751719L | Université Sorbonne Nouvelle - Paris 3             | Université Sorbonne Nouvelle - Paris 3             | Université Sorbonne Nouvelle - Paris 3             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0931238R | Université Sorbonne Paris Nord                     | Université Sorbonne Paris Nord                     | Université Paris 13                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0311383K | Université Toulouse - Jean Jaurès                  | Université Toulouse - Jean Jaurès                  | Université Toulouse - Jean Jaurès                  | 2010-2019 | 2006-2020 | 2009-2020 |
| 0311382J | Université Toulouse Capitole                       | Université Toulouse 1 - Capitole                   | Université Toulouse 1 - Capitole                   | 2010-2019 | 2006-2020 | 2009-2020 |
| 0311384L | Université Toulouse III - Paul Sabatier            | Université de Toulouse 3 - Paul Sabatier           | Université de Toulouse 3 - Paul Sabatier           | 2010-2019 | 2006-2020 | 2009-2020 |

</details>

### Identification des correspondances manquantes

<details>
<summary>
Voir les données
</summary>

| UAI      | etab.21                              | etab.20                              | etab.19 | ens | etu       | fin       |
|:---------|:-------------------------------------|:-------------------------------------|:--------|:----|:----------|:----------|
| 0442953W | Nantes Université                    | NA                                   | NA      | NA  | NA        | NA        |
| 0756036D | Université Paris sciences et lettres | Université Paris sciences et lettres | NA      | NA  | 2019-2020 | 2019-2020 |
| 0342490X | Université de Montpellier            | NA                                   | NA      | NA  | NA        | NA        |
| 0632084Y | Université Clermont Auvergne         | NA                                   | NA      | NA  | 2020-2020 | NA        |
| 0597239Y | Université de Lille                  | NA                                   | NA      | NA  | NA        | NA        |

</details>

### Recherche des correspondances manquantes

<details>
<summary>
Voir détail universités manquantes
</summary>

#### Nantes

| UAI      | etab.21 | etab.20              | etab.19              | ens       | etu       | fin       |
|:---------|:--------|:---------------------|:---------------------|:----------|:----------|:----------|
| 0440984F | NA      | Université de Nantes | Université de Nantes | 2010-2019 | 2006-2020 | 2009-2020 |

#### PSL

| UAI      | etab.21                              | etab.20                              | etab.19                                                                     | ens | etu       | fin       |
|:---------|:-------------------------------------|:-------------------------------------|:----------------------------------------------------------------------------|:----|:----------|:----------|
| 0756036D | Université Paris sciences et lettres | Université Paris sciences et lettres | NA                                                                          | NA  | 2019-2020 | 2019-2020 |
| 0755700N | NA                                   | NA                                   | Université de recherche Paris sciences et lettres - PSL Research University | NA  | 2016-2018 | 2015-2018 |

| UAI      | etab.21 | etab.20 | etab.19                   | ens       | etu       | fin       |
|:---------|:--------|:--------|:--------------------------|:----------|:----------|:----------|
| 0750736T | NA      | NA      | Université Paris-Dauphine | 2010-2019 | 2006-2018 | 2009-2020 |

#### Montpellier

| UAI      | etab.21                                | etab.20                                | etab.19                                | ens       | etu       | fin       |
|:---------|:---------------------------------------|:---------------------------------------|:---------------------------------------|:----------|:----------|:----------|
| 0341089Z | Université Paul-Valéry - Montpellier 3 | Université Montpellier 3 - Paul-Valéry | Université Montpellier 3 - Paul-Valéry | 2010-2019 | 2006-2020 | 2009-2020 |
| 0342490X | Université de Montpellier              | NA                                     | NA                                     | NA        | NA        | NA        |
| 0342321N | NA                                     | Université de Montpellier              | Université de Montpellier              | 2012-2019 | 2014-2020 | 2013-2020 |

#### Clermont

| UAI      | etab.21                      | etab.20                      | etab.19                      | ens       | etu       | fin       |
|:---------|:-----------------------------|:-----------------------------|:-----------------------------|:----------|:----------|:----------|
| 0632084Y | Université Clermont Auvergne | NA                           | NA                           | NA        | 2020-2020 | NA        |
| 0632035V | NA                           | Université Clermont Auvergne | Université Clermont Auvergne | 2016-2019 | 2016-2019 | 2015-2020 |

#### Lille

| UAI      | etab.21             | etab.20             | etab.19                         | ens       | etu       | fin       |
|:---------|:--------------------|:--------------------|:--------------------------------|:----------|:----------|:----------|
| 0597239Y | Université de Lille | NA                  | NA                              | NA        | NA        | NA        |
| 0597065J | NA                  | Université de Lille | Université de Lille             | 2017-2019 | 2017-2020 | 2017-2020 |
| 0596870X | NA                  | NA                  | Université Lille Nord de France | 2016-2018 | 2013-2018 | 2015-2018 |

#### Grenoble

| UAI      | etab.21                   | etab.20                   | etab.19                      | ens       | etu       | fin       |
|:---------|:--------------------------|:--------------------------|:-----------------------------|:----------|:----------|:----------|
| 0383546Y | Université Grenoble Alpes | Université Grenoble Alpes | NA                           | 2019-2019 | 2019-2020 | 2019-2020 |
| 0383412C | NA                        | NA                        | Université Grenoble Alpes    | NA        | 2009-2018 | 2015-2018 |
| 0383493R | NA                        | NA                        | Université de Grenoble Alpes | 2015-2018 | 2015-2018 | 2015-2018 |

</details>

### Recherche de correspondances dans les établissements hors `etab.x`

#### Double UAIS

<details>
<summary>
Voir les données
</summary>

| doubleUAI         | etab.ens                             | ens       | etab.etu                              | etu       | etab.fin | fin | UAI      | etab.21 | etab.20 | etab.19                               |
|:------------------|:-------------------------------------|:----------|:--------------------------------------|:----------|:---------|:----|:---------|:--------|:--------|:--------------------------------------|
| 0772502B;0932056E | Université Paris-Est Marne-la-Vallée | 2010-2018 | Université Paris-Est Marne-la-Vallée  | 2006-2018 | NA       | NA  | 0772502B | NA      | NA      | Université Paris-Est Marne-la-Vallée  |
| 0772502B;0932056E | Université Paris-Est Marne-la-Vallée | 2010-2018 | Université Paris-Est Marne-la-Vallée  | 2006-2018 | NA       | NA  | 0932056E | NA      | NA      | NA                                    |
| 0912423P;0940607Z | Université Paris-Saclay              | 2019-2019 | École normale supérieure Paris-Saclay | 2006-2018 | NA       | NA  | 0912423P | NA      | NA      | NA                                    |
| 0912423P;0940607Z | Université Paris-Saclay              | 2019-2019 | École normale supérieure Paris-Saclay | 2006-2018 | NA       | NA  | 0940607Z | NA      | NA      | École normale supérieure Paris-Saclay |

</details>

#### Autres UAIs

<details>
<summary>
Voir les données
</summary>

| UAI      | etab.ens                                                    | ens       | etab.etu                                         | etu       | etab.fin                                                    | fin       |
|:---------|:------------------------------------------------------------|:----------|:-------------------------------------------------|:----------|:------------------------------------------------------------|:----------|
| 0331764N | Université Bordeaux 1 Sciences et Technologies              | 2010-2012 | Université Bordeaux 1 Sciences et Technologies   | 2006-2012 | Université BORDEAUX 1 - SCIENCES TECHNOLOGIES               | 2009-2012 |
| 0331765P | Université Bordeaux-Segalen                                 | 2010-2012 | Université Bordeaux-Segalen                      | 2006-2012 | Université BORDEAUX 2 - VICTOR SEGALEN                      | 2009-2012 |
| 0332929E | Université Montesquieu Bordeaux IV                          | 2010-2012 | Université Montesquieu Bordeaux IV               | 2006-2012 | Université BORDEAUX 4 - MONTESQUIEU                         | 2009-2012 |
| 0341087X | Université Montpellier-I                                    | 2010-2013 | Université Montpellier-I                         | 2006-2013 | Université MONTPELLIER 1                                    | 2009-2013 |
| 0341088Y | Université Montpellier 2 - Sciences techniques du Languedoc | 2010-2013 | Montpellier 2 - Sciences techniques du Languedoc | 2006-2013 | Université MONTPELLIER 2 - SCIENCES TECHNIQUES DU LANGUEDOC | 2009-2013 |
| 0381838S | Université Joseph-Fourier                                   | 2010-2014 | Université Joseph-Fourier                        | 2006-2014 | Université GRENOBLE 1 - JOSEPH FOURIER                      | 2009-2014 |
| 0381839T | Université Pierre-Mendès-France - Grenoble                  | 2010-2014 | Université Pierre-Mendès-France - Grenoble       | 2006-2014 | Université GRENOBLE 2 - PIERRE MENDÈS FRANCE                | 2009-2014 |
| 0381840U | Université Stendhal                                         | 2010-2014 | Université Stendhal                              | 2006-2014 | Université GRENOBLE 3 - STENDHAL                            | 2009-2014 |
| 0541507V | Université Henri Poincaré                                   | 2010-2010 | Université Henri Poincaré                        | 2006-2010 | NA                                                          | NA        |
| 0541508W | Université Nancy-II                                         | 2010-2010 | Université Nancy-II                              | 2006-2010 | NA                                                          | NA        |
| 0572081C | Université de Metz                                          | 2010-2010 | Université de Metz                               | 2006-2010 | NA                                                          | NA        |
| 0593559Y | Université Lille 1 - Sciences technologies                  | 2010-2016 | Université Lille 1 - Sciences technologies       | 2006-2016 | Université LILLE 1 - SCIENCES TECHNOLOGIES                  | 2009-2016 |
| 0593560Z | Université Lille 2 - Droit et Santé                         | 2010-2016 | Université Lille 2 - Droit et Santé              | 2006-2016 | Université LILLE 2 - DROIT ET SANTÉ                         | 2009-2016 |
| 0593561A | Université Lille 3 - Charles-de-Gaulle                      | 2010-2016 | Université Lille 3 - Charles-de-Gaulle           | 2006-2016 | Université LILLE 3 - CHARLES-DE-GAULLE                      | 2009-2016 |
| 0631262E | Université d’Auvergne                                       | 2010-2015 | Université d’Auvergne                            | 2006-2015 | Université CLERMONT-FERRAND 1 - AUVERGNE                    | 2009-2015 |
| 0631525R | Université Blaise-Pascal                                    | 2010-2015 | Université Blaise-Pascal                         | 2006-2015 | Université CLERMONT-FERRAND 2 - BLAISE PASCAL               | 2010-2015 |
| 0751720M | Université Paris-Sorbonne                                   | 2010-2016 | Université Paris-Sorbonne                        | 2006-2016 | Université PARIS 4 - SORBONNE                               | 2009-2016 |
| 0751722P | Université Pierre-et-Marie-Curie                            | 2010-2016 | Université Pierre-et-Marie-Curie                 | 2006-2016 | Université PARIS 6 - PIERRE ET MARIE CURIE                  | 2009-2016 |
| 0131842G | NA                                                          | NA        | Université de Provence Aix-Marseille I           | 2006-2010 | NA                                                          | NA        |
| 0131843H | NA                                                          | NA        | Université de la Méditerranée Aix-Marseille II   | 2006-2010 | NA                                                          | NA        |
| 0132364Z | NA                                                          | NA        | Université Paul-Cézanne Aix-Marseille III        | 2006-2010 | NA                                                          | NA        |
| 0671712X | NA                                                          | NA        | Université Louis-Pasteur                         | 2006-2007 | NA                                                          | NA        |
| 0671713Y | NA                                                          | NA        | Université Marc Bloch                            | 2006-2007 | NA                                                          | NA        |
| 0671778U | NA                                                          | NA        | Université Robert Schuman                        | 2006-2007 | NA                                                          | NA        |

</details>

### Toutes les valeurs manquantes pour les universités

<details>
<summary>
Voir les données
</summary>

| UAI      | etab.21                              | etab.20                              | etab.19                                                                     | ens | etu       | fin       |
|:---------|:-------------------------------------|:-------------------------------------|:----------------------------------------------------------------------------|:----|:----------|:----------|
| 0756036D | Université Paris sciences et lettres | Université Paris sciences et lettres | NA                                                                          | NA  | 2019-2020 | 2019-2020 |
| 0251985X | NA                                   | NA                                   | Université Bourgogne - Franche-Comté                                        | NA  | 2017-2020 | 2015-2020 |
| 0755700N | NA                                   | NA                                   | Université de recherche Paris sciences et lettres - PSL Research University | NA  | 2016-2018 | 2015-2018 |
| 0772710C | NA                                   | NA                                   | Université Paris-Est                                                        | NA  | 2008-2020 | 2015-2020 |
| 0755698L | NA                                   | NA                                   | Université Paris Lumières                                                   | NA  | 2016-2020 | 2016-2020 |
| 0861420B | NA                                   | NA                                   | Université confédérale Léonard de Vinci                                     | NA  | NA        | 2016-2019 |
| 0952199Z | NA                                   | NA                                   | Université Paris-Seine                                                      | NA  | NA        | 2017-2018 |
| 0333178A | NA                                   | NA                                   | Communauté d’universités et établissements d’Aquitaine                      | NA  | NA        | NA        |
| 0383412C | NA                                   | NA                                   | Université Grenoble Alpes                                                   | NA  | 2009-2018 | 2015-2018 |
| 0694094A | NA                                   | NA                                   | Université de Lyon                                                          | NA  | NA        | 2015-2019 |
| 0342255S | NA                                   | NA                                   | Languedoc-Roussillon Universités                                            | NA  | 2013-2018 | 2015-2018 |
| 0755598C | NA                                   | NA                                   | Université Sorbonne Paris Cité                                              | NA  | NA        | NA        |
| 0912330N | NA                                   | NA                                   | Université Paris-Saclay                                                     | NA  | 2016-2018 | 2018-2018 |
| 0142382N | NA                                   | NA                                   | Normandie Université                                                        | NA  | NA        | 2015-2019 |
| 0312758E | NA                                   | NA                                   | Université fédérale de Toulouse Midi-Pyrénées                               | NA  | NA        | 2015-2019 |
| 0352756F | NA                                   | NA                                   | Université Bretagne Loire                                                   | NA  | 2013-2016 | 2015-2018 |
| 0755581J | NA                                   | NA                                   | HESAM Université                                                            | NA  | NA        | 2015-2019 |
| 0772502B | NA                                   | NA                                   | Université Paris-Est Marne-la-Vallée                                        | NA  | NA        | 2009-2018 |

</details>

### Création manuelle des corrections

Ces correspondances sont construites manuellement et appliquées aux jeux
de données.

<details>
<summary>
Voir les données
</summary>

| Etablissement                | from     | to       | note                                                                     |
|:-----------------------------|:---------|:---------|:-------------------------------------------------------------------------|
|                              | 0440984F | 0442953W | Changement de statut de l’Université de Nantes au 1er janvier 2022       |
| PSL                          | 0755700N | 0756036D | Potentiel changement de périmètre en 2019                                |
| Université de Montpellier    | 0342321N | 0342490X | Changement de statut en 2021                                             |
| Université Clermont Auvergne | 0632035V | 0632084Y | Changement de statut en 2020                                             |
| Université de Lille          | 0597065J | 0597239Y | Changement de statut en 2020 et possibles changements de périmètre avant |
| Université de Grenoble Alpes | 0383493R | 0383546Y | Changement de statut en 2019 et possibles changements de périmètre avant |

</details>

### Vérification des données manquantes après correction

<details>
<summary>
Voir les données
</summary>

| UAI      | etab.21                              | ens | etu       | fin       |
|:---------|:-------------------------------------|:----|:----------|:----------|
| 0756036D | Université Paris sciences et lettres | NA  | 2016-2020 | 2015-2020 |

</details>

### Toutes les universités `etab.21` après correction

<details>
<summary>
Voir les données
</summary>

| UAI      | etab.21                                            | ens       | etu       | fin       |
|:---------|:---------------------------------------------------|:----------|:----------|:----------|
| 0751717J | Université Paris 1 - Panthéon Sorbonne             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0755890V | Sorbonne Université                                | 2017-2019 | 2017-2020 | 2017-2020 |
| 0333298F | Université de Bordeaux                             | 2012-2019 | 2013-2020 | 2012-2020 |
| 0772894C | Université Gustave Eiffel                          | 2019-2019 | 2019-2020 | 2019-2020 |
| 0860856N | Université de Poitiers                             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0623957P | Université d’Artois                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0931827F | Université Paris 8 - Vincennes - Saint-Denis       | 2010-2019 | 2006-2020 | 2009-2020 |
| 0171463Y | La Rochelle Université                             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0062205P | Université Côte d’Azur                             | 2019-2019 | 2019-2020 | 2019-2020 |
| 0762762P | Université Le Havre Normandie                      | 2010-2019 | 2006-2020 | 2009-2020 |
| 0421095M | Université Jean Monnet                             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0350937D | Université Rennes 2                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0350936C | Université de Rennes 1                             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0331766R | Université Bordeaux Montaigne                      | 2010-2019 | 2006-2020 | 2009-2020 |
| 0341089Z | Université Paul-Valéry - Montpellier 3             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0755976N | Université de Paris                                | 2019-2019 | 2019-2020 | 2019-2020 |
| 0640251A | Université de Pau et des Pays de l’Adour           | 2010-2019 | 2006-2020 | 2009-2020 |
| 0601223D | Université de technologie de Compiègne             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0134009M | Aix-Marseille Université                           | 2010-2019 | 2011-2020 | 2010-2020 |
| 0681166Y | Université de Haute-Alsace                         | 2010-2019 | 2006-2020 | 2009-2020 |
| 9740478B | Université de La Réunion                           | 2010-2019 | 2006-2020 | 2009-2020 |
| 0311384L | Université Toulouse III - Paul Sabatier            | 2010-2019 | 2006-2020 | 2009-2020 |
| 0450855K | Université d’Orléans                               | 2010-2019 | 2006-2020 | 2009-2020 |
| 0952259P | CY Cergy Paris Université                          | 2019-2019 | 2019-2020 | 2019-2020 |
| 9840349G | Université de la Polynésie Française               | 2010-2019 | 2006-2020 | 2009-2020 |
| 0751718K | Université Panthéon-Assas                          | 2010-2019 | 2006-2020 | 2009-2020 |
| 0921204J | Université Paris Nanterre                          | 2010-2019 | 2006-2020 | 2009-2020 |
| 0730858L | Université Savoie Mont Blanc                       | 2010-2019 | 2006-2020 | 2009-2020 |
| 0720916E | Le Mans Université                                 | 2010-2019 | 2006-2020 | 2009-2020 |
| 0141408E | Université de Caen Normandie                       | 2010-2019 | 2006-2020 | 2009-2020 |
| 0673021V | Université de Strasbourg                           | 2010-2019 | 2008-2020 | 2009-2020 |
| 0101060Y | Université de technologie de Troyes                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0911975C | Université d’Évry-Val-d’Essonne                    | 2010-2019 | 2006-2020 | 2009-2020 |
| 0383546Y | Université Grenoble Alpes                          | 2015-2019 | 2015-2020 | 2015-2020 |
| 0511296G | Université de Reims Champagne-Ardenne              | 2010-2019 | 2006-2020 | 2009-2020 |
| 0830766G | Université de Toulon                               | 2010-2019 | 2006-2020 | 2009-2020 |
| 9730429D | Université de Guyane                               | 2015-2019 | 2014-2020 | 2014-2020 |
| 0781944P | Université de Versailles Saint-Quentin-en-Yvelines | 2010-2019 | 2006-2020 | 2009-2020 |
| 0595964M | Université du Littoral Côte d’Opale                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0442953W | Nantes Université                                  | 2010-2019 | 2006-2020 | 2009-2020 |
| 0251215K | Université de Franche-Comté                        | 2010-2019 | 2006-2020 | 2009-2020 |
| 0542493S | Université de Lorraine                             | 2011-2019 | 2011-2020 | 2011-2020 |
| 0597132G | Université Polytechnique Hauts-de-France           | 2019-2019 | 2019-2020 | 2019-2020 |
| 0751719L | Université Sorbonne Nouvelle - Paris 3             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0311382J | Université Toulouse Capitole                       | 2010-2019 | 2006-2020 | 2009-2020 |
| 0801344B | Université de Picardie Jules-Verne                 | 2010-2019 | 2006-2020 | 2009-2020 |
| 0756036D | Université Paris sciences et lettres               | NA        | 2016-2020 | 2015-2020 |
| 0900424X | Université de technologie de Belfort-Montbéliard   | 2010-2019 | 2006-2020 | 2009-2020 |
| 0941111X | Université Paris-Est Créteil                       | 2010-2019 | 2006-2020 | 2009-2020 |
| 0342490X | Université de Montpellier                          | 2012-2019 | 2014-2020 | 2013-2020 |
| 0301687W | Université de Nîmes                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0931238R | Université Sorbonne Paris Nord                     | 2010-2019 | 2006-2020 | 2009-2020 |
| 0691774D | Université Claude Bernard - Lyon 1                 | 2010-2019 | 2006-2020 | 2009-2020 |
| 0632084Y | Université Clermont Auvergne                       | 2016-2019 | 2016-2020 | 2015-2020 |
| 7200664J | Université de Corse Pasquale Paoli                 | 2010-2019 | 2006-2020 | 2009-2020 |
| 0660437S | Université de Perpignan Via Domitia                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0912408Y | Université Paris-Saclay                            | 2019-2019 | 2019-2020 | 2019-2020 |
| 9830445S | Université de la Nouvelle-Calédonie                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0870669E | Université de Limoges                              | 2010-2019 | 2006-2020 | 2009-2020 |
| 0370800U | Université de Tours                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 9710585J | Université des Antilles                            | 2010-2019 | 2006-2020 | 2009-2020 |
| 0691775E | Université Lumière - Lyon 2                        | 2010-2019 | 2006-2020 | 2009-2020 |
| 0692437Z | Université Jean Moulin - Lyon 3                    | 2010-2019 | 2006-2020 | 2009-2020 |
| 0840685N | Avignon Université                                 | 2010-2019 | 2006-2020 | 2009-2020 |
| 0490970N | Université d’Angers                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0211237F | Université de Bourgogne                            | 2010-2019 | 2006-2020 | 2009-2020 |
| 0561718N | Université Bretagne Sud                            | 2010-2019 | 2006-2020 | 2009-2020 |
| 0761904G | Université de Rouen Normandie                      | 2010-2019 | 2006-2020 | 2009-2020 |
| 0290346U | Université de Bretagne Occidentale                 | 2010-2019 | 2006-2020 | 2009-2020 |
| 0311383K | Université Toulouse - Jean Jaurès                  | 2010-2019 | 2006-2020 | 2009-2020 |
| 0597239Y | Université de Lille                                | 2017-2019 | 2017-2020 | 2017-2020 |

</details>

## Non université données complètes

Etablissements non université présents dans etab.21 et les trois jeux de
données.

<details>
<summary>
Voir les données
</summary>

| UAI      | etab.21                                                                       | etab.20                                                                       | etab.19                                                                       | ens       | etu       | fin       |
|:---------|:------------------------------------------------------------------------------|:------------------------------------------------------------------------------|:------------------------------------------------------------------------------|:----------|:----------|:----------|
| 0753237L | Arts et Métiers Sciences et Technologies                                      | Arts et métiers sciences et technologies                                      | École nationale supérieure d’arts et métiers                                  | 2010-2019 | 2006-2020 | 2009-2020 |
| 0333232J | Bordeaux INP                                                                  | Bordeaux INP                                                                  | Institut polytechnique de Bordeaux                                            | 2010-2019 | 2009-2020 | 2009-2020 |
| 0690187D | Centrale Lyon                                                                 | Centrale Lyon                                                                 | École centrale de Lyon                                                        | 2010-2019 | 2006-2020 | 2009-2020 |
| 0133774G | Centrale Marseille                                                            | Centrale Marseille                                                            | École centrale de Marseille                                                   | 2010-2019 | 2006-2020 | 2009-2020 |
| 9760358K | Centre universitaire de Mayotte                                               | Centre Universitaire de Mayotte                                               | Centre Universitaire de Mayotte                                               | 2012-2019 | 2012-2020 | 2018-2020 |
| 0350095N | École des hautes études en santé publique                                     | École des hautes études en santé publique                                     | École des hautes études en santé publique                                     | 2010-2019 | 2006-2020 | 2015-2020 |
| 0753742K | École des hautes études en sciences sociales                                  | École des hautes études en sciences sociales                                  | École des hautes études en sciences sociales                                  | 2010-2019 | 2006-2020 | 2009-2020 |
| 0290119X | École nationale d’ingénieurs de Brest                                         | École nationale d’ingénieurs de Brest                                         | École nationale d’ingénieurs de Brest                                         | 2010-2019 | 2006-2020 | 2009-2020 |
| 0650048Z | École nationale d’ingénieurs de Tarbes                                        | École nationale d’ingénieurs de Tarbes                                        | École nationale d’ingénieurs de Tarbes                                        | 2010-2019 | 2006-2020 | 2009-2020 |
| 0912266U | École nationale supérieure d’informatique pour l’industrie et l’entreprise    | École nationale supérieure d’informatique pour l’industrie et l’entreprise    | École nationale supérieure d’informatique pour l’industrie et l’entreprise    | 2010-2019 | 2008-2020 | 2009-2020 |
| 0141720U | École nationale supérieure d’ingénieurs de Caen                               | École nationale supérieure d’ingénieurs de Caen                               | École nationale supérieure d’ingénieurs de Caen                               | 2010-2019 | 2006-2020 | 2009-2020 |
| 0350077U | École nationale supérieure de chimie de Rennes                                | École nationale supérieure de chimie de Rennes                                | École nationale supérieure de chimie de Rennes                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0951376E | École nationale supérieure de l’électronique et de ses applications de Cergy  | École nationale supérieure de l’électronique et de ses applications de Cergy  | École nationale supérieure de l’électronique et de ses applications de Cergy  | 2010-2019 | 2006-2020 | 2009-2020 |
| 0860073M | École nationale supérieure de mécanique et d’aérotechnique de Poitiers        | École nationale supérieure de mécanique et d’aérotechnique de Poitiers        | École nationale supérieure de mécanique et d’aérotechnique de Poitiers        | 2010-2019 | 2006-2020 | 2009-2020 |
| 0250082D | École nationale supérieure de mécanique et des microtechniques                | École nationale supérieure de mécanique et des microtechniques                | École nationale supérieure de mécanique et des microtechniques                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0692459Y | École nationale supérieure des sciences de l’information et des bibliothèques | École nationale supérieure des sciences de l’information et des bibliothèques | École nationale supérieure des sciences de l’information et des bibliothèques | 2010-2019 | 2006-2020 | 2009-2020 |
| 0694123G | École normale supérieure de Lyon                                              | École normale supérieure de Lyon                                              | École normale supérieure de Lyon                                              | 2010-2019 | 2009-2020 | 2009-2020 |
| 0352440M | École normale supérieure de Rennes                                            | École normale supérieure de Rennes                                            | École normale supérieure de Rennes                                            | 2013-2019 | 2013-2020 | 2013-2020 |
| 0753364Z | IAE Paris - Sorbonne Business School                                          | Institut d’administration des entreprises de Paris                            | Institut d’administration des entreprises de Paris                            | 2010-2019 | 2006-2020 | 2009-2020 |
| 0753488J | Institut national des langues et civilisations orientales                     | Institut national des langues et civilisations orientales                     | Institut national des langues et civilisations orientales                     | 2010-2019 | 2006-2020 | 2009-2020 |
| 0690192J | Institut national des sciences appliquées de Lyon                             | Institut national des sciences appliquées de Lyon                             | Institut national des sciences appliquées de Lyon                             | 2010-2019 | 2006-2020 | 2009-2020 |
| 0350097R | Institut national des sciences appliquées de Rennes                           | Institut national des sciences appliquées de Rennes                           | Institut national des sciences appliquées de Rennes                           | 2010-2019 | 2006-2020 | 2009-2020 |
| 0760165S | Institut national des sciences appliquées de Rouen Normandie                  | Institut national des sciences appliquées de Rouen                            | Institut national des sciences appliquées de Rouen                            | 2010-2019 | 2006-2020 | 2009-2020 |
| 0670190T | Institut national des sciences appliquées de Strasbourg                       | Institut national des sciences appliquées de Strasbourg                       | Institut national des sciences appliquées de Strasbourg                       | 2010-2019 | 2006-2020 | 2009-2020 |
| 0310152X | Institut national des sciences appliquées de Toulouse                         | Institut national des sciences appliquées de Toulouse                         | Institut national des sciences appliquées de Toulouse                         | 2010-2019 | 2006-2020 | 2009-2020 |
| 0811293R | Institut national universitaire Jean-François Champollion                     | Institut national universitaire Jean-François Champollion                     | Institut national universitaire Jean-François Champollion                     | 2010-2019 | 2006-2020 | 2009-2020 |
| 0930603A | ISAE-Supméca                                                                  | Institut supérieur de mécanique de Paris                                      | Institut supérieur de mécanique de Paris                                      | 2010-2019 | 2006-2020 | 2009-2020 |
| 0753494R | Muséum national d’histoire naturelle                                          | Muséum national d’histoire naturelle                                          | Muséum national d’histoire naturelle                                          | 2010-2019 | 2006-2020 | 2009-2020 |
| 0130221V | Sciences Po Aix                                                               | Institut d’études politiques d’Aix-en-Provence                                | Institut d’études politiques d’Aix-en-Provence                                | 2010-2019 | 2006-2020 | 2009-2020 |
| 0330192E | Sciences Po Bordeaux                                                          | Institut d’études politiques de Bordeaux                                      | Institut d’études politiques de Bordeaux                                      | 2010-2019 | 2006-2020 | 2009-2020 |
| 0690173N | Sciences Po Lyon                                                              | Institut d’études politiques de Lyon                                          | Institut d’études politiques de Lyon                                          | 2010-2019 | 2006-2020 | 2009-2020 |
| 0352317D | Sciences Po Rennes                                                            | Institut d’études politiques de Rennes                                        | Institut d’études politiques de Rennes                                        | 2010-2019 | 2006-2020 | 2009-2020 |
| 0310133B | Sciences Po Toulouse                                                          | Institut d’études politiques de Toulouse                                      | Institut d’études politiques de Toulouse                                      | 2010-2019 | 2006-2020 | 2009-2020 |
| 0311381H | Toulouse INP                                                                  | Institut national polytechnique de Toulouse                                   | Institut national polytechnique de Toulouse                                   | 2010-2019 | 2006-2020 | 2009-2020 |

</details>

## Wikidata manquants

<details>
<summary>
Voir les données
</summary>

| UAI      | Etablissement                                                    | url.wikidata |
|:---------|:-----------------------------------------------------------------|:-------------|
| 0597165T | Junia                                                            | NA           |
| NA       | Groupe Institut catholique d’arts et métiers                     | NA           |
| 0900362E | École supérieure des technologies et des affaires de Belfort     | NA           |
| 0942283W | Centre des hautes études de la construction                      | NA           |
| 0511556P | Institut régional du travail social de Champagne-Ardennes        | NA           |
| 0492062A | Institut des relations publiques et de la communication d’Angers | NA           |
| 0442953W | Nantes Université                                                | NA           |
| 0597132G | Université Polytechnique Hauts-de-France                         | NA           |
| 0342490X | Université de Montpellier                                        | NA           |
| 0632084Y | Université Clermont Auvergne                                     | NA           |
| 0597239Y | Université de Lille                                              | NA           |

</details>

Correction manuelle :

<details>
<summary>
Voir les données
</summary>

| UAI      | url.wikidata                               |
|:---------|:-------------------------------------------|
| 0442953W | <https://www.wikidata.org/entity/Q259388>  |
| 0597132G | <https://www.wikidata.org/entity/Q1548539> |
| 0342490X | <https://www.wikidata.org/entity/Q776223>  |
| 0632084Y | <https://www.wikidata.org/entity/Q1319786> |
| 0597239Y | <https://www.wikidata.org/entity/Q3551621> |

</details>

## Sigles manquants pour les universités

### Sigles récupérables sur wikidata

<details>
<summary>
Voir les données
</summary>

| UAI      | Etablissement                                | Sigle                               |
|:---------|:---------------------------------------------|:------------------------------------|
| 1340004B | Casa de Velázquez de Madrid                  | Casa Velasquez                      |
| 0171427J | Excelia Group                                | Excelia                             |
| 0340137P | MBS                                          | MBS                                 |
| 0590350K | Edhec Business School                        | EDHEC                               |
| 0721484X | ISMANS                                       | ISMANS                              |
| 0752792C | IPAG Business School                         | IPAG Business School                |
| 0760167U | Neoma Business School                        | Neoma BS                            |
| 0930603A | ISAE-Supméca                                 | supméca                             |
| 0130230E | Ecole de l’air et de l’espace                | École de l’Air                      |
| 0542493S | Université de Lorraine                       | université de Lorraine              |
| 0753480A | Collège de France                            | Collège de France                   |
| 0171463Y | La Rochelle Université                       | La Rochelle Université              |
| 0311384L | Université Toulouse III - Paul Sabatier      | Université Toulouse III             |
| 0342490X | Université de Montpellier                    | Université de Montpellier           |
| 0350936C | Université de Rennes 1                       | UR1                                 |
| 0350937D | Université Rennes 2                          | Rennes 2                            |
| 0370800U | Université de Tours                          | université de Tours                 |
| 0442953W | Nantes Université                            | UN                                  |
| 0450855K | Université d’Orléans                         | Université d’Orléans                |
| 0490970N | Université d’Angers                          | U. Angers                           |
| 0597239Y | Université de Lille                          | UDL                                 |
| 0623957P | Université d’Artois                          | U. Artois                           |
| 0673021V | Université de Strasbourg                     | Unistra                             |
| 0691774D | Université Claude Bernard - Lyon 1           | UCBL                                |
| 0691775E | Université Lumière - Lyon 2                  | Lyon 2                              |
| 0692437Z | Université Jean Moulin - Lyon 3              | université Lyon 3                   |
| 0751718K | Université Panthéon-Assas                    | Assas                               |
| 0751719L | Université Sorbonne Nouvelle - Paris 3       | Paris 3                             |
| 0755976N | Université de Paris                          | U-Paris                             |
| 0762762P | Université Le Havre Normandie                | ULH                                 |
| 0830766G | Université de Toulon                         | Ustv                                |
| 0860856N | Université de Poitiers                       | UnivPoitiers                        |
| 0870669E | Université de Limoges                        | Unilim                              |
| 0912408Y | Université Paris-Saclay                      | UPSa                                |
| 0921204J | Université Paris Nanterre                    | université Paris X                  |
| 0931238R | Université Sorbonne Paris Nord               | UP13                                |
| 0931827F | Université Paris 8 - Vincennes - Saint-Denis | UP8                                 |
| 0952259P | CY Cergy Paris Université                    | UCP                                 |
| 7200664J | Université de Corse Pasquale Paoli           | université de Corse                 |
| 9710585J | Université des Antilles                      | université des Antilles             |
| 9730429D | Université de Guyane                         | Université de Guyane                |
| 9740478B | Université de La Réunion                     | UFOI                                |
| 9830445S | Université de la Nouvelle-Calédonie          | Université de la Nouvelle-Calédonie |

</details>

### Sigles toujours manquants

<details>
<summary>
Voir les données
</summary>

| UAI      | Etablissement | Sigle | url.wikidata |
|:---------|:--------------|:------|:-------------|
| 0597165T | Junia         | NA    | NA           |

</details>

Correction manuelle :

``` r
alias.wikidata <- bind_rows(alias.wikidata, c(UAI="0597165T",Etablissement="Junia",Sigle="Junia"))
```

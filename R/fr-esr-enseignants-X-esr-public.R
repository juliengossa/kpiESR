
# https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/information/?disjunctive.annee
# Version du 28 octobre 2020
#
# [1] "Rentrée"                   "Année.universitaire"       "Établissement"             "Type.établissement"       
# [5] "Région"                    "Académie"                  "Sexe"                      "Categorie.de.personnels"  
# [9] "Grandes.disciplines"       "Groupes.CNU"               "Sections.CNU"              "ID.académie"              
# [13] "ID.région"                 "Identifiant.établissement" "Code.categorie.personnels" "Code.groupe.CNU"          
# [17] "Code.grande.discipline"    "effectif"                  "code_section_cnu"          "geolocalisation"          
# [21] "id_Paysage"                "classe_age3"               "quotite"        

# https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-nonpermanents-esr-public/information/
# Version du 29 avril 2020
#
# [1] "Rentrée"                         "Année.universitaire"            
# [3] "Établissement"                   "Type.établissement"             
# [5] "Région"                          "Académie"                       
# [7] "Sexe"                            "Categorie.de.personnels"        
# [9] "Grande.discipline"               "Groupes.CNU"                    
# [11] "Identifiant.établissement"       "ID.région"                      
# [13] "ID.académie"                     "Code.groupe.CNU"                
# [15] "Code.grande.discipline"          "EFFECTIF"                       
# [17] "geolocalisation"                 "code.categorie.personnels"      
# [19] "quotite"                         "categorie.personnels.regroupées"

kpiesr_read.ens <- function() {

  ens.tit <- read.csv2("dataESR/fr-esr-enseignants-titulaires-esr-public.csv") %>% 
    transmute(
      UAI = etablissement_id_uai,
      Etablissement = Établissement,
      Rentrée,
      Catégorie = case_when(
        Code.categorie.personnels == "AM2D" ~ "AM2D",
        TRUE ~ "EC"),
      Discipline = Code.grande.discipline,
      Effectif = effectif)

  ens.np <- read.csv2("dataESR/fr-esr-enseignants-nonpermanents-esr-public.csv")  %>% 
    transmute(
      UAI = etablissement_id_uai,
      Etablissement = Établissement,
      Rentrée,
      Catégorie = case_when(
        code.categorie.personnels %in% c("LRU","MCF ASS-INV", "PR ASS-INV") ~ "LRU_Associés",
        code.categorie.personnels %in% c("ATER", "DOCT AVEC ENS", "DOCT SANS ENS") ~ "Doc_ATER",
        TRUE ~ "Autres"),
      Discipline = Code.grande.discipline,
      Effectif)

  ens <- bind_rows(ens.tit,ens.np) %>%
    group_by(UAI, Etablissement, Rentrée, Catégorie) %>%
    summarise(Effectif = sum(Effectif,na.rm = TRUE)) %>%
    ungroup() %>%
    pivot_wider(names_from = Catégorie, values_from = Effectif, values_fill = list(Effectif=NA)) %>%
    mutate(
      UAI,
      Etablissement,
      Rentrée = as.factor(Rentrée),
      kpi.ENS.P.effectif      = EC+AM2D+Doc_ATER+LRU_Associés+Autres,
      kpi.ENS.S.titulaires    = EC+AM2D,
      kpi.ENS.S.ECtitulaires  = EC,
      kpi.ENS.S.DocATER       = Doc_ATER,
      kpi.ENS.S.LRU           = LRU_Associés,
    ) %>%
    arrange(UAI,Rentrée)

  return(ens)
}


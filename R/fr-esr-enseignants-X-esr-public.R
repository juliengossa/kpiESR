
# https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/information/?disjunctive.annee
# Version du 31 octobre 2023
#
# [1] "Rentrée"                                                    "Établissement"                                             
# [3] "Type.établissement"                                         "Sexe"                                                      
# [5] "Categorie.de.personnels"                                    "Grandes.disciplines"                                       
# [7] "Groupes.CNU"                                                "Sections.CNU"                                              
# [9] "Code.categorie.personnels"                                  "Code.groupe.CNU"                                           
# [11] "Code.grande.discipline"                                     "effectif"                                                  
# [13] "code_section_cnu"                                           "Année.universitaire"                                       
# [15] "etablissement_id_paysage"                                   "etablissement_compos_id_paysage"                           
# [17] "Décomposition.pour.les.universités.à.statuts.expérimentaux" "etablissement_code_academie"                               
# [19] "Académie"                                                   "etablissement_code_region"                                 
# [21] "Région"                                                     "etablissement_coordonnees"                                 
# [23] "etablissement_id_uai_source"                                "etablissement_id_paysage_actuel"                           
# [25] "etablissement_actuel_lib"                                   "classe_age3"                                               
# [27] "quotite"

# https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-nonpermanents-esr-public/information/
# Version du 31 octobre 2023
#
# [1] "Rentrée"                                                "Établissement"                                         
# [3] "Type.établissement"                                     "Sexe"                                                  
# [5] "Categorie.de.personnels"                                "Grande.discipline"                                     
# [7] "Groupes.CNU"                                            "Code.groupe.CNU"                                       
# [9] "Code.grande.discipline"                                 "effectif"                                              
# [11] "Code.categorie.personnels"                              "Année.universitaire"                                   
# [13] "Décomposition.des.universitéss.à.statuts.expérimentaux" "etablissement_id_paysage"                              
# [15] "etablissement_compos_id_paysage"                        "etablissement_id_uai"                                  
# [17] "code_academie"                                          "Académie"                                              
# [19] "etablissement_code_region"                              "Région"                                                
# [21] "etablissement_coordonnees"                              "etablissement_id_uai_source"                           
# [23] "etablissement_id_paysage_actuel"                        "Établissement.actuel"                                  
# [25] "Categories.personnels.regroupées"                       "Quotité"                                               
# [27] "Classes.d.âge"                

kpiesr_read.ens <- function(pidfix=list("x"="x")) {

  ens.tit <- read.csv2("dataESR/fr-esr-enseignants-titulaires-esr-public.csv", na.string = "") %>% 
    transmute(
      pid = recode(etablissement_id_paysage_actuel,!!!pidfix),
      Rentrée,
      Catégorie = case_when(
        Code.categorie.personnels == "AM2D" ~ "AM2D",
        TRUE ~ "EC"),
      #Discipline = Code.grande.discipline,
      Effectif = effectif) %>%
    group_by(pid, Rentrée, Catégorie) %>%
    summarise(Effectif = sum(Effectif,na.rm = TRUE)) %>%
    ungroup() %>%
    pivot_wider(names_from = Catégorie, values_from = Effectif, values_fill = list(Effectif=0)) 

  ens.np <- read.csv2("dataESR/fr-esr-enseignants-nonpermanents-esr-public.csv", na.string = "")  %>% 
  transmute(
    pid = recode(etablissement_id_paysage_actuel,!!!pidfix),
    Rentrée,
    Catégorie = case_when(
      Code.categorie.personnels %in% c("LRU","MCF INV","MCF ASS", "PR INV","PR ASS", "INV (corps NR)", "ASS (corps NR)") ~ "EC_contractuel",
      Code.categorie.personnels %in% c("CONT 2D") ~ "AM2D_contractuel",
      Code.categorie.personnels %in% c("ATER") ~ "ATER",
      Code.categorie.personnels %in% c("DOCT AVEC ENS","DOCT SANS ENS") ~ "Doc",
      TRUE ~ "Autres"),
    #Discipline = Code.grande.discipline,
    effectif) %>%
    group_by(pid, Rentrée, Catégorie) %>%
    summarise(Effectif = sum(effectif,na.rm = TRUE)) %>%
    ungroup() %>%
    pivot_wider(names_from = Catégorie, values_from = Effectif, values_fill = list(Effectif=0))

  ens <- full_join(ens.tit,ens.np) %>%
    #bind_rows(ens.tit,ens.np) 
    #rowwise() %>%
    transmute(
      pid,
      Rentrée,
      kpi.ENS.P.effectif      = EC + AM2D + EC_contractuel + AM2D_contractuel + Doc + ATER + Autres,
      kpi.ENS.S.titulaires    = EC + AM2D,
      kpi.ENS.S.EC            = EC + EC_contractuel,
      kpi.ENS.S.DocATER       = Doc + ATER,
      kpi.ENS.S.contractuels  = EC_contractuel + AM2D_contractuel,
    ) %>%
    arrange(pid,Rentrée) %>%
    ungroup()

  return(ens)
}

# ens <- kpiesr_read.ens()

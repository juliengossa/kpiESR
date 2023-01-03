# https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-personnels-biatss-etablissements-publics
# 
# [1] "Année"                           "Année.universitaire"             "Type.de.personnel"              
# [4] "etablissement_id_paysage"        "Etablissement"                   "etablissement_compos_id_paysage"
# [7] "Décomposition.des.universités"   "etablissement_id_uai"            "etablissement_code_region"      
# [10] "Région"                          "etablissement_code_academie"     "Académie"                       
# [13] "etablissement_coordonnees"       "Catégorie"                       "code_corps"                     
# [16] "Corps"                           "Filière"                         "etablissement_id_uai_source"    
# [19] "etablissement_type"              "etablissement_id_paysage_actuel" "etablissement_actuel_lib"       
# [22] "Effectif"                        "effectif_femmes"                 "effectif_hommes"                
# [25] "classe_age3"                     "code_filiere"                    "code_bap"                       
# [28] "BAP"       

kpiesr_read.bia <- function(pidfix=list("x"="x")) {
  biatss <- read.csv2("dataESR/fr-esr-personnels-biatss-etablissements-publics.csv", na.string = "") %>%
    mutate(effectif = ifelse(Effectif == effectif_femmes + effectif_hommes, Effectif, NA))
  
  w <- biatss %>% filter(effectif_femmes + effectif_hommes != Effectif)
  if (nrow(w) > 0) warning("Erreur d'intégrité des données BIATSS : effectif_femmes + effectif_hommes != Effectif", readr::format_csv2(w))
  
  total <- biatss %>% 
    group_by(
      pid = recode(etablissement_id_paysage_actuel,!!!pidfix),
      Rentrée = Année ) %>%
    summarise(kpi.BIA.P.effectif = sum(effectif))

  categorie <- biatss %>% 
    group_by(
      pid = recode(etablissement_id_paysage_actuel,!!!pidfix),
      Rentrée = Année, 
      Catégorie ) %>%
    summarise(effectif = sum(effectif, na.rm=TRUE)) %>%
    pivot_wider(names_from = Catégorie,
                names_prefix = "kpi.BIA.S.",
                values_from = effectif, 
                values_fill = list(effectif=0)
                )

  titularite <- biatss %>% 
    group_by(
      pid = recode(etablissement_id_paysage_actuel,!!!pidfix),
      Rentrée = Année, 
      Type.de.personnel ) %>%
    summarise(effectif = sum(effectif, na.rm=TRUE)) %>%
    pivot_wider(names_from = Type.de.personnel, 
                #names_prefix = "kpi.BIA.S.",
                values_from = effectif, 
                #values_fill = list(effectif=0)
    ) %>%
    mutate(kpi.BIA.S.titulaires = ifelse(is.na(contractuels),NA,titulaires)) %>%
    select(-contractuels,-titulaires)
  
  full_join(total,categorie) %>% full_join(titularite) %>%
    ungroup() %>%
    arrange(pid,Rentrée)
  
} 

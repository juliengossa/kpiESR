
# https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/information/?disjunctive.annee
# Version du 2 aout 2022
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
# Version du 2 aout 2022
#
# [1] "Rentrée"                                                    "Établissement"                                             
# [3] "Type.établissement"                                         "Sexe"                                                      
# [5] "Categorie.de.personnels"                                    "Grandes.disciplines"                                       
# [7] "Groupes.CNU"                                                "Sections.CNU"                                              
# [9] "Code.categorie.personnels"                                  "Code.groupe.CNU"                                           
# [11] "Code.grande.discipline"                                     "effectif"                                                  
# [13] "code_section_cnu"                                           "Année.universitaire"                                       
# [15] "etablissement_id_paysage"                                   "etablissement_compos_id_paysage"                           
# [17] "Décomposition.pour.les.universités.à.statuts.expérimentaux" "etablissement_id_uai"                                      
# [19] "etablissement_code_academie"                                "Académie"                                                  
# [21] "etablissement_code_region"                                  "Région"                                                    
# [23] "etablissement_coordonnees"                                  "etablissement_id_uai_source"                               
# [25] "etablissement_id_paysage_actuel"                            "etablissement_actuel_lib"                                  
# [27] "classe_age3"                                                "quotite"      


kpiesr_read.ens <- function(composantes = FALSE) {

  ens.tit <- read.csv2("dataESR/fr-esr-enseignants-titulaires-esr-public.csv", na.string = "") %>% 
    { if(composantes) 
        mutate(.,
         etablissement_id_uai = etablissement_id_uai_source,
         Établissement = ifelse(!is.na(Décomposition.pour.les.universités.à.statuts.expérimentaux),
                                Décomposition.pour.les.universités.à.statuts.expérimentaux,
                                Établissement),
          )
      else . } %>%
    transmute(
      UAI = etablissement_id_uai,
      Etablissement = Établissement,
      Type = Type.établissement,
      Rentrée,
      Catégorie = case_when(
        Code.categorie.personnels == "AM2D" ~ "AM2D",
        TRUE ~ "EC"),
      #Discipline = Code.grande.discipline,
      Effectif = effectif) %>%
    group_by(UAI, Etablissement, Type, Rentrée, Catégorie) %>%
    summarise(Effectif = sum(Effectif,na.rm = TRUE)) %>%
    ungroup() %>%
    pivot_wider(names_from = Catégorie, values_from = Effectif, values_fill = list(Effectif=0)) 

  ens.np <- read.csv2("dataESR/fr-esr-enseignants-nonpermanents-esr-public.csv", na.string = "")  %>% 
    { if(composantes) 
      mutate(.,
             etablissement_id_uai = etablissement_id_uai_source,
             Établissement = ifelse(!is.na(Décomposition.des.universitéss.à.statuts.expérimentaux),
                                    Décomposition.des.universitéss.à.statuts.expérimentaux,
                                    Établissement),
      )
      else . } %>%
  transmute(
    UAI = etablissement_id_uai,
    Etablissement = Établissement,
    Type = Type.établissement,
    Rentrée,
      Catégorie = case_when(
        code_categorie_persg %in% c("LRU","MCF ASS-INV", "PR ASS-INV", "ASS INV (corps NR)") ~ "EC_contractuel",
        code_categorie_persg %in% c("CONT 2D") ~ "AM2D_contractuel",
        code_categorie_persg %in% c("ATER") ~ "ATER",
        code_categorie_persg %in% c("DOCT AVEC ENS","DOCT SANS ENS") ~ "Doc",
        TRUE ~ "Autres"),
      #Discipline = Code.grande.discipline,
      effectif) %>%
    group_by(UAI, Etablissement, Type, Rentrée, Catégorie) %>%
    summarise(Effectif = sum(effectif,na.rm = TRUE)) %>%
    ungroup() %>%
    pivot_wider(names_from = Catégorie, values_from = Effectif, values_fill = list(Effectif=0))

  ens <- full_join(ens.tit,ens.np) %>%
    #bind_rows(ens.tit,ens.np) 
    #rowwise() %>%
    transmute(
      UAI,
      Etablissement,
      Type,
      Rentrée,
      kpi.ENS.P.effectif      = EC + AM2D + EC_contractuel + AM2D_contractuel + Doc + ATER + Autres,
      kpi.ENS.S.titulaires    = EC + AM2D,
      kpi.ENS.S.EC            = EC + EC_contractuel,
      kpi.ENS.S.DocATER       = Doc + ATER,
      kpi.ENS.S.contractuels  = EC_contractuel + AM2D_contractuel,
    ) %>%
    arrange(UAI,Rentrée) %>%
    ungroup()

  return(ens)
}


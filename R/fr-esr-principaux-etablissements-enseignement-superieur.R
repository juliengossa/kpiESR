# https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-principaux-etablissements-enseignement-superieur/information/?disjunctive.type_d_etablissement
# Commentaires :
# - établissement.expérimental seulement pour Université de Paris (avec une type unique aussi)
# - donner l'année plutôt que "oui" dans "universités.fusionnées"

# Version du 29 décembre 2021
# [1] "Libellé"                                 "nom_court"                               "sigle"                                  
# [4] "type.d.établissement"                    "typologie_d_universites_et_assimiles"    "secteur_d_etablissement"                
# [7] "vague_contractuelle"                     "localisation"                            "Site.internet"                          
# [10] "Géolocalisation"                         "uai...identifiant"                       "siret"                                  
# [13] "siren"                                   "rna"                                     "Identifiant.wikidata"                   
# [16] "Elément.wikidata"                        "identifiant_idref"                       "Identifiant.ETER"                       
# [19] "Identifiant.ROR"                         "Elément.ROR"                             "Identifiant.GRID"                       
# [22] "Elément.GRID"                            "Identifiant.OrgRef"                      "Identifiant.ISNI"                       
# [25] "Elément.ISNI"                            "identifiant_funding_data"                "Elément.Funding.Data"                   
# [28] "identifiant_dataesr"                     "anciens_codes_uai"                       "rattachement_identifiants"              
# [31] "rattachement"                            "association_identifiants"                "association"                            
# [34] "date_creation"                           "texte_de_ref_creation_lib"               "texte_de_ref_creation"                  
# [37] "date_fermeture"                          "texte_de_ref_fermeture_lib"              "texte_de_ref_fermeture"                 
# [40] "dernier_decret_legifrance_lib"           "dernier_decret_legifrance"               "Code.commune"                           
# [43] "Commune"                                 "Code.unité.urbaine"                      "Unité.urbaine"                          
# [46] "Code.département"                        "Département"                             "Code.académie"                          
# [49] "Académie"                                "Code.région"                             "Région"                                 
# [52] "Ancien.code.région"                      "Ancienne.région"                         "Mention.distribution"                   
# [55] "Adresse"                                 "Lieu.dit"                                "Boite.postale"                          
# [58] "Code.postal"                             "Localité"                                "Pays"                                   
# [61] "Numéro.de.téléphone"                     "statut_juridique_court"                  "Statut.juridique"                       
# [64] "qualification_court"                     "Qualification"                           "compte_facebook"                        
# [67] "compte_twitter"                          "compte_instagram"                        "compte_flickr"                          
# [70] "compte_pinterest"                        "flux_rss"                                "compte_linkedin"                        
# [73] "compte_viadeo"                           "compte_france_culture"                   "compte_scribd"                          
# [76] "compte_scoopit"                          "compte_tumblr"                           "compte_youtube"                         
# [79] "compte_vimeo"                            "compte_dailymotion"                      "autres"                                 
# [82] "compte_gitHub"                           "Page.Wikipédia.en.français"              "Page.Wikipédia.en.anglais"              
# [85] "scanr"                                   "hal"                                     "mooc"                                   
# [88] "article"                                 "uo_lib_officiel"                         "English.name"                           
# [91] "Site.internet.en.anglais"                "Site.internet.en.chinois"                "Site.internet.en.espagnol"              
# [94] "Site.internet.en.allemand"               "Site.internet.en.italien"                "Effectifs.d.étudiants.inscrits.2010.11" 
# [97] "Effectifs.d.étudiants.inscrits.2011.12"  "Effectifs.d.étudiants.inscrits.2012.13"  "Effectifs.d.étudiants.inscrits.2013.14" 
# [100] "Effectifs.d.étudiants.inscrits.2014.15"  "Effectifs.d.étudiants.inscrits.2015.16"  "Effectifs.d.étudiants.inscrits.2016.17" 
# [103] "Effectifs.d.étudiants.inscrits.2017.18"  "uai_rgp_loi_esr_2013"                    "universites_fusionnees"                 
# [106] "etablissement_experimental"              "implantations"                           "identifiant_programmes_lolf"            
# [109] "statut_operateur_lolf"                   "libelle_missions_lolf"                   "libelle_programmes_lolf"                
# [112] "libelle_programme_lolf_chef_de_file"     "identifiants_autres_programmes_lolf"     "libelles_autres_programmes_lolf"        
# [115] "identifiant_programme_lolf_chef_de_file" "libelle_mission_chef_de_file"            "compte_googleplus"   


kpiesr_read.etab <- function(filename = "dataESR/fr-esr-principaux-etablissements-enseignement-superieur.csv") {
  
  etab <- read.csv2(filename, 
                    na.string = "") %>%
    transmute(
      UAI = uai...identifiant,
      Etablissement = Libellé,
      Sigle = ifelse(!is.na(sigle),sigle,nom_court),
      Type = type.d.établissement,
      Typologie = typologie_d_universites_et_assimiles,
      Secteur = secteur_d_etablissement,
      Académie = Académie,
      Rattachement = rattachement,
      Fusion = (universites_fusionnees == "Oui"),
      url.siteweb = Site.internet,
      url.wikidata = Elément.wikidata,
      url.legifrance = dernier_decret_legifrance,
      twitter = compte_twitter
    ) 
}

# kpiesr_read.etab("dataESR/fr-esr-principaux-etablissements-enseignement-superieur.csv")
# kpiesr_read.etab("dataESR/fr-esr-principaux-etablissements-enseignement-superieur.2022.csv")
# kpiesr_read.etab("dataESR/fr-esr-principaux-etablissements-enseignement-superieur.2021.csv")

# Version du 13 aout 2021
# [1] "Libellé"                                 "nom_court"                               "sigle"                                   "type.d.établissement"                   
# [5] "typologie_d_universites_et_assimiles"    "secteur_d_etablissement"                 "vague_contractuelle"                     "localisation"                           
# [9] "Site.internet"                           "Géolocalisation"                         "uai...identifiant"                       "siret"                                  
# [13] "siren"                                   "rna"                                     "Identifiant.wikidata"                    "Elément.wikidata"                       
# [17] "identifiant_idref"                       "Identifiant.ETER"                        "Identifiant.ROR"                         "Elément.ROR"                            
# [21] "Identifiant.GRID"                        "Elément.GRID"                            "Identifiant.OrgRef"                      "Identifiant.ISNI"                       
# [25] "Elément.ISNI"                            "identifiant_funding_data"                "Elément.Funding.Data"                    "identifiant_dataesr"                    
# [29] "anciens_codes_uai"                       "rattachement_identifiants"               "rattachement"                            "association_identifiants"               
# [33] "association"                             "date_creation"                           "texte_de_ref_creation_lib"               "texte_de_ref_creation"                  
# [37] "date_fermeture"                          "texte_de_ref_fermeture_lib"              "texte_de_ref_fermeture"                  "dernier_decret_legifrance_lib"          
# [41] "dernier_decret_legifrance"               "Code.commune"                            "Commune"                                 "Code.unité.urbaine"                     
# [45] "Unité.urbaine"                           "Code.département"                        "Département"                             "Code.académie"                          
# [49] "Académie"                                "Code.région"                             "Région"                                  "Ancien.code.région"                     
# [53] "Ancienne.région"                         "Mention.distribution"                    "Adresse"                                 "Lieu.dit"                               
# [57] "Boite.postale"                           "Code.postal"                             "Localité"                                "Pays"                                   
# [61] "Numéro.de.téléphone"                     "statut_juridique_court"                  "Statut.juridique"                        "qualification_court"                    
# [65] "Qualification"                           "compte_facebook"                         "compte_twitter"                          "compte_instagram"                       
# [69] "compte_flickr"                           "compte_pinterest"                        "flux_rss"                                "compte_linkedin"                        
# [73] "compte_viadeo"                           "compte_france_culture"                   "compte_scribd"                           "compte_scoopit"                         
# [77] "compte_tumblr"                           "compte_youtube"                          "compte_vimeo"                            "compte_dailymotion"                     
# [81] "autres"                                  "compte_gitHub"                           "Page.Wikipédia.en.français"              "Page.Wikipédia.en.anglais"              
# [85] "scanr"                                   "hal"                                     "mooc"                                    "article"                                
# [89] "uo_lib_officiel"                         "English.name"                            "Site.internet.en.anglais"                "Site.internet.en.chinois"               
# [93] "Site.internet.en.espagnol"               "Site.internet.en.allemand"               "Site.internet.en.italien"                "Effectifs.d.étudiants.inscrits.2010.11" 
# [97] "Effectifs.d.étudiants.inscrits.2011.12"  "Effectifs.d.étudiants.inscrits.2012.13"  "Effectifs.d.étudiants.inscrits.2013.14"  "Effectifs.d.étudiants.inscrits.2014.15" 
# [101] "Effectifs.d.étudiants.inscrits.2015.16"  "Effectifs.d.étudiants.inscrits.2016.17"  "Effectifs.d.étudiants.inscrits.2017.18"  "uai_rgp_loi_esr_2013"                   
# [105] "universites_fusionnees"                  "etablissement_experimental"              "implantations"                           "identifiant_programmes_lolf"            
# [109] "statut_operateur_lolf"                   "libelle_missions_lolf"                   "libelle_programmes_lolf"                 "libelle_programme_lolf_chef_de_file"    
# [113] "identifiants_autres_programmes_lolf"     "libelles_autres_programmes_lolf"         "identifiant_programme_lolf_chef_de_file" "libelle_mission_chef_de_file"           
# [117] "compte_googleplus"  


kpiesr_read.etab.2021v1 <- function() {
  
  etab <- read.csv2("dataESR/fr-esr-principaux-etablissements-enseignement-superieur.2021.csv", 
                    na.string = "") %>%
    transmute(
      UAI = uai...identifiant,
      Etablissement = Libellé,
      Sigle = ifelse(!is.na(sigle),sigle,nom_court),
      Type = type.d.établissement,
      Académie = Académie,
      Rattachement = rattachement,
      Fusion = (universites_fusionnees == "Oui"),
      url.siteweb = Site.internet,
      url.wikidata = Elément.wikidata,
      url.legifrance = dernier_decret_legifrance,
      twitter = compte_twitter
    ) 
}



# https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-principaux-etablissements-enseignement-superieur/information/?disjunctive.type_d_etablissement
# Commentaires :
# - établissement.expérimental seulement pour Université de Paris (avec une type unique aussi)
# - donner l'année plutôt que "oui" dans "universités.fusionnées"

# Version 15 avril 2020
# [1] "uai...identifiant"          "Libellé"                    "sigle"                      "type.d.établissement"
# [5] "Secteur.d.établissement"    "Établissements.d.enseignement.supérieur.accrédités.à.délivrer.le.doctorat"
# [7] "localisation"               "Site.internet"
# [9] "Géolocalisation"            "siret"                      "siren"                      "Identifiant.wikidata"
# [13] "Elément.wikidata"           "Identifiant.ETER"           "Identifiant.ROR"            "Elément.ROR"
# [17] "Identifiant.GRID"           "Elément.GRID"               "Identifiant.OrgRef"         "Identifiant.ISNI"
# [21] "Elément.ISNI"               "Identifiant.Funding.Data"   "Elément.Funding.Data"       "rattachement_identifiants"
# [25] "rattachement"               "dernier_decret_legifrance"  "Code.commune"               "Commune"
# [29] "Code.unité.urbaine"         "Unité.urbaine"              "Code.département"           "Département"
# [33] "Code.académie"              "Académie"                   "Code.région"                "Région"
# [37] "Ancien.code.région"         "Ancienne.région"            "Mention.distribution"       "Adresse"
# [41] "Lieu.dit"                   "Boite.postale"              "Code.postal"                "Localité"
# [45] "Pays"                       "Numéro.de.téléphone"        "qualification_court"        "Qualification"
# [49] "compte_facebook"            "compte_twitter"             "compte_instagram"           "compte_flickr"
# [53] "compte_pinterest"           "flux_rss"                   "compte_linkedin"            "compte_viadeo"
# [57] "compte_france_culture"      "compte_scribd"              "compte_scoopit"             "compte_tumblr"
# [61] "compte_youtube"             "compte_vimeo"               "compte_dailymotion"         "compte_googleplus"
# [65] "implantations"              "mooc"                       "Page.Wikipédia.en.français" "Page.Wikipédia.en.anglais"
# [69] "English.name"               "Site.internet.en.anglais"   "Site.internet.en.chinois"   "Site.internet.en.espagnol"
# [73] "Site.internet.en.allemand"  "Site.internet.en.italien"   "Identifiant.interne"        "Anciens.codes.uai"
# [77] "Identifiant.dataESR"        "article"                    "universités.fusionnées"     "Vague.contractuelle"


kpiesr_read.etab.2020v1 <- function() {

  etab <- read.csv2("dataESR/fr-esr-principaux-etablissements-enseignement-superieur.2020v1.csv", 
                    na.strings = "") %>%
    transmute(
      UAI = uai...identifiant,
      Etablissement = Libellé,
      Sigle = sigle,
      Type = type.d.établissement,
      Académie = Académie,
      Rattachement = rattachement,
      Fusion = (universités.fusionnées == "Oui"),
      url.siteweb = Site.internet,
      url.wikidata = Elément.wikidata,
      url.legifrance = dernier_decret_legifrance,
      twitter = compte_twitter
    ) %>%
    filter(!is.na(UAI),!UAI=="")
}



# version 2019v1 / 20 décembre 2019
# [1] "uai"                        "uo_lib"                     "sigle"
# [4] "type_d_etablissement"       "url"                        "coordonnees"
# [7] "element_wikidata"           "rattachement_identifiants"  "rattachement"
# [10] "dernier_decret_legifrance"  "com_code"                   "com_nom"
# [13] "uucr_id"                    "uucr_nom"                   "dep_id"
# [16] "dep_nom"                    "aca_id"                     "aca_nom"
# [19] "reg_id"                     "reg_nom"                    "mention_distribution"
# [22] "adresse_uai"                "lieu_dit_uai"               "boite_postale_uai"
# [25] "code_postal_uai"            "localite_acheminement_uai"  "pays_etranger_acheminement"
# [28] "numero_telephone_uai"

# types.établissement <- read.table("types-établissement.csv",
#                                header=TRUE, sep=';', quote='"')
# types.établissement <- setNames(as.character(types.établissement$Type),types.établissement$Type.détaillé)

kpiesr_read.etab.2019v1 <- function() {

  etab <- read.csv2("dataESR/fr-esr-principaux-etablissements-enseignement-superieur.2019v1.csv",
                     na.strings = "")  %>%
    transmute(
      UAI = uai,
      Etablissement = uo_lib,
      Sigle = sigle,
      Type = type_d_etablissement,
      Académie = aca_nom,
      Rattachement = rattachement,
      url.siteweb = url,
      url.wikidata = element_wikidata,
      url.legifrance = dernier_decret_legifrance
    ) %>%
    filter(!is.na(UAI),!UAI=="")
}

# kpiesr_read.etab <- function() {
#   etab.21.2 <- kpiesr_read.etab.2021v1()
#   etab.21.1 <- kpiesr_read.etab.2021v1()
#   etab.20 <- kpiesr_read.etab.2020v1()
#   etab.19 <- kpiesr_read.etab.2019v1()
#   
#   #etiquettes <- read.csv("dataESR/etiquettes.csv")
#   
#   etab <- etab.21.2 %>% mutate(version="2021.2")
#   etab <- bind_rows(etab, etab.21.1 %>% filter(!UAI %in% etab$UAI) %>% mutate(version="2021.1"))
#   etab <- bind_rows(etab, etab.20 %>% filter(!UAI %in% etab$UAI) %>% mutate(version="2020"))
#   etab <- bind_rows(etab, etab.19 %>% filter(!UAI %in% etab$UAI) %>% mutate(version="2019"))
#    
#   return(etab)
# }


# [1] "Année"                    "Etablissement"            "Multi.occupation"         "Code.Site"               
# [5] "Code.bât.ter"             "Libellé.bât.ter"          "GA"                       "Paysage_id"              
# [9] "Id.interne"               "Ref..parcelle"            "Etat.santé"               "Type.bât."               
# [13] "Domaine.bat."             "Propriétaire.bat."        "Réglementation.générale"  "Catégorie.ERP"           
# [17] "Type.ERP"                 "Class..Monument.histo."   "Etat.access."             "Access..AdAP"            
# [21] "Access..date"             "Access..dérog."           "Energie.class."           "Energie.valeur"          
# [25] "GES"                      "GES.valeur"               "Audit.energie"            "Audit.energie.date"      
# [29] "Audit.energie.prog."      "Audit.energie.prog..date" "Bilan.carbone"            "Bilan.carbone.date"      
# [33] "Bilan.carbone.prog."      "Bilan.carbone.prog..date" "Site.géo."                "latlong"                 
# [37] "Adresse"                  "CP"                       "Ville"                    "Pays"                    
# [41] "COM_CODE"                 "COM_NOM"                  "UUCR_ID"                  "UUCR_NOM"                
# [45] "DEP_ID"                   "DEP_NOM"                  "ACA_ID"                   "ACA_NOM"                 
# [49] "REG_ID"                   "REG_NOM"                  "date_extract"            

kpiesr_read.imo <- function(pidfix=list("x"="x")) {
  
  imo <- read.csv2("dataESR/fr-esr-patrimoine-immobilier-des-operateurs-de-l-enseignement-superieur.csv", na.string = "") %>% 
    group_by(
      pid = recode(Paysage_id,!!!pidfix),
      Rentrée = Année - 1
    ) %>%
    summarise(
      kpi.IMO.P.batiments = n(),
      kpi.IMO.S.état_satisfaisant = sum(Etat.santé %in% c("Satisfaisant","Très satisfaisant")),
      kpi.IMO.S.énergie_ABC = sum(Energie.class. %in% c("A","B","C")),
      kpi.IMO.S.GES_ABC = sum(GES %in% c("A","B","C")),
      kpi.IMO.S.propriété_propre = sum(Propriétaire.bat. %in% c("Propre à l'établissement"))
    )

}
      
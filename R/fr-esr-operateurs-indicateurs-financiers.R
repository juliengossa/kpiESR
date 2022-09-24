# https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-operateurs-indicateurs-financiers/information/
# Version du 13 aout 2021
# 
# [1] "uai...identifiant"                                   "exercice"                                           
# [3] "Acquisitions.d.immobilisations"                      "ANR.hors.investissements.d.avenir"                  
# [5] "ANR.investissements.d.avenir"                        "Autres.ressources.propres"                          
# [7] "Autres.Subventions"                                  "Besoin.en.fonds.de.roulement"                       
# [9] "CAF...Produits.encaissables"                         "Charges.externes"                                   
# [11] "Charges.externes...Produits.encaissables"            "Contrats.et.prestations.de.recherche.hors.ANR"      
# [13] "Droits.d.inscription"                                "Fonds.de.roulement.net.global"                      
# [15] "Produits.de.fonctionnement.encaissables"             "Ressources.propres...Produits.encaissables"         
# [17] "Taxe.d.apprentissage"                                "Valorisation"                                       
# [19] "rce"                                                 "vague"                                              
# [21] "Etablissement"                                       "commune"                                            
# [23] "academie"                                            "region"                                             
# [25] "code.de.la.commune"                                  "code.de.l.academie"                                 
# [27] "code.de.la.region"                                   "source"                                             
# [29] "id...paysage"                                        "CAF...Acquisitions.d.immobilisations"               
# [31] "Capacité.d.autofinancement"                          "Charges.de.fonctionnement.décaissables"             
# [33] "Charges.décaissables...Produits.encaissables"        "Dépenses.de.personnel"                              
# [35] "Dépenses.de.personnel...Produits.encaissables"       "Excédent.Brut.d.Exploitation..EBE."                 
# [37] "Fonds.de.roulement.en.jours.de.charges.décaissables" "Formation.continue..diplômes.propres.et.VAE"        
# [39] "Recettes.propres"                                    "Ressources.propres.encaissables"                    
# [41] "Résultat.net.comptable"                              "Résultat.net.comptable.hors.SIE"                    
# [43] "Solde.budgétaire"                                    "Subventions.Union.Européenne"                       
# [45] "Subventions.de.la.région"                            "Taux.de.rémunération.des.permanents"                
# [47] "Trésorerie"                                          "Trésorerie.en.jours.de.charges.décaissables"        


kpiesr_read.fin <- function(pidfix=list("x"="x")) {
  fin <- read.csv2("dataESR/fr-esr-operateurs-indicateurs-financiers.csv", na.strings="", dec=".") %>%
    group_by(
      pid = recode(id...paysage,!!!pidfix),
      Rentrée = exercice-1) %>% # l'exercice comptable est sur l'année civile
      #RCE = rce,
    summarise(
      kpi.FIN.P.ressources = sum(Produits.de.fonctionnement.encaissables),
      kpi.FIN.S.masseSalariale = sum(Dépenses.de.personnel),
      kpi.FIN.S.SCSP = sum(kpi.FIN.P.ressources) - sum(Ressources.propres.encaissables),
      kpi.FIN.S.recettesFormation = sum(Droits.d.inscription) +
                                    sum(Formation.continue..diplômes.propres.et.VAE) +
                                    sum(Taxe.d.apprentissage),
      kpi.FIN.S.recettesRecherche = sum(Valorisation) +
                                    sum(ANR.hors.investissements.d.avenir) +
                                    sum(ANR.investissements.d.avenir) +
                                    sum(Contrats.et.prestations.de.recherche.hors.ANR),
      kpi.FIN.S.investissements = sum(Acquisitions.d.immobilisations)
    ) %>%
    # mutate(across(starts_with("kpi"), ~ na_if(.x, 0))) %>%
    #filter_at(starts_with("fin"),all_vars(!is.na(.))) %>%
    # filter(!is.na(kpi.FIN.P.ressources),
    #        !is.na(kpi.FIN.S.masseSalariale),
    #        !is.na(kpi.FIN.S.ressourcesPropres),
    #        !is.na(kpi.FIN.S.investissements)) %>%
    ungroup() %>%
    arrange(pid,Rentrée)
    # Enlever les données suspectes
    # filter(
    #   !(UAI == "0781944P" & Rentrée == 2012)
    # )

  return(fin)
}

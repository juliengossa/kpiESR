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


kpiesr_read.fin <- function() {
  fin <- read.csv2("dataESR/fr-esr-operateurs-indicateurs-financiers.csv", na.strings="", dec=".") %>%
    transmute(
      #UAI = uai.actuel,
      UAI = uai...identifiant,
      Etablissement = Etablissement,
      Type = NA,
      Rentrée = exercice-1, # l'exercice comptable est sur l'année civile
      #RCE = rce,
      kpi.FIN.P.ressources = Produits.de.fonctionnement.encaissables,
      kpi.FIN.S.masseSalariale = Dépenses.de.personnel,
      kpi.FIN.S.SCSP = kpi.FIN.P.ressources - Ressources.propres.encaissables,
      kpi.FIN.S.recettesFormation = rowSums(na.rm = TRUE, select(.,
                                     Droits.d.inscription,
                                     Formation.continue..diplômes.propres.et.VAE, 
                                     Taxe.d.apprentissage)),
      kpi.FIN.S.recettesRecherche = rowSums(na.rm = TRUE, select(.,
                                     Valorisation,
                                     ANR.hors.investissements.d.avenir, 
                                     ANR.investissements.d.avenir,
                                     Contrats.et.prestations.de.recherche.hors.ANR)),
      kpi.FIN.S.investissements = Acquisitions.d.immobilisations
    ) %>%
    mutate(
      kpi.FIN.S.recettesFormation = na_if(kpi.FIN.S.recettesFormation, 0),
      kpi.FIN.S.recettesRecherche = na_if(kpi.FIN.S.recettesRecherche, 0)) %>%
    #filter_at(starts_with("fin"),all_vars(!is.na(.))) %>%
    # filter(!is.na(kpi.FIN.P.ressources),
    #        !is.na(kpi.FIN.S.masseSalariale),
    #        !is.na(kpi.FIN.S.ressourcesPropres),
    #        !is.na(kpi.FIN.S.investissements)) %>%
    arrange(UAI,Rentrée)
    # Enlever les données suspectes
    # filter(
    #   !(UAI == "0781944P" & Rentrée == 2012)
    # )

  return(fin)
}

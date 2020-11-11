
# https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-operateurs-indicateurs-financiers/information/
# Version du 12 octobre 2020
# 
# [1] "uai...identifiant"                                   "exercice"                                           
# [3] "Acquisitions.d.immobilisations"                      "ANR.hors.investissements.d.avenir"                  
# [5] "ANR.investissements.d.avenir"                        "Autres.ressources.propres"                          
# [7] "Autres.Subventions"                                  "Besoin.en.fonds.de.roulement"                       
# [9] "CAF...Produits.encaissables"                         "Charges.décaissables...Produits.encaissables"       
# [11] "Charges.externes"                                    "Charges.externes...Produits.encaissables"           
# [13] "Contrats.et.prestations.de.recherche.hors.ANR"       "Dépenses.de.personnel"                              
# [15] "Dépenses.de.personnel...Produits.encaissables"       "Droits.d.inscription"                               
# [17] "Excédent.Brut.d.Exploitation..EBE."                  "Fonds.de.roulement.en.jours.de.charges.décaissables"
# [19] "Fonds.de.roulement.net.global"                       "Formation.continue..diplômes.propres.et.VAE"        
# [21] "Ressources.propres"                                  "Ressources.propres...Produits.encaissables"         
# [23] "Résultat.net.comptable"                              "Solde.budgétaire"                                   
# [25] "Taxe.d.apprentissage"                                "Trésorerie"                                         
# [27] "Trésorerie.en.jours.de.charges.décaissables"         "Valorisation"                                       
# [29] "rce"                                                 "vague"                                              
# [31] "typologie"                                           "code.du.groupe"                                     
# [33] "groupe"                                              "uai.actuel"                                         
# [35] "etablissement"                                       "code.de.la.commune"                                 
# [37] "commune"                                             "code.de.l.academie"                                 
# [39] "academie"                                            "code.de.la.region"                                  
# [41] "region"                                              "Capacité.d.autofinancement"                         
# [43] "Charges.de.fonctionnement.décaissables"              "Produits.de.fonctionnement.encaissables"            
# [45] "Résultat.net.comptable.hors.SIE"                     "Subventions.de.la.région"                           
# [47] "Subventions.Union.Européenne"      



kpiesr_read.fin <- function() {
  fin <- read.table("dataESR/fr-esr-operateurs-indicateurs-financiers.csv",
                        header=TRUE, sep=';', quote='"') %>%
    transmute(
      #UAI = uai.actuel,
      UAI = uai...identifiant,
      Rentrée = as.factor(exercice-1), # l'exercice comptable est sur l'année civile
      #RCE = rce,
      kpi.FIN.P.ressources = Produits.de.fonctionnement.encaissables,
      kpi.FIN.S.masseSalariale = Dépenses.de.personnel,
      kpi.FIN.S.SCSP = kpi.FIN.P.ressources - Ressources.propres,
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

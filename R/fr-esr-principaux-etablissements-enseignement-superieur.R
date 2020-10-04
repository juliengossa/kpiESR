# https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-principaux-etablissements-enseignement-superieur/information/?disjunctive.type_d_etablissement
# Commentaires :
# - établissement.expérimental seulement pour Université de Paris (avec une type unique aussi)
# - donner l'année plutôt que "oui" dans "universités.fusionnées"

# Version courante  / 15 avril 2020
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

  curif <- read.table("dataESR/curif.csv",
                      header=TRUE, sep=';', quote='"', comment.char = "")

  etab <- read.table("dataESR/fr-esr-principaux-etablissements-enseignement-superieur.csv",
                     header=TRUE, sep=';', quote='"', comment.char = "") %>%
    transmute(
      UAI = uai...identifiant,
      Libellé = Libellé,
      Sigle = sigle,
      Type = type.d.établissement,
      Type.détaillé = type.d.établissement,
      Académie = Académie,
      Rattachement = rattachement,
      Fusion = (universités.fusionnées == "Oui"),
      Curif = UAI %in% curif$UAI,
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
  curif <- read.table("dataESR/curif.csv",
                      header=TRUE, sep=';', quote='"', comment.char = "")

  etab <- read.table("dataESR/fr-esr-principaux-etablissements-enseignement-superieur.2019v1.csv",
                     header=TRUE, sep=';', quote='"', comment.char = "")  %>%
    transmute(
      UAI = uai,
      Libellé = uo_lib,
      Sigle = sigle,
      #Type = types.établissement[type.d.établissement],
      Type = case_when(
        type_d_etablissement %in% c("Association d'établissements",
                                    "Communauté d'universités et établissements",
                                    "Pôle de recherche et d'enseignement supérieur",
                                    "Convention de coordination territoriale" ) ~
          "Regroupement",
        type_d_etablissement %in% c("Université",
                                    "Établissement public expérimental",
                                    "Établissement public expérimental;Université") ~
          "Université",
        type_d_etablissement %in% c("Grand établissement") ~
          "Grand établissement",
        TRUE ~ "Autre établissement"),
      Type = Type,
      Type.détaillé = type_d_etablissement,
      Académie = aca_nom,
      Rattachement = rattachement,
      url.siteweb = url,
      url.wikidata = element_wikidata,
      url.legifrance = dernier_decret_legifrance,
      Curif = UAI %in% curif$UAI
    ) %>%
    filter(!is.na(UAI),!UAI=="")
}

kpiesr_read.etab <- function() {
  etab.20 <- kpiesr_read.etab.2020v1()
  etab.19 <- kpiesr_read.etab.2019v1()

  etab <- bind_rows(
    etab.20,
    etab.19[!etab.19$UAI %in% etab.20$UAI,]
  ) %>% mutate(
      Type = factor(Type, levels = c("Université",
                                     "Grand établissement",
                                     "École",
                                     "Regroupement",
                                     "Autre établissement"))
    )


  etab[etab$Libellé == "Université de Lorraine",]$Type <- "Université"
  etab[etab$Libellé == "Université de Lorraine",]$Type.détaillé <- "Grand établissement"

  return(etab)
}


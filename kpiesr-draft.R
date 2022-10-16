
library(kpiESR)
library(tidyverse)
library(cowplot)
library(plotly)
library(ggthemes)
library(gganimate)
library(ggbeeswarm)
library(ggiraphExtra)

kpiesr_plot_tdb(2018,"0673021V", style.kpi = kpiesr_style())

kpiesr_plot_tdb(2018,"0595964M", style.kpi = kpiesr_style()) # ULCO

kpiesr_plot_tdb(2018,"0755700N", style.kpi = kpiesr_style())

rentrée <- 2019
groupe <- "Université"
 uai.unistra <- "0673021V"
uai.uha <- "0681166Y"
uai.ubm <- "0331766R"
uai.nimes <- "0301687W"
uai.lorraine <- "0542493S"
uai.guyanne <- "9730429D"
uai.diderot <- "0751723R"
uai.descartes <- "0751721N"
uai.bordeaux <- "0333298F"
uai.usmb <- "0730858L"
uai.ufc <- "0251215K"

uais <- c(uai.unistra, uai.uha)
uai.horsnormes <- c(uai.guyanne)

rentrée <- 2017
type <- "Université"
uai <- uai.unistra
uai <- uai.uha
uai <- uai.lorraine


uai.ehess <- "0753742K"
uai.dauphine <- "0750736T"
uai.psl <- "0755700N"
type <- "Regroupement"


uai <- "0597065J"
uai.unistra <- "0673021V"
uai <- uai.unistra

kpiesr_plot_primaire(2018,uai,kpiesr_lfc[["ETU"]],style=kpiesr_style())
kpiesr_plot_primaire(2018,uai,kpiesr_lfc[["ENS"]])
kpiesr_plot_primaire(2018,uai,kpiesr_lfc[["FIN"]])
kpiesr_plot_primaire(2018,uai,kpiesr_lfc[["ADM"]])


kpiesr_plot_norm(2017,uai,kpiesr_lfc[["ETU"]])
kpiesr_plot_norm(2017,uai,kpiesr_lfc[["ETU"]], style=kpiesr_style(bp_style = "violin"))
kpiesr_plot_norm(2017,uai,kpiesr_lfc[["ENS"]])
kpiesr_plot_norm(2018,uai,kpiesr_lfc[["FIN"]],omit.first = FALSE)
kpiesr_plot_norm(2017,uai,kpiesr_lfc[["ADM"]])
kpiesr_plot_norm(2017,uai,kpiesr_lfc[["K"]], omit.first = FALSE)


kpiesr_plot_kiviat(2018,uai,kpiesr_lfc[["ETU"]])
kpiesr_plot_kiviat(2018,uai,kpiesr_lfc[["ENS"]])
kpiesr_plot_kiviat(2018,uai,kpiesr_lfc[["FIN"]])
kpiesr_plot_kiviat(2018,uai,kpiesr_lfc[["ADM"]])
kpiesr_plot_kiviat(2018,uai,kpiesr_lfc[["K"]], omit.first = FALSE)
kpiesr_plot_kiviat(2018,uai,kpiesr_lfc[["K"]], omit.first = FALSE, 
                   style=kpiesr_style(kvt_style="square"))
kpiesr_plot_kiviat(2018,uai,kpiesr_lfc[["K"]], omit.first = FALSE, 
                   style=kpiesr_style(kvt_style="square", kvt_point_pos=1.2))



kpiesr_plot_kiviat(2018,uai,kpiesr_lfc[["K"]], omit.first = FALSE,
                   style=kpiesr_style(kvt_scale_text_y = 0))


kpiesr_plot_kiviat(2018,c("0681166Y", "0673021V"),kpiesr_lfc[["K"]], omit.first = FALSE, 
                   style=kpiesr_style(kvt_style="square", kvt_point_pos=1.2))


kpiesr_plot_evol(seq(2012,2017), c(uai), kpiesr_lfc$K,1,
                 plot.type="abs", yzoom=0.5,
                 style = kpiesr_style(grid=TRUE),
                 y_labels=euro,
                 rentrée.base = 2015)



uai <- "0673021V"
plots <- kpiesr_plot_evol_all(2017, uai, peg.args,
                              yzooms = c(0.5, 0.5, 1, 1, 0.5),
                              plot.type="abs")
plots[[3]]
plot_grid(plotlist = plots,nrow=1)

uai <- "0597065J"
kpiesr_plot_tdb(2017,uai.unistra)


kpiesr_classement(2017, "Université",
                  c("kpi.K.proPres", "kpi.FIN.P.ressources","kpi.FIN.S.ressourcesPropres"),
                  c("RP/R","R","RP"))



uai <- "0673021V"
ggplotly(kpiesr_plot_primaire(2017,uai,kpiesr_lfc[["FIN_N"]],style=kpiesr_style()), tooltip = "text")

subplot(
  kpiesr_plot_evol_all(rentrée, uai, peg.args,
                       yzooms = c(0.1, 1, 1, 0.11, 0.1, 10),
                       plot.type="norm")
)


ps <- kpiesr_plot_evol_all(rentrée, uai, peg.args,
                     yzooms = c(0.6, 0.6, 0.5, 0.2, 0.2, 1),
                     plot.type="norm")


esr %>% filter(Type == "Université", Rentrée > 2012) %>%
  group_by(Rentrée) %>%
  summarise(
    Ressources = sum(kpi.FIN.P.ressources, na.rm = TRUE),
    MasseSalariale = sum(kpi.FIN.S.masseSalariale, na.rm = TRUE) ,
    Ratio = MasseSalariale/Ressources)  %>%
  pivot_longer(-Rentrée) %>%
  group_by(name) %>% arrange(Rentrée) %>%
  mutate(Evolution = (valeur / first(valeur))) %>%
  filter(name == "Ratio") %>%
  ggplot(aes(x=Rentrée, y=Evolution, color=name, group=name)) +
    geom_line(size=2) +
    theme_hc() + guides(color=FALSE) + ggtitle("Evolution du ratio masse salariale sur produits encaissables \n des universités, en base 1.0 pour 2013")


nat <- esr %>% filter(Type=="Université", Rentrée >= 2012, Rentrée < 2018) %>%
  group_by(Rentrée) %>%
  summarise(
    enseignants = sum(kpi.ENS.P.effectif, na.rm=TRUE),
    titulaires = sum(kpi.ENS.S.titulaires, na.rm=TRUE),
    etudiants = sum(kpi.ETU.S.cycle.1.L+kpi.ETU.S.cycle.2.M),
    Taux.d.encadrement = titulaires/etudiants*100) %>%
  pivot_longer(-Rentrée, names_to = "effectif") %>%
  group_by(effectif) %>%
  mutate(
    evolution = valeur / first(valeur) * 100
  )

nat %>% filter(effectif %in% c("enseignants","titulaires")) %>%
  ggplot(aes(x=Rentrée, y=valeur, group=effectif, color=effectif)) +
    geom_line(size=2)  + theme_hc()

nat %>% filter(effectif %in% c("etudiants")) %>%
  ggplot(aes(x=Rentrée, y=valeur, group=effectif, color=effectif)) +
  geom_line(size=2) +  theme_hc()

nat %>%
  ggplot(aes(x=Rentrée, y=evolution, group=effectif, color=effectif)) +
  geom_line(size=2) + ylim(90,110) + theme_hc()


## Animate

kpiesr_plot_norm(2017,uai,kpiesr_lfc[["K"]],norm.valeurs=FALSE, omit.first = FALSE)

kpiESR::esr %>% filter(Type=="Université", Rentrée >= 2012, Rentrée <= 2017) %>%
  ggplot(aes(x=kpi.ENS.P.effectif, y=kpi.ETU.P.effectif, group = UAI, colour=Curif)) +
  geom_point() + #geom_text(aes(label=Libellé)) +
  xlab("Nombre d'enseignants") + ylab("Nombre d'étudiants") +
  ggtitle("Effectifs étudiant et enseignant dans les établissements de l'ESR\ndurant l'année universitaire {closest_state}") +
  theme_excel_new() + theme(axis.title = element_text()) +
  transition_states(Rentrée, transition_length = 1, state_length = 2) +
  ease_aes('cubic-in-out')

kpiESR::esr.pnl %>% filter(Type=="Université", Rentrée >= 2012, Rentrée <= 2017) %>%
  filter(str_detect(kpi, "kpi.K"), kpi != "kpi.K.selPfor") %>%
  ggplot(aes(x=kpi, y=norm, fill=Curif)) +
  geom_violin() +
  xlab("Nombre d'enseignants") + ylab("Nombre d'étudiants") +
  ggtitle("Effectifs étudiant et enseignant dans les établissements de l'ESR\ndurant l'année universitaire {closest_state}") +
  theme_excel_new() + theme(axis.title = element_text()) +
  transition_states(Rentrée, transition_length = 1, state_length = 2, wrap = FALSE) +
  ease_aes('cubic-in-out')



esr.pnl %>%
  filter(kpi %in% c("kpi.ENS.S.LRU")) %>%
  filter(Rentrée > 2011) %>%
  group_by(Rentrée,kpi) %>%
  summarise(valeur = sum(valeur, na.rm = TRUE)) %>%
  ggplot(aes(x=Rentrée,y=valeur,color=kpi,group=kpi)) + geom_line() +
  theme_excel_new()

esr %>%
  filter(Type == "Université", Rentrée > 2011) %>%
  group_by(Rentrée) %>%
  summarise(
    ens = sum(kpi.ENS.S.titulaires, na.rm = TRUE),
    etu = sum(kpi.ETU.S.cycle.1.L + kpi.ETU.S.cycle.2.M)
  ) %>%
  mutate(
    taux.encadrement = ens/etu,
    ens.const = etu * first(taux.encadrement),
    ens.miss = ens.const - ens,
    ens.evol = ens/first(ens),
    etu.evol = etu/first(etu)) -> df


df %>%
  select(Rentrée, ens.evol, etu.evol) %>%
  pivot_longer(-Rentrée) %>%
  ggplot(aes(x=Rentrée, y=valeur, colour=name, group=name)) + geom_line(size=2) +
    scale_y_continuous(labels = scales::percent) +
    scale_color_discrete(labels=c("enseignants","étudiants"), name="") +
    ylab("évolution") + ggtitle("Evolution des effectifs enseignants et étudiants\ndans les universités en valeur 2012") +
    theme_hc()

df %>%
  ggplot(aes(x=Rentrée,y=ens.miss)) + geom_col()


library(ggfortify)

esr %>%
  filter(Rentrée == 2018) %>%
  select(starts_with("kpi.k")) %>%
  select(-kpi.K.selPfor) %>%
  na.omit() %>%
  PCA(scale.unit = TRUE, ncp = 5, graph = TRUE)

    #mutate_all(function(x) scales::rescale(x, to = c(-1,1) ) ) %>%
#PCA(scale.unit = TRUE, ncp = 5, graph = TRUE)
  prcomp(scale. = TRUE) -> mypca


df <- as.data.frame(mypca$rotation)
df$var <- row.names(df)

df %>%
  ggplot(aes(x = PC1, y = PC2, label = var)) + geom_point() + geom_text() +
  geom_segment(xend=0, yend=0) +
  xlim(-1,1) + ylim(-1,1)



#####

coord_radar2 <- function (theta = "x", start = 0, direction = 1) 
{
  theta <- match.arg(theta, c("x", "y"))
  r <- if (theta == "x") 
    "y"
  else "x"
  ggproto("CordRadar", CoordPolar, theta = theta, r = r, start = start, 
          direction = sign(direction),
          is_linear = function(coord) TRUE)
}

iris %>% gather(dim, val, -Species) %>%
  group_by(dim, Species) %>% summarise(val = mean(val)) 

test2 <- tibble(data.frame(dim=factor(c("a","b","c","d","a","b","c","d")), 
                           val=c(1,1,1,1,2,2,2,2), 
                           Species=c("1","1","1","1","2","2","2","2"))) 


test2 %>%
  ggplot(aes(x=dim, y=val, group=Species)) +
  coord_straightpolar() +
  geom_polygon(aes(col=Species), fill=NA, size=1) +
  geom_hline(yintercept = 2)



##### Finances 

View(esr %>% 
  filter(! is.na(kpi.FIN.S.recettesFormation)) %>%
  group_by(Rentrée, Type) %>%
  summarise(count = n()))


esr %>% 
  #filter(Type == "Université", Rentrée == 2018) %>%
  filter(Type != "Regroupement") %>%
  mutate(rfPetu = kpi.FIN.S.recettesFormation / kpi.ETU.P.effectif) %>%
  ggplot(aes(x=Rentrée, y=rfPetu, color=Type, group=Type)) + geom_smooth()

rf <- esr %>% 
  filter(Type == "Université", as.character(Rentrée) > 2008 ) %>%
  group_by(UAI) %>%
  mutate(
    rfPetu = kpi.FIN.S.recettesFormation / kpi.ETU.P.effectif,
    evol = rfPetu / first(rfPetu)) 

  ggplot(rf, aes(x=Rentrée, y=rfPetu)) + 
  geom_boxplot() +
  geom_line(data = filter(rf,Libellé %in% c("Université de Strasbourg", "Université de Bretagne-Sud")),
            aes(group = Libellé, color = Libellé))

rf %>%
  filter(Rentrée == 2018) %>%
  select(Libellé, kpi.FIN.S.recettesFormation, rfPetu) %>%
  rename(RessourcesFormation = kpi.FIN.S.recettesFormation, rfParEtudiant = rfPetu) %>%
  arrange(desc(rfParEtudiant))%>%
  mutate(
    RessourcesFormation = euro_k(RessourcesFormation),
    rfParEtudiant = euro(rfParEtudiant)
  ) %>%
  View()



etiquettes %>% transmute(
  UAI=recode(UAI,!!!replist),
  Etablissement = Libellé,
  PerimEx = case_when(
    IDEx ~ "IDEx",
    ISITE ~ "ISITE",
    TRUE ~ NA_character_
    ),
  Association = case_when(
    Udice ~ "Udice",
    AUREF ~ "AUREF",
    CURIF ~ "ex CURIF",
    TRUE ~ NA_character_
    )
  ) 

replist <- correspondances.uai$to 
names(replist) <- correspondances.uai$from

res <- mutate(df, UAI=recode(UAI,!!!replist))




etab.cpesr %>% 
  rename(Groupe.détaillé = Groupe) %>%
  mutate(Groupe = recode(Groupe.détaillé,
    "Universités et assimilés" = "Universités et assimilés",
    "Ecoles d'ingénieurs" = "Ecoles d'ingénieurs",
    "Ecoles de commerce" = "Autres écoles",
    "Instituts ou écoles nationaux spécialisés et grands établissements (hors écoles d'ingénieurs)" = "Grands établissements (hors écoles)",
    "Ecoles d'art et de design" = "Autres écoles",
    "Ecoles d'architecture" = "Autres écoles",
    "Autres écoles écoles spécialisées" = "Autres écoles",
    "Instituts catholiques" = "Autres écoles",
    "Ecoles des arts du spectacle" = "Autres écoles",
    "Instituts d'études politiques" = "Instituts d'études politiques",
    "Ecoles françaises à l'étranger" = "Autres écoles",
    "Ecoles normales supérieures" = "Ecoles normales supérieures",
    "Ecoles vétérinaires" = "Autres écoles"
  ) ) %>%
  select(UAI,Etablissement,Groupe,Groupe.détaillé,Type,everything())


esr %>%
  filter(Groupe == "Universités et assimilés") %>%
  ggplot(aes(x=Rentrée,y=kpi.K.forPetu, group=Groupe)) +
  geom_line()



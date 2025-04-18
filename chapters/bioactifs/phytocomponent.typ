#import "/template.typ": desc, annexe, hdesc
#import "/boxes.typ": *

== Introduction

#desc[
  Définition, description d'un phytocosmétique et réglementation
]

Un constituant _phytochimique_ est une molécule que l'on retrouve naturellement dans les tissus végétaux de certaines espèces, et que l'on extrait afin de l'introduire dans une formulation cosmétique. Il peuvent avoir différents rôles: organoleptiques, coloration, texture, mais sont aussi prisés pour leur effet dermatologique, notamment anti-inflammatoire@noauthor_compose_2023.
Ces composés sont appelés _métabolites secondaires_, et ont diverses fonctions au sein de l'organisme -- végétal -- les produisant. La distinction entre les métabolites primaires et secondaires se fait selon la nécessité de leur existence à la survie de l'espèce qui y est liée: les premiers sont essentiels à la survie, tandis que les seconds offrent uniquement un avantage de sélection.
Certains peuvent être synthétisées par laboratoire @tai_biosynthesis_2023, un tableau récapitulatif a été créé afin de rassembler les plus communs
(
  #annexe[
    #let data = csv("ingr_ambigus.csv")
    #set text(size: 11pt)
    #figure(
      table(
        columns: 4,
        align: left,
        ..data.flatten(),
      ),
      caption: [
        Composants cosmétiques de diverses origines (végétale, et synthèse chimique)
      ],
      placement: none
    )
   ]
)
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
    #hdesc[
      Certains composés, à l'image du bisabolol, existent naturellement dans plusieurs espèces végétales mais sont fréquemment obtenus par synthèse ou hémisynthèse dans les formulations cosmétiques modernes. Cette double origine – naturelle et industrielle – constitue une ambiguïté récurrente parmi les ingrédients revendiquant une « origine végétale ». 
    ]
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
Le concept de _Green chemistery_ créé dans les années 90, fut un élément important dans l'appréciation des acheteurs dans les produits _verts_ -- non seulement naturels, mais provenant d'une industrie respectueuse de l'environnement @bozza_current_2022. Cet intérêt s'est traduit par la création de nombreuses @orgs[certifications], afin de régulariser et garantir l'origine des cosmétiques vendus à des consommateurs de plus en plus attentifs.

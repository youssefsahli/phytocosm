#import "/template.typ": desc
#import "@preview/glossy:0.8.0": *
#show: init-glossary.with(yaml("/data/glossary.yaml"))

== Géneralités <general>

#desc[
  Introduction au système tégumentaire et aux divers rôles qu'il exerce.
]

Le système cutané (ou système tégumentaire) est l'appareil le plus large du corps humain avec une surface de 2m² en moyenne. @gallo_human_2017
C'est aussi le plus lourd en participant à 15% du poids total du corps humain. @richardson_understanding_2003
Il sert d'interface entre le corps et l'environnement, et réagit aux stimulis extérieurs: humidité, uvs, élements toxiques #footnote[pollution de l'air, tabac], radiations @nasemann_fundamentals_1983.
Ces nombreux paramètres #footnote[que l'on appelle exposomes @salsberg_review_2019] auront un effet sur différents aspects de la physiologie cutanée, notamment les processus de vieillissement.
Les facteurs sociaux sont aussi un élément à prendre en compte dans l'évolution de sa qualité à travers le temps; on évaluera en particulier le temps d'exposition solaire @thieden_uv_2004, et les habitudes d'utilisation de soins cosmétiques @lee_different_2019 (crèmes hydratantes, anti-uvs, maquillage), l'âge @oranges_skin_2015.
La peau est aussi le plus grand appareil sensoriel du corps, et contribue à l'homéostasie en protégeant le corps via la composition lipidique de l'hypoderme mais aussi en mettant en jeu les systèmes de _feeback_ par thermorécepteurs @romanovsky_skin_2014.

  #figure(
    caption: [_Lame d'une coupe d'épiderme et de derme colorée à l'hématoxyline et éosine_],
    pad(
      rest: 32pt, 
      rect(
        image(
          "/img/Normal_Epidermis_and_Dermis_with_Intradermal_Nevus_10x.jpg",
          width: 350pt,
          height: 100pt,
          fit: "cover"
        )
      )
    )
  )
  

On retrouve dans l'épiderme des @CPA:pl -- les cellules de Langerhans -- qui participent à l'activation de la réponse immunitaire innée et adaptative @noauthor_langerhans_nodate. 
Elles interagissent avec les kératinocytes  et les lymphocytes T -- les trois représentent la majorité des cellules immunitaires de l'épiderme@jiang_cytokinocytes_nodate[p.~1] --
pour assurer une _veille immunitaire_ permanente. Certains éléments -- ptyriasis, lésions, infections -- entraînent la libération de molécules pro-inflammatoire (@IL-1, @IL-6, @TNF-α) par les kératinocytes , monocytes, mastocytes et macrophages.
Ces molécules, si elles sont libérées de manière excessive peuvent être impliquées dans des dermatoses inflammatoires chroniques. Ces dernières entraînent une altération plus ou moins grave de l'apparence corporelle, qui est un vecteur majeur de l’image individuelle et sociale. L'apparition de dermatoses comme le psoriasis ou l’eczéma altèrent ce rapport au corps@guehi_image_2018, avec des répercussions possibles sur l’anxiété et l’estime de soi, et donc la qualité de vie.
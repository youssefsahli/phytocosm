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
Les facteurs sociaux sont aussi un élément à prendre en compte dans l'évolution de sa qualité à travers le temps; on évaluera en particulier le temps d'exposition solaire @thieden_uv_2004, et les habitudes d'utilisation de soins cosmétiques @lee_different_2019 (crèmes hydratantes, anti-@UV:pl, maquillage), et enfin l'âge qui est en lien avec les modifications du profil hormonal et le ralentissement des processus régénératifs @oranges_skin_2015.
La peau est aussi le plus grand appareil sensoriel du corps, et contribue à l'homéostasie en protégeant celui ci grâce à la composition lipidique de l'hypoderme mais aussi en mettant en jeu les systèmes de _feeback_ de thermorégulation par thermorécepteurs @romanovsky_skin_2014.

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

Cette régulation thermique varie selon la présence ou non de poils, qui limitent la perte de chaleur par convection et augmentent localement la sensibilité tactile via l’innervation des follicules. Ils participent ainsi à la protection mécanique, et à une forme passive de thermorégulation.

Les glandes sudoripares assurent l’évacuation de la chaleur -- @thermolyse -- par évaporation : les glandes sudorales eccrines@noauthor_dictionnaire_nodate, réparties sur l’ensemble du corps, sont activées en réponse à une élévation thermique centrale ou périphérique ; les glandes apocrines@noauthor_dictionnaire_nodate, localisées, sont plus impliquées dans la communication chimique. Les glandes sébacées sécrètent du sébum, qui se combine aux lipides épidermiques pour former le film hydrolipidique — interface lipidique de surface, faiblement acide, limitant la *perte insensible en eau* -- aussi appelée #emph[@TEWL] et participant à la défense antimicrobienne.

Le microbiote cutané, qui correspond aux organismes peuplant la surface de l'épiderme varie avec l'environnement et les facteurs comportementaux. Sa composition en bactéries change selon les sites -- les zones grasses, humides ou sèches n’abritent pas les mêmes espèces @grice_topographical_2009.
Ce dernier joue un rôle important dans la protection de la peau en empêchant les micro-organismes pathogènes de se développer. Il peut aussi aider à réguler certaines réponses immunitaires @grice_topographical_2009.

Quand l’équilibre du microbiote est perturbé, on parle de dysbiose. La dysbiose peut être causée par des soins inadaptés, des médicaments, ou des changements environnementaux. Elle est associée à des pathologies comme l’acné, la rosacée ou la dermatite atopique.

Pour limiter ces déséquilibres, certains produits cosmétiques sont formulés avec des ingrédients appelés prébiotiques ou probiotiques. Ces produits ont pour but de soutenir la flore cutanée. Les résultats sont variables et dépendent de nombreux facteurs.


L’activité de ces structures annexes est modulée par des facteurs hormonaux (en particulier androgènes), neurologiques (anxiété, choc émotionnel) et environnementaux (pollution). Leur dérégulation est observée dans plusieurs pathologies dermatologiques : acné, dermatite séborrhéique, alopécie androgénétique ou hyperhidrose.

On retrouve dans l'épiderme des @CPA:pl -- les cellules de Langerhans -- qui participent à l'activation de la réponse immunitaire innée et adaptative @noauthor_langerhans_nodate. 
Elles interagissent avec les kératinocytes  et les lymphocytes T -- les trois représentent la majorité des cellules immunitaires de l'épiderme@jiang_cytokinocytes_nodate[p.~1] --
pour assurer une _veille immunitaire_ permanente. Certains éléments -- ptyriasis, lésions, infections, hormones -- entraînent la libération de molécules pro-inflammatoire (@IL-1, @IL-6, @TNF-α) par les kératinocytes , monocytes, mastocytes et macrophages.
Ces molécules, si elles sont libérées de manière excessive peuvent être impliquées dans des dermatoses inflammatoires chroniques. Ces dernières entraînent une altération plus ou moins grave de l'apparence corporelle, qui est un vecteur majeur de l’image individuelle et sociale. L'apparition de dermatoses comme le psoriasis ou l’eczéma altèrent ce rapport au corps@guehi_image_2018, avec des répercussions possibles sur l’anxiété et l’estime de soi, et donc la qualité de vie.

Ces nombreux facteurs intrinsèques et extrinsèques influencent l'évolution du derme et de l'épiderme au cours de leur vie, évolution appelée _chronological aging_ @shin_skin_2023. Il résulte d'un stress oxydatif causé par des @ROS en majorité, dont le principal acteur est l'irradiation aux @UV:pl @rinnerthaler_oxidative_2015. Cette accumulation de @ROS entraîne une dégradation des composants cellulaires lipidiques et protéiques @gniadecka_water_1998, et activent une sénescence des cellules @shin_skin_2023, ainsi qu'une altération de la macrostructure cutanée -- le _matreotype_ @gniadecka_water_1998. La peau devient plus fine @shuster_influence_1975, moins élastique @bernstein_long-term_1996, plus propice aux infections @laube_bacterial_2002.

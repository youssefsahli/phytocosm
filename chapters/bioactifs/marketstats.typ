#import "/template.typ": desc, annexe, hdesc
== Le marché des cosmétiques naturels
#desc[
  Étude de la place des principes actifs originaires de plantes dans le marché des cosmétiques actuel, en France et dans le monde.
]

L'industrie des cosmétiques est segmentée en différentes catégories: les soins capillaires, les soins cutanés, le maquillage et colorations, les parfums, produits d'hygiène (douche, bain, deodorants) -- qui sont les plus utilisés @ficheux_consumption_2015, et enfin la protection solaire @weber_differences_2002. Ces utilisations diverses nécessitent une composition très variée selon l'indication de chaque produit, et une recherche de l'effet le plus adapté, avec une toxicité la plus faible possible #footnote[En particulier dans les produits destinés aux enfants et aux femmes enceintes].

Néanmoins, peu de données publiques permettent d'accéder aux statistiques de vente détaillées dans ce secteur. Afin de mieux appréhender la répartition des cosmétiques selon leur type et leur popularité, un tableau synthétique [
  #annexe[ 
    #hdesc[ 
    Tableau listant les meilleures ventes sur Amazon France selon diverses catégories. Les données datent du 15 avril 2025 et présentent les 179 produits les plus vendus, classifiés selon leur types : exfoliants, masques, huiles, etc.
    Après extraction des ingrédients déclarés, ceux provenant de plantes ont été  listé dans la colonne "Phytocomposants". Le classement de chaque cosmétique (dans sa catégorie) a été gardé; en effet, certains produits ont été enlevés car mal classés, ou aux informations erronées.
    ] 
    #let amz_df = csv("../../data/amazon_cosmetics_highlight.csv") 
    #show table.cell: c => {
      set text(size: 11pt)
      let (Rang, Nom, Marque, Cat, Ingr, Total) = range(6)
      let (col, row, txt) = (c.x, c.y, c.body.text)
      (
        (col == Marque, ""),
        (col == Cat, ""),
        (row == 0, text(weight: "extrabold", c)),
        (col == Ingr and row > 0, 
        rect(
          fill: gray.transparentize(90%),
          outset: -2pt,
          text(
            size: 7pt, 
            [#{if txt.len() > 0 { txt } else {"Aucun"}}]
          ))
        ),
        (true, c)
      ).find(t => t.at(0)).at(1)
        
      }

    // #show table.cell.where(x: 3): c => {
    //   if c.y > 0 {
        
    //   } else { c }
    // }
    #table( 
    //
      columns: (auto, auto,  auto,   auto, auto,   auto), 
      align: horizon, 
      ..amz_df.flatten() ) ]
  ] a été construit à partir de données accessibles sur la plateforme "Meilleures ventes" d’Amazon France — principal acteur de la vente de cosmétiques en ligne @plunkett_e-book_2023. Ce tableau a permis de repérer les spécialités contenant des phytoactifs, et leur place dans le marché _en ligne_ des cosmétiques.

Ce tableau a permis d’identifier les spécialités contenant des principes actifs d’origine végétale, et de situer leur place dans l’offre cosmétique en ligne.
Une première observation montre qu’une majorité des produits figurant parmi les meilleures ventes contiennent au moins un phytocomposant, que celui-ci soit mis en avant dans le nom commercial ou discrètement intégré dans la liste INCI
(
#annexe[
#hdesc[
  Représentation des catégories selon le nombre de phytoconstituants.
        Trois seuils sont définis: 1 seul ingrédient naturel, 2 ingrédients naturels, ou trois et plus
]
  #grid(
    align: top,
    row-gutter: 40pt,
    figure(
      caption: [Part de produits selon le nombre de phytoconstituants, par catégorie; _histograme_],
      image(height: 40%,"barplot_category.png")
    ),
    figure(
      caption: [Part de produits selon le nombre de phytoconstituants, par catégorie; _Diagramme Likert_],
      image(height: 30%, "likert_naive.png")
    ),)
] )

#figure(
  caption: [Proportion de cosmétiques contenant des phytocomposants parmi les Amazon France _bestsellers_ · _(adjusted weight)_],
  image(height: 26%, "total.png"))

#hdesc[
  Dans les métabolites II#super[aires] les plus utilisés (@lollipop-1), on retrouvera:
  #columns(2)[
    - Huile de tournesol
    - Huile de coco
    - Jus de feuille d'Aloe _vera_
    - Beurre de Karité
    - Huile d'Argan
    #colbreak()
    - Extrait de Matricaire
    - Huile de Soja
    - Jus de noix de coco
    - Gypsophile paniculée (racine)
    - Dattier du désert (fruit)
]]

#figure(
  caption: [Liste des top ingrédients utilisés par les cosmétiques bestsellers d'Amazon France · _(adjusted weight)_],
  pad(
    rest: 30pt,
    image(height: 30%, "ingredient_list_lollipop.png")
  ),
) <lollipop-1>

#annexe[
  #hdesc[
    La co-occurrence est la fréquence de coexistence de phytoconstituants. Cette analyze permet de répondre à la question: "Quelles plantes ont tendance à se retrouver dans les formulations cosmétiques ?". Cela nous permet de repèrer les synergies identifiées par les fabriquants, ainsi que les tendances actuelles. voir @formulations
  ]
  #figure(
    image("clusters.png"),
    caption: [ Graphe pour $"weight" eq 0.6$, toute catégorie confondue]
  )
]
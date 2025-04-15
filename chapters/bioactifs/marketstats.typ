#import "/template.typ": desc, annexe, hdesc
== Le marché des cosmétiques naturels
#desc[
  Étude de la place des principes actifs originaires de plantes dans le marché des cosmétiques actuel, en France et dans le monde.
]

L'industrie des cosmétiques est segmentée en différentes catégories: les soins capillaires, les soins cutanés, le maquillage et colorations, les parfums, produits d'hygiène (douche, bain, deodorants) -- qui sont les plus utilisés @ficheux_consumption_2015, et la protection solaire @weber_differences_2002. Ces utilisations diverses nécessitent une composition très variée selon l'indication de chaque produit, et une recherche de l'effet le plus adapté, avec une toxicité la plus faible possible #footnote[En particulier dans les produits destinés aux enfants et aux femmes enceintes].

Peu de données sont néanmoins disponibles publiquement détaillant les statistiques de vente des cosmétiques; Afin de mieux comprendre la répartition des ces derniers selon leur type et leur popularité, un tableau synthétique a été construit à partir de données disponibles publiquement sur les pages "Meilleures ventes" d'Amazon France (catégories : soins du visage, capillaires, solaires, etc.). Ce tableau a permis de repérer les spécialités contenant des phytoactifs, et leur place dans le marché _en ligne_ des cosmétiques.

#annexe[
  #hdesc[
    Un score de popularité a été attribué à chaque produit selon son rang dans les listes “Meilleures ventes” Amazon, en utilisant une échelle linéaire dégressive : 100 pour le premier produit, 98 pour le deuxième, etc.
    Ce score permet une visualisation plus lisible des produits dominants, tout en conservant la hiérarchie d’origine.
    Il ne reflète pas directement le volume des ventes ni la satisfaction client, mais constitue un bon indicateur relatif de mise en avant commerciale.

    Le score de popularité a été construit selon la formule suivante :
    $ "Score" = 100 minus 2 dot "Rang" $

  Cette méthode permet de comparer les différentes catégories, tout en conservant la hiérarchie relative des produits dans la liste.
  ]
#let amz_df = csv("../../data/amazon_cosmetics_highlight.csv")
#table(
  columns: 4,
  align: horizon,
  ..amz_df.flatten()
)
]
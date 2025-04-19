#import "/template.typ": desc, annexe, hdesc
#import "/boxes.typ": *

#let plant(
  pp, // plant img path
  pc, // plant caption
  fp, // fruit img path
  fc, // fruit caption
  psize: auto,
  fsize: auto,
) = {
  grid(
    columns: (1fr, 1fr),
    column-gutter: 15pt,
    align: auto,
    figure(
      caption: emph(pc),
        rect(
          image(height: psize, pp))),
    figure(
      caption: emph(fc),
        rect(
          image(height: fsize, fp))),
    )
}

== Plantes considérées comme prometteuses
#desc[
  Liste de plantes d'intérêt en cosmétique encore méconnues. Discussion des bénéfices et des risques associés, ainsi que de l'état des connaissances sur leur pharmacodynamie.
]
=== Bakuchiol
#grid(
  columns: (2fr, 1fr),
  column-gutter: 15pt

)[
  Le #link(<mol-bakuchiol>)[bakuchiol] est un des nombreux composants de la _Psoralea corylifolia_ @chopra_psoralea_2013 #footnote[Aussi appelée 
  _Cullen corylifolium_], extrait par pulcérisation du #link(<psoralea>)[_psoralène_] #footnote[La graine du _Psoralea_], puis par dissolution dans de l'ether de pétrole @_bakuchiol_2016.
  Bien qu'absent des produits les plus vendus analysés, le bakuchiol à l'effet _rétinol-like_ -- anti-inflammatoire, anti-oxydant, anti-vieillissement a une place de plus en plus importante dans le marché des crèmes de nuit @noauthor_global_nodate.
][
  #showybox(
    frame: (
    border-color: white,
    body-color: olive.lighten(80%)
  ),
  shadow: (
	  offset: (x: 2pt, y: 3pt),
    color: yellow.lighten(70%)
  ),
  )[
    #set text(size: 11pt, weight: "thin", font: "Cochin")
    #set par(leading: 1.4em)
    Psoralea corylifolia est une plante médicinale importante, utilisée dans plusieurs médecines traditionnelles pour traiter diverses maladies.
  ] 
]
#figure(
  caption: [Intérêts de recherche sur le bakuchiol sur _Google Trends_ #date("12/04/2020")  #date("12-04-2025") ],
  image("bakuchiol_trends.png"))

#pcomp(
  "Bakuchiol",
  [Monoterpène extrait des graines et des feuilles la plante Psoralea corylifolia @_bakuchiol_2016],
  [
    - Antioxydant
    - Anti-âge
    - Anti-inflammatoire
    - Régulateur de pigmentation
  ],
  "/img/mol/Bakuchiol.svg"
)

#plant(
  "/img/plants/corylifolia.png", 
  [Illustration botanique détaillée de la plante entière, incluant les feuilles opposées et l’inflorescence en épi.],
  "/img/plants/corylifolia_fruit.png",
  [Graine de Psoralea corylifolia (Fabaceae) — Vue externe illustrant la surface brun foncé, ridée et légèrement brillante de la graine. Cette dernière est contenue dans une drupe indéhiscente. Le tégument est épais et strié verticalement, renfermant une unique graine riche en bakuchiol.],
  psize: 30%,
  fsize: 20%
) <psoralea>


=== Centella asiatica

_Centella asiatica_, aussi appelée _Gotu cola_, est utilisée en médecine traditionelle indienne et chinoise en dermatologie, mais aussi 
#plant(
  "/img/plants/centella.png",
  [Centella asiatica (Apiaceae) — Plante herbacée rampante à feuilles arrondies, pétiolées, à marge crénelée, disposées en rosette. Les inflorescences, peu visibles, sont regroupées à l’aisselle des feuilles.],
  "/img/plants/centella_fruit.png",
  [Graine de Centella asiatica (Apiaceae) — Vue externe illustrant une graine ovale, de couleur jaune-brun clair, à surface plissée longitudinalement. Elle est issue d’un fruit sec de type schizocarpe, se séparant en deux mericarpes caractéristiques des Apiaceae.],
  psize: 30%,
  fsize: 10%
)
=== Glabridine

#pcomp(
  "Glabridine",
  [Flavonoïde extrait de la réglisse (*Glycyrrhiza glabra*), utilisé pour ses effets éclaircissants et apaisants.],
  [
    - Éclaircissant
    - Anti-inflammatoire
    - Antioxydant
  ],
  "/img/mol/Glabridin.svg"
)





=== Acide ellagique
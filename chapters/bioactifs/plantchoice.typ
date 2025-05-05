#import "/template.typ": desc, annexe, hdesc
#import "/boxes.typ": *
#import "@preview/wrap-it:0.1.1": wrap-content

== Actifs phares de la recherche actuelle
#desc[
  Liste de plantes d'intérêt en cosmétique encore méconnues. Discussion des bénéfices et des risques associés, ainsi que de l'état des connaissances sur leur pharmacodynamie.
]
=== Bakuchiol
#wrap-content(
  align: top+right,
  box(
    width: 200pt,
    gnote[
    Psoralea corylifolia est utilisée dans la médecine chinoise pour traiter l'alopécie et le vitiligo @noauthor_psoralea_nodate. Elle appartient aux Fabaceae, et est originaire d'Asie tropicale (notamment Inde et Chine)
  ])
)[
  Le #link(<mol-bakuchiol>)[bakuchiol] est un des nombreux composants de la _Psoralea corylifolia_ @alam_psoralea_2018 #footnote[Aussi appelée 
  _Cullen corylifolium, ou Babchi_], extrait par pulvérisation de la #link(<psoralea>)[graine] #footnote[La graine du _Psoralea_], puis par dissolution dans de l'éther de pétrole @_bakuchiol_2016.
  Bien qu'absent des produits les plus vendus analysés, le bakuchiol à l'effet _rétinol-like_ -- anti-inflammatoire, anti-oxydant, anti-vieillissement a une place de plus en plus importante dans le marché des crèmes de nuit @noauthor_global_nodate.
]

#figure(
  caption: [Intérêts de recherche sur le bakuchiol sur _Google Trends_ #date("12/04/2020")  #date("12-04-2025") ],
  image("bakuchiol_trends.png"))

C'est l'un des nombreux composés retrouvé dans le fruit, qui est riche en phénols, flavonoïdes, coumarines, et terpénoïdes. Isolé en 1972 @mehta_meroterpenoidsi_1973, par extraction via solvant lipophile, on lui découvre des propriétés anti-staphylocoques, mais aussi cardioprotectrices, et anti-tumorales @alam_psoralea_2018. D'autres éléments comme le _psoralène_, dérivé coumarinique, a longtemps été utilisé en association avec l'UV-thérapie dans les dermatoses inflammatoires, avec comme chef de file le psoriasis @richard_science_2020.

#pcomp(
  "Bakuchiol",
  [Monoterpène extrait des graines et des feuilles la plante Psoralea corylifolia @_bakuchiol_2016],
  [
    - @RAR 
    - @RXR
    - @ERβ
    - Régulateur de pigmentation
  ],
  "/img/mol/Bakuchiol.svg"
)

Le bakuchiol reste un élément provoquant des réactions divergentes quant à son efficacité par rapport aux trétinoïdes @sivamani_cosmetic_2022. Il a pourtant une meilleure tolérance cutanée, et son action immuno-modulatrice et anti-microbienne permettrait un soin moins contraignant de l'acné @greenzaid_use_2022.
#wrap-content[
  #box(
    width: 200pt,
    gnote[NF-κB pour nuclear factor-kappa B ou facteur nucléaire kappa B est une protéine de la superfamille des facteurs de transcription impliquée dans la réponse immunitaire et la réponse au stress cellulaire.]
  )
][
Dans des modèles in vitro utilisant des macrophages murins activés par l’@IFNγ ou par le @LPS, le bakuchiol a entraîné une nette diminution de l’expression de la @iNOS. Cette baisse, observée dès le stade transcriptionnel, résulte d’une inhibition de la voie NF‑κB  — facteur de transcription central dans la synthèse de médiateurs pro‑inflammatoires comme @IL-6 ou @iNOS. À noter que les biopsies cutanées de lésions acnéiques présentent classiquement une surexpression de NF‑κB. Ainsi, la capacité du bakuchiol à freiner l’activation de NF‑κB pourrait contribuer à atténuer la cascade inflammatoire associée à cette maladie. @greenzaid_use_2022]

#plant(
  "/img/plants/corylifolia.png", 
  [Illustration botanique détaillée de la plante entière, incluant les feuilles opposées et l’inflorescence en épi.],
  "/img/plants/corylifolia_fruit.png",
  [Graine de Psoralea corylifolia (Fabaceae) — Vue externe illustrant la surface brun foncé, ridée et légèrement brillante de la graine. Cette dernière est contenue dans une drupe indéhiscente. Le tégument est épais et strié verticalement, renfermant une unique graine riche en bakuchiol.],
  psize: 30%,
  fsize: 10%
) <psoralea>



=== Centella asiatica (Extraits des feuilles et tiges)

Centella asiatica (L.) Urb., appelée « gotu kola » ou « herbe du tigre », est une petite plante herbacée vivace de la famille des Apiaceae, native des zones marécageuses d’Asie du Sud‑Est et aujourd’hui cultivée dans la plupart des régions tropicales. Célébrée depuis plus de deux millénaires dans les pharmacopées ayurvédique, tantrique et chinoise pour traiter diverses dermatoses @torbati_ethnobotany_2021., elle fait désormais figure d’actif star en dermo‑cosmétologie sous l’appellation populaire « Cica ».
L'extraction de ses principes actifs se fait par macération puis filtration: Les tiges et feuilles de Centella asiatica sont mises à tremper plusieurs jours dans un mélange propylène‑glycol/eau ; le marc est ensuite égoutté puis pressé, et le filtrat soumis à une micro‑filtration stérilisante @idris_comparative_2021.

Les parties aériennes de C. asiatica concentrent un ensemble remarquable de triterpènes pentacycliques — asiaticoside, madecassoside, acide asiatique et acide madecassique — auxquels s’ajoutent flavonoïdes et tanins. Les saponines asiaticoside et madecassoside stimulent la prolifération fibroblastique, l’angiogenèse et la synthèse de collagène de types I et III, accélérant ainsi la réparation tissulaire et la cicatrisation des plaies @park_pharmacological_2021. Parallèlement, ces composés exercent une action antioxydante et anti‑inflammatoire démontrée, notamment via l’inhibition de NF‑κB et la modulation de TNF‑α et IL‑6 @diniz_centella_2023.

En cosmétique, les extraits titrés (« TECA » pour Titrated Extract of C. asiatica) s’intègrent dans des crèmes dites « cicatrisantes » pour renforcer la barrière cutanée, réduire la @TEWL et apaiser rougeurs ou prurit des peaux sensibles. Une étude clinique récente (2025) montre qu’une essence enrichie en madecassoside améliore significativement l’hydratation, l’élasticité et l’uniformité pigmentaire après 28 jours d’application @chang_evaluation_2025. De plus, l’incorporation d’asiaticoside dans des _nanoscaffolds (nano-échaffaudages)_ ou des pansements à microaiguilles accroît sa biodisponibilité et ouvre des perspectives pour la prise en charge des ulcères du pied diabétique @razif_asiaticoside-loaded_2025 et des cicatrices hypertrophiques @kumar_nanotechnology-driven_2024.

#pcomp(
  "Asiaticoside A",
  [Saponine triterpénique extraite de la plante Centella Asiatica @pubchem_asiaticoside_nodate],
  [
    - Anti-inflammatoire
    - Réparateur cutané
    - Antioxydant
  ],
  "/img/mol/asiaticosideA.png"
)

#pcomp(
  "Acide asiatique",
  [Acide triterpénique dérivé de Centella Asiatica],
  [
    - Cicatrisation
    - Synthèse de collagène
    - Réduction de l’inflammation
  ],
  "/img/mol/Asiatic_Acid.png"
)

L’innocuité cutanée de C. asiatica est globalement élevée ; cependant, quelques cas isolés de dermatite allergique de contact ont été rapportés, tandis qu’un usage oral prolongé peut exposer à un risque hépatotoxique dose‑dépendant, invitant à la prudence 
@johnson_safety_2023. Les recherches actuelles ciblent l’optimisation galénique des triterpènes (liposomes, hydrogels) et l’exploration de leurs effets sur le microbiome cutané et les dyschromies post‑inflammatoires.

Ainsi, Centella asiatica s’impose comme un actif végétal polyvalent — cicatrisant, apaisant et anti‑âge — répondant aux exigences contemporaines d’efficacité, de naturalité et de tolérance en dermo‑cosmétologie.

#plant(
  "/img/plants/centella.png",
  [Centella asiatica (Apiaceae) — Plante herbacée rampante à feuilles arrondies, pétiolées, à marge crénelée, disposées en rosette. Les inflorescences, peu visibles, sont regroupées à l’aisselle des feuilles.],
  "/img/plants/centella_fruit.png",
  [Graine de Centella asiatica (Apiaceae) — Vue externe illustrant une graine ovale, de couleur jaune-brun clair, à surface plissée longitudinalement. Elle est issue d’un fruit sec de type schizocarpe, se séparant en deux méricarpes caractéristiques des Apiaceae.],
  psize: 30%,
  fsize: 10%
)
=== Glabridine

Glycyrrhiza glabra (L.) est une plante vivace de la famille des Fabaceae, et originaire du bassin méditerranéen; ses rhizomes et racines sont récoltés depuis l'antiquité pour leurs propriétés médicinales et aromatiques @pastorino_liquorice_2018. Utilisée traditionnellement comme édulcorant naturel et remède contre les troubles digestifs, Glycyrrhiza glabra est également étudiée pour ses composés bioactifs, qui présentent une activité antioxydante, anti-inflammatoire et dépigmentante.
La glabridine (@mol-glabridine) est un isoflavonoïde prenylé #footnote[il contient un _prenyl_ -- C#sub[5]H#sub[9], 3-methyl-2-butenyl lié à son cycle aromatique; cela lui confère sa lipophilie.] contenue dans ses racines.


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

#plant(
  "/img/plants/glycyrrhiza.png",
  [Glycyrrhiza glabra (Fabaceae) — Plante herbacée vivace à feuilles composées pennées et alternes. Les fleurs, disposées en grappes axillaires, sont papilionacées et de teinte violacée.],
  "/img/plants/glyccyrhiza_roots_fruit.png",
  [Détail du rhizome cylindrique, brun jaunâtre, à surface fibreuse, accompagné de racines secondaires fines et ramifiées.],
  psize: 30%,
  fsize: 20%
)



=== Acide ellagique
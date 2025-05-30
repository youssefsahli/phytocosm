#import "/template.typ": desc, annexe, hdesc, mono-font
#import "/boxes.typ": *

== Actifs phares de la recherche actuelle
#desc[
  Liste de plantes d'intérêt en cosmétique encore méconnues. Discussion des bénéfices et des risques associés, ainsi que de l'état des connaissances sur leur pharmacodynamie.
]

#annexe[
  #show raw: t => {
    set text(
      font: "Iosevka Fixed SS02", 
      size: 8pt,
    )
    showybox(
      breakable: true,
      frame: (
        body-color: gradient.linear(
          gray.lighten(90%),
          white.transparentize(100%)
        ),
        footer-color: white,
        border-color: gray.lighten(60%),
        thickness: (left: 1pt),
        radius: 15pt,
      ),
      t
    )
  }

  #hdesc[
    Utilisation de l’API PubMed EDirect @kans_entrez_2025 pour extraire le nombre de publications scientifiques annuelles associées à chaque phytocomposant étudié. Les données ont été normalisées par année et par terme afin de permettre une comparaison relative de la dynamique de recherche entre les différentes molécules.
  ]
  
  ```sh
    MOLECULES=(
      "bakuchiol"
      "centella asiatica"
      "chamazulene"
      "glabridin"
      "ellagic acid"
      "bisabolol"
      "epigallocatechin"
      "ferulic acid"
      "resveratrol"
      "nigella sativa"
    )
    
    for mol in "${MOLECULES[@]}"; do
      echo "▶ Processing: $mol"
      python fetch_and_plot_pubmed.py "$mol"
    done
  ```

  ```py
  import subprocess
  import pandas as pd
  import matplotlib.pyplot as plt
  import seaborn as sns
  import argparse
  import re
  from pathlib import Path
  
  
  def fetch_pubmed_data(molecule, output_file):
      query = f'esearch -db pubmed -query "{molecule}" | efetch -format docsum | xtract -pattern DocumentSummary -element Id,PubDate'
      try:
          result = subprocess.run(query, shell=True, check=True, capture_output=True, text=True)
          with open(output_file, 'w') as f:
              f.write(result.stdout)
      except subprocess.CalledProcessError as e:
          print("Error fetching data:", e.stderr)
          exit(1)
  
  
  def plot_hits_per_year(tsv_file, molecule):
      df = pd.read_csv(tsv_file, sep="\t", names=["PMID", "PubDate"], dtype=str)
      df["Year"] = df["PubDate"].str.extract(r"(\d{4})").astype(float).astype("Int64")
      df = df.dropna(subset=["Year"])
      year_counts = df["Year"].value_counts().sort_index()
  
      plt.figure(figsize=(10, 5))
      sns.barplot(x=year_counts.index, y=year_counts.values, palette="crest")
      plt.xlabel("Year")
      plt.ylabel("Nombre de publications")
      plt.title(f"Publications par année pour '{molecule}'")
      plt.xticks(rotation=45)
      plt.tight_layout()
      plt.grid(axis='y')
  
      output_path = Path(tsv_file).with_suffix(".png")
      plt.savefig(output_path)
      plt.show()
  
  
  def main():
      parser = argparse.ArgumentParser(description="Fetch PubMed data and plot yearly hits.")
      parser.add_argument("molecule", help="Name of the molecule to search for (PubMed query)")
      args = parser.parse_args()
  
      tsv_file = f"{args.molecule}_pmids.tsv"
      fetch_pubmed_data(args.molecule, tsv_file)
      plot_hits_per_year(tsv_file, args.molecule)
  
  
  if __name__ == "__main__":
      main()
  ```
  #grid(
  {
    for mol in (
    "bakuchiol",
    "centella asiatica",
    "chamazulene",
    "glabridin",
    "ellagic acid",
    "bisabolol",
    "epigallocatechin",
    "ferulic acid",
    "resveratrol",
    "nigella sativa"
    ) {
      image(
        "/img/graphs/" + mol+"_pmids.png"
      )
    }
  }
  ) 
]
=== Bakuchiol
#wrp(
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
#wrp[
  #box(
    width: 200pt,
    gnote[NF-κB pour nuclear factor-kappa B ou facteur nucléaire kappa B est une protéine de la superfamille des facteurs de transcription impliquée dans la réponse immunitaire et la réponse au stress cellulaire.]
  )
][
Dans des modèles in vitro utilisant des macrophages murins activés par l’@IFNγ ou par le @LPS, le bakuchiol a entraîné une nette diminution de l’expression de la @iNOS. Cette baisse, observée dès le stade transcriptionnel, résulte d’une inhibition de la voie NF‑κB  — facteur de transcription central dans la synthèse de médiateurs pro‑inflammatoires comme @IL-6 ou @iNOS. À noter que les biopsies cutanées de lésions acnéiques présentent classiquement une surexpression de NF‑κB. Ainsi, la capacité du bakuchiol à freiner l’activation de NF‑κB pourrait contribuer à atténuer la cascade inflammatoire associée à cette maladie. @greenzaid_use_2022]

#plant(
  "/img/plants/corylifolia.png", 
  [Psoralea corylifolia (Fabaceae) -- avec ses feuilles opposées et l’inflorescence en épi.],
  "/img/plants/corylifolia_fruit.png",
  [Graine de Psoralea corylifolia (Fabaceae) — illustrant la surface brun foncé, ridée et légèrement brillante de la graine. Cette dernière est contenue dans une drupe indéhiscente. Le tégument est épais et strié verticalement, renfermant une unique graine riche en bakuchiol.],
  psize: 30%,
  fsize: 10%
) <psoralea>



=== Centella asiatica (Extraits des feuilles et tiges)

Centella asiatica (L.) Urb., appelée « gotu kola » ou « herbe du tigre », est une petite plante herbacée vivace de la famille des Apiaceae, native des zones marécageuses d’Asie du Sud‑Est et aujourd’hui cultivée dans la plupart des régions tropicales. Célébrée depuis plus de deux millénaires dans les pharmacopées ayurvédique, tantrique et chinoise pour traiter diverses dermatoses @torbati_ethnobotany_2021., elle fait désormais figure d’actif star en dermo‑cosmétologie sous l’appellation populaire « Cica ».
L'extraction de ses principes actifs se fait par macération puis filtration: Les tiges et feuilles de Centella asiatica sont mises à tremper plusieurs jours dans un mélange propylène‑glycol/eau ; le marc est ensuite égoutté puis pressé, et le filtrat soumis à une micro‑filtration stérilisante @idris_comparative_2021.

Les parties aériennes de C. asiatica concentrent un ensemble remarquable de triterpènes pentacycliques — asiaticoside, madecassoside, acide asiatique et acide madecassique — auxquels s’ajoutent flavonoïdes et tanins. Les saponines asiaticoside et madecassoside stimulent la prolifération fibroblastique, l’angiogenèse et la synthèse de collagène de types I et III, accélérant ainsi la réparation tissulaire et la cicatrisation des plaies @park_pharmacological_2021. Parallèlement, ces composés exercent une action antioxydante et anti‑inflammatoire démontrée, notamment via l’inhibition de NF‑κB et la modulation de TNF‑α et IL‑6 @diniz_centella_2023.

#wrp(
  align: right,
  box(
    width: 200pt,
    gnote[
      Les échafaudages nanofibreux sont des analogues synthétiques de la matrice extracellulaire (MEC) naturelle, conçus pour favoriser l’adhésion et la répartition cellulaire tout en facilitant la régénération tissulaire.
    ]
  )
)[
En cosmétique, les extraits titrés (« TECA » pour Titrated Extract of C. asiatica) s’intègrent dans des crèmes dites « cicatrisantes » pour renforcer la barrière cutanée, réduire la @TEWL et apaiser rougeurs ou prurit des peaux sensibles. Une étude clinique récente (2025) montre qu’une essence enrichie en madecassoside améliore significativement l’hydratation, l’élasticité et l’uniformité pigmentaire après 28 jours d’application @chang_evaluation_2025. De plus, l’incorporation d’asiaticoside dans des _nanoscaffolds (nano-échaffaudages)_ ou des pansements à microaiguilles accroît sa biodisponibilité et ouvre des perspectives pour la prise en charge des ulcères du pied diabétique @razif_asiaticoside-loaded_2025 et des cicatrices hypertrophiques @kumar_nanotechnology-driven_2024.
]

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

Glycyrrhiza glabra (L.) est une plante vivace de la famille des Fabaceae, et originaire du bassin méditerranéen; ses rhizomes et racines sont récoltés depuis l'antiquité pour leurs propriétés médicinales et aromatiques @pastorino_liquorice_2018[p. 1]. Utilisée traditionnellement comme édulcorant naturel et remède contre les troubles digestifs, Glycyrrhiza glabra est également étudiée pour ses composés bioactifs, qui présentent une activité antioxydante, anti-inflammatoire et dépigmentante.
La glabridine (@mol-glabridine) est un isoflavonoïde prenylé #footnote[il contient un _prenyl_ -- C#sub[5]H#sub[9], 3-methyl-2-butenyl lié à son cycle aromatique; cela lui confère sa lipophilie, et favorise donc sa pénétration percutanée.] contenue dans ses racines, et en moindre concentration dans ses feuilles @pastorino_liquorice_2018[p. 2]. L'extration de l'acide glycyrrhizique et de la glabridine se fait par un solvant $frac("éthanol","eau") = frac(30, 70)$ (v/v) puis décoction à 50°C @tian_extraction_2008.


#pcomp(
  "Glabridine",
  [Flavonoïde extrait de la réglisse (Glycyrrhiza glabra), utilisé pour ses effets éclaircissants et apaisants.],
  [
    - Inhibition de la tyrosinase #footnote[enzyme clé de la mélanogenèse.]
    - Anti-inflammatoire
    - Antioxydant
  ],
  "/img/mol/Glabridin.svg"
)



#{
  set text(size: 10pt)
  figure(
    caption: [Composés associés à la réglisse],
    table(
          // rows: 1fr,
          columns: (1fr,)*3,
          align: left,
          table.header[Composant][Classe][Activité],
          [Liquiritine], [flavonoïde glycosylé], [éclaircissant, antioxydant, anti-inflammatoire ],
          [Glycyrrhizine], [saponine triterpénique], [anti-inflammatoire],
          [acide 18β‐Glycyrrhétinique], [dérivé triterpénique], [apaisant],
          [Licochalcone A], [chalcone], [anti-inflammatoire, séborégulateur],
          [Glabridine], [isoflavonoïde prénylé], [anti-inflammatoire, dépigmentant]
      )
)
}

Yanfang Huang _et al_ en 2024 a mis en évidence l'activité anti-inflammatoire d'un gel à base de carbomère contenant de la liquiritine sur la cicatrisation de plaies UV-induites chez la souris, _in vivo_ et _in vitro_. Un test ELISA révéla un moindre activité des cytokines pro-inflammatoires usuelles: @TNF-α, @IL-1, @IL-6 malgré l'irradiation UVB. Une formulation à base de 2% de liquiritine à montré la meilleure activité, et on nota une amélioration de la sensation de prurit, de ré-épithélialisation et de synthèse de collagène.

La glabridine inhibe par compétition l'activité de la tyrosinase -- enzyme jouant un rôle dans la mélanogenèse -- et réduit ainsi les mélasma, lentigos, et taches post-inflammatoires #footnote[on pensera aux tâches de l'adulte acnéiques notamment.] 
Ce n'est pas la seule molécule contenue dans les racines de réglisse; on retrouve une dizaine de composants dont les cyles aromatiques (phénols) sont responsables de l'effet anti-oxydant observé @rackova_mechanism_2007. Ces derniers sont souvent combinés afin de renforcer leur activité par @Synergie (voir @formulations).


#plant(
  "/img/plants/glycyrrhiza.png",
  [Glycyrrhiza glabra (Fabaceae) — Plante herbacée vivace à feuilles composées pennées et alternes. Les fleurs, disposées en grappes axillaires, sont papilionacées et de teinte violacée.],
  "/img/plants/glyccyrhiza_roots_fruit.png",
  [Détail du rhizome cylindrique, brun jaunâtre, à surface fibreuse, accompagné de racines secondaires fines et ramifiées.],
  psize: 30%,
  fsize: 20%
)

=== Acide ellagique
L'@EA, retrouvé dans #taxon[Punica granatum] mais aussi dans de nombreuses espèces (noix, fraises #taxon[Fragaria ananassa]) est un métabolite retrouvé sous forme libre mais aussi sous forme complexée -- appelées alors _éllagitannins_ @rios_pharmacological_2018. C'est un composé particulièrement intéressant en tant que protecteur de l'oxydation UV-induite. Son extraction se fait traditionellement par pulvérisation de la plante, puis passage à trois reprises d'un solvant $"acetone"/"eau" = 80/20$ ou methanol @daniel_extraction_1989. L'industrie, elle, utilise un procédé d’extraction assistée par _microjet haute pression_, à partir d'écorce de grenade @_method_2015.

#pcomp(
  "Acide ellagique",
  [ Polyphénol dilactone de l'acide hexahydroxydiphénique @pubchem_ellagic_nodate],
  [
    - Antioxydant par 
    - Inhibiteurs @TNF-α, @IL-6, @VoieNFkB
    - Agoniste @NRF2
  ],
  "/img/mol/Ellagic_acid.svg"
)

La présence de groupes hydroxyles et de lactones confère à l’@EA une capacité notable à neutraliser divers radicaux libres, notamment les espèces réactives de l’oxygène (ROS) et de l’azote (RNS), tels que les radicaux hydroxyles (HO·), peroxyles (ROO·), dioxyde d’azote (NO₂·) et peroxynitrite (ONOO⁻). Cette activité antioxydante @baek_ellagic_2016 est renforcée par la stimulation des enzymes endogènes de défense, notamment la @SOD, la @CAT et la glutathion peroxydase, contribuant ainsi à la protection contre le stress oxydatif.
L’application topique d’@EA à des concentrations de 1 à 10 μM a démontré une réduction significative de la production des cytokines pro-inflammatoires @IL-1 et @IL-6, ainsi qu’une diminution de l’expression de la molécule d’adhésion cellulaire ICAM-1 (Intercellular Adhesion Molecule-1) dans le derme. Cette molécule joue un rôle essentiel dans le recrutement des leucocytes en facilitant leur adhésion à l’endothélium vasculaire et leur migration vers les sites inflammés. La modulation de son expression par l’@EA se traduit par une réduction de l’infiltration des macrophages inflammatoires dans la peau de souris glabres exposées aux rayons UVB, suggérant un effet anti-inflammatoire significatif en contexte de photodommage cutané. @rios_pharmacological_2018
Une étude in vitro a évalué les effets de l'@EA sur des kératinocytes humains HaCaT exposés à une irradiation @UVB (100 mJ/cm²). Les cellules traitées avec 5 μM d'@EA ont montré une réduction significative de l'expression des cytokines pro-inflammatoires @IL-6, IL-8 et @TNF-α, tout en augmentant l'expression de l'IL-10, une cytokine anti-inflammatoire. Ces résultats suggèrent que l'@EA module la réponse inflammatoire induite par les @UVB en régulant l'expression des cytokines.

Une étude publiée dans International Journal of Molecular Sciences @gil_anti-inflammatory_2021 (Tae-Young Gil, Chul-Hee Hong and Hyo-Jin An) a examiné les effets de l'@EA sur des kératinocytes humains HaCaT stimulés par le TNF-α et l'IFN-γ, deux cytokines pro-inflammatoires impliquées dans les pathologies cutanées inflammatoires -- notamment la dermatite atopique. Les résultats ont montré que l'EA, à des concentrations allant jusqu'à 1000 μM, inhibe significativement la production de cytokines inflammatoires telles que l'@IL-6 et le @TNF-α. De plus, l'EA supprime l'expression de chimiokines associées à la réponse Th2, notamment TSLP, RANTES, MDC et TARC.
Sur le plan des voies de signalisation, l'EA réduit la phosphorylation des protéines clés des voies MAPK (MEK1/2-ERK, SEK1/MKK4-JNK) et JAK/STAT (JAK2, STAT1, STAT3), ainsi que la translocation nucléaire de STAT1 phosphorylé. Ces mécanismes suggèrent que l'EA atténue l'inflammation cutanée en modulant les voies de signalisation intracellulaires essentielles à la production de médiateurs inflammatoires.

Ces résultats indiquent que l'@EA possède un potentiel thérapeutique pour le traitement des affections cutanées inflammatoires, telles que la dermatite atopique, en inhibant les voies de signalisation inflammatoires dans les kératinocytes.

De plus, l'étude a observé que l'EA n'affectait pas significativement l'expression de l'IL-1β dans ce modèle cellulaire. Ces données indiquent que l'EA pourrait être un agent actif prometteur pour les formulations cosmétiques visant à atténuer l'inflammation cutanée induite par les UVB.

=== α-Bisabolol

#wrp(
  align: right + bottom,
  box(
    width: 250pt,
    gnote[
      Différents isomères existent. L'α-Bisabolol est le plus abondant dans l'huile essentielle de #taxon[Matricaria chamomilla]#footnote[L'huile essentielle peut contenir plus de 40% de cette molécule]. Le β-Bisabolol -- qui diffère dans la position des insaturations -- est beaucoup plus rare. Le mélange racémique [(+)- and (−)-α-bisabolol] est le plus souvent retrouvé dans les formulations commerciales. 
    ]
  )
)[
  Aussi appelé *levomenol*, l'#link( label("mol-levomenol ◖ α-bisabolol") )[α-Bisabolol] fut isolé au XX#super[ème] siècle à partir de #taxon[Matricaria chamomilla] de la famille des #box[Asteraceaes -- aussi appelée Matricaire,] ou Camomille allemande. Espèce largement distribuée à travers le monde (en Asie, Europe, Afrique du Nord), on la retrouve à l'état sauvage en France, mais aussi en culture en Europe de l'Est et en Inde @singh_chamomile_2011. Contrairement aux autres camomilles #footnote[#taxon[Chamaemelum nobile], la camomille romaine et #taxon[Tanacetum parthenium], la grande camomille], c'est une plante annuelle, utilisée depuis l'Antiquité pour son effet anti-inflammatoire, sédatif, et anti-bactérien. 
]

Plante médicinale à l’usage millénaire, Matricaria chamomilla est riche en sesquiterpènes et flavonoïdes, dont l’α-bisabolol constitue un constituant majeur de son huile essentielle. Ce composé lipophile est un alcool monocyclique de type sesquiterpénique, de formule brute C₁₅H₂₆O, possédant une activité anti-inflammatoire, antibactérienne et apaisante documentée in vitro comme in vivo @tai_biosynthesis_2023. Il inhibe notamment la synthèse de prostaglandines en réduisant l’activité de la @COX-2, et bloque l’expression de médiateurs inflammatoires via une inhibition de la voie @VoieNFkB @kim_inhibitory_2011. Son profil toxicologique est favorable, avec une faible incidence d’irritation cutanée, ce qui explique sa large utilisation dans les soins pour peaux sensibles, atopiques ou érythémateuses @andersen_final_1999. Des cas d'allergies de contact existent malgré tout. Le bisabolol peut aussi être obtenu par voie semi-synthétique ou via la distillation de bois de #taxon[Vanillosmopsis erythropappa] au Brésil, arbre appartenant à la famille des Asteraceae, bien que cette origine soulève des problématiques écologiques liées à la surexploitation forestière @sandasi_untargeted_2012.

#pcomp(
  "Levomenol ◖ α-Bisabolol",
  [L'α–(–)-bisabolol, également appelé lévoménol],
  [
    - Inhibiteur @TNF-α, @IL-1, @IL-6, @iNOS, @COX-2:short
    - Antagoniste @VoieNFkB, @p38:short, @ERK1_2, @JNK:short
    - Réduction des @ROS:pl
  ],
  "/img/mol/levomenol.svg"
)

#{
  set text(size: 10pt)
  figure(
  caption: [Cibles du Bisabolol et cascades métaboliques],
  table(
    align: left,
    columns: 3,
    ..csv("/data/bisabolol.csv").flatten()
  ))
}

Bien qu'utilisé depuis de nombreuses années par les industriels cosmétiques, de nouvelles propriétés pharmacodynamiques sont répertoriées avec le temps @ramazani_pharmacological_2022. L'activité *antioxydante* fut déterminée par réduction des @ROS et de @RNS. Le @MDA, marqueur de la peroxydation lipidique est diminué. Enfin, le bisabolol diminue la libération de cytokines pro-inflammatoires -- @IL-1, @IL-6, @TNF-α --, de médiateurs associés -- @COX-2, @iNOS et augmente l'expression d'enzymes protectrices -- @SOD, @CAT -- @eddin_health_2022.  L'effet anti-apoptotique #footnote[Effet déclenché par UV, mais aussi par vieillissement] est dû à une régulation d'expression positive de bcl-2 (stabilisateur de membrane), et en diminuant l'expression de bax, P53, de la caspase-3, et de l'apoptosome [APAF-1 - caspase-9].

#plant(
  "/img/plants/matricaire.png",
  [Matricaria chamomilla (L.) Rauschert (Asteraceae)],
  "/img/plants/matricaire_fleur.png",
  [Vue détaillée du capitule mettant en évidence les fleurons ligulés et tubulés ],
  psize: 30%,
  fsize: 20%
)

De nombreuses autres plantes contiennent du bisabolol, bien que souvent en quantités moindres que la camomille allemande (*Matricaria recutita*) ou le bois de candeia (*Vanillosmopsis erythropappa*). On le retrouve ainsi dans les huiles essentielles de *Salvia runcinata*, *Eremanthus erythropappus*, *Myoporum crassifolium* (Faux Santal), ou encore dans certaines variétés de *Tanacetum annuum* (La camomille bleue). La qualité et la stéréochimie du bisabolol extrait (notamment la pureté en α-bisabolol) dépendent fortement de l’espèce végétale, du terroir, du mode d’extraction et du stockage, ce qui influence son efficacité pharmacologique et sa tolérance cutanée.

=== Chamazulène

Constituent extrait de #taxon[Matricaria recutita], exerçant des propriétés anti-inflammatoires par inhibition des leucotriènes pro-inflammatoires B4 produites par les granulocytes neutrophiles @safayhi_chamazulene_1994;

#pcomp(
  "Chamazulène",
  [un sesquiterpène aromatique dérivé du matricin, présent dans les huiles essentielles de #taxon[Matricaria chamomilla] et d'#taxon[Artemisia absinthium]],
  [
    - Inhibe la formation de leucotriène B4 (IC50 ≈ 10–15 µM)
    - Antioxydant puissant (ABTS IC50 ≈ 3,7 µg/mL)
    - Réduit l'expression de @COX-2 et la production de PGE2
  ],
  "/img/mol/Chamazulene.svg"
)

Ding Ma, Jinlong He & Dapeng He (2019) met en évidence l'inhibition des @MMP:plural:both 3 et 9, de la @COX-2:both, et de la @iNOS:both dans des modèles cellulaires stimulés par @IL-1. Ces effets sont associés à une modulation négative de la voie de signalisation @VoieNFkB, essentielle dans la réponse inflammatoire. @ma_chamazulene_2020

#image("img/chamazulene_per_year.png")

=== Epigallocatéchine gallate

  Retrouvé dans la spécialité VEREGEN déremboursée
#pcomp(
  "Epigallocatéchine gallate",
  [@EGCG:both, un type de catéchine retrouvé dans les feuilles de #taxon[Camelia sinensis]],
  [
    - Neutralise les @ROS, réduit le stress oxydatif
    - Inhibe @VoieNFkB, diminue @IL-6 et @TNF-α
    - Protège les kératinocytes des @UVB
    - Chélate le Fe#super[3+] et le Cu#super[2+] #footnote[pro-oxydants]
    - Régule @ERK1_2, @JNK:short et @p38
    - Réduit les @MMP
  ],
  "/img/mol/Epigallocatechin_Gallate.svg"
)



=== Acide férulique

=== Resvératrol

=== Nigella sativa (huile)
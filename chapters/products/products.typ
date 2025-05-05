#import "/template.typ": desc, hdesc
#import "/boxes.typ": pbox

= Produits

== Avène Dermabsolu

Avène DERMABSOLU est une crème de jour au Bakuchiol (@mol-bakuchiol) et aux extraits de vanille, utilisée dans les soins anti-âge quotidiens pour ses propriétés régénérantes et raffermissantes. En plus de ces actifs bien mis en avant, la formule contient également d'autres composés d’origine végétale non spécifiquement mentionnés sur le packaging, tels que des huiles ou extraits botaniques aux effets hydratants, apaisants ou antioxydants, qui contribuent à l'efficacité globale du produit.

#let ing = "Avene Thermal Spring Water (Avene Aqua), Pentaerythrityl Tetracaprylate/​Tetracaprate, Glycerin, Coco-Caprylate/​Caprate, Tribehenin PEG-20 Esters, Butyrospermum Parkii (Shea) Butter (Butyrospermum Parkii Butter), Methyl Gluceth-20, Dimethicone, Glyceryl Linoleate, Bakuchiol, Behenyl Alcohol, Bis-PEG-12 Dimethicone Beeswax, Polymethyl Methacrylate, Simmondsia Chinensis (Jojoba) Seed Oil (Simmondsia Chinensis Seed Oil), Behenic Acid, Benzoic Acid, Caprylic/​Capric Triglyceride, Caprylyl Glycol, Dimethicone Crosspolymer, Disodium EDTA, Fragrance (Parfum), Glyceryl Linolenate, Glyceryl Oleate, Glyceryl Palmitate, Glyceryl Stearate, Glycine Soja (Soybean) Oil (Glycine Soja Oil), Helianthus Annuus (Sunflower) Seed Oil (Helianthus Annuus Seed Oil), Hydrogenated Polyisobutene, Hydrogenated Starch Hydrolysate, Hydroxyethyl Acrylate/​Sodium Acryloyldimethyl Taurate Copolymer, Mica, PEG-7 Trimethylolpropane Coconut Ether, Propylene Glycol, Silica, Sodium Hydroxide, Sodium Stearoyl Glutamate, Sorbitan Isostearate, Titanium Dioxide (Ci 77891), Tocopherol, Tocopheryl Glucoside, Tribehenin, Vanilla Tahitensis Fruit Extract, Water (Aqua)"

#pad(
  pbox(
    "Dermabsolu",
    "Avène",
    ..ing.split(", ")
  ) 
)

#figure(
  caption: [Composition d'Avene Dermabsolu],
  table(
    columns: 2,
    align: left,
    table.header([Ingrédient], [Description]),
    [Glycerine], [Corps gras],
    [Pentaerythrityl Tetracaprylate/​Tetracaprate], [Émollient],
    [Beurre de Karité], [Émollient],
    [Bakuchiol], [Antioxydant, antimicrobien],
    [Jojoba huile (graine)], [Émollient],
  ),
)

sddfds

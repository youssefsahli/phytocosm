#import "template.typ": title, taxon, mbox, grbox, pbox
#import "acronyms.typ": *

#show link: underline

#let product(
    pname,
    pfab,
    ..ingredients
) = {
    let proc-items = arguments(..ingredients.pos()
        .map(i => [
            #if (acronyms.at(i, default: "").len() > 0) {
                link(label(i), strong(i))
            } else [#i]
        ]))
    [#pbox(
        pname,
        pfab,
        proc-items) #label(pname)
    ]
}

#context {
    if (counter(page).get().at(0) > 1) {
        pagebreak(weak: true)
    }
}


= Spécialités
== ECGC
#grid(
    columns: (auto, auto, auto),
    rows: (auto, auto),
    gutter: 3pt,
)[

    #product("Clarifying Serum", "Primally Pure",
        "Camellia Sinensis Extract",
        "NaHA",
        "B3",
        "B5",
        "NaSA",
        "NAG",
        "EGCG",
        "GluL"
    )

    #product("Soothing B3 Serum", "Kristina Holey + Marie Veronique",
        "Camellia Sinensis Leaf Extract",
        "NaHA",
        "B3",
        "B5",
        "NaSA",
        "NAG",
        "EGCG",
        "GluL",
        "Polygonum Aviculare Extract",
        "Daucus Carota Sativa Root Extract",
        "Beta-G",
        "GOS",
        "BF",
        "RR Ferment",
        "Réglisse",
        "Concombre"
    )

    #product("Lotion Tonique Hydratante", "La Rosée",
        "Aqua",
        "Rose water",
        "Propanediol",
        "Pentylene Glycol",
        "Camomille",
        "Inulin",
        "Glycérine",
        "Sel marin",
        "Chèvrefeuille C",
        "Chèvrefeuille J",
        "Aroma",
        "SiO2",
        "TGDA",
        "CA",
        "SB",
        "PS",
        "Linalool",
        "Citronellol",
        "Geraniol"
    )

]

== Acide Ellagique

#product(
        "Skin Hydration Complex", "Cellex-C",
        "Aqua",
        "NaHA",
        "Proline",
        "Glycine",
        "Ellagic Acid",
        "Phenoxyethanol"
    )


#show-acronyms()

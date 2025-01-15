#let acronyms = (
    "EGCG": "Epigallocatechine gallate",
    "NaHA": "Hyaluronate de sodium",
    "B3": "Niacinamide (Vitamine B3)",
    "B5": "Panthénol (Pro-Vitamine B5)",
    "NaSA": "Salicylate de sodium",
    "NAG": "N-Acétyl Glucosamine",
    "GluL": "Gluconolactone",
    "Beta-G": "Bêta-Glucane",
    "GOS": "Galacto-Oligosaccharides",
    "BF": "Ferment de Bacillus",
    "RR Ferment": "Ferment de racine de radis (Leuconostoc)",
    "GGe": "Extrait de racine de réglisse (Glycyrrhiza glabra)",
    "Concombre": "Extrait de concombre (Cucumis sativus)",
    "Rose water": "Eau de fleur de rose (Rosa damascena)",
    "PD": "Propanédiol",
    "PG": "Glycol de pentylène",
    "Camomille": "Eau de fleur de camomille (Anthemis nobilis)",
    "Sel marin": "Sel de mer (Maris Sal)",
    "Chèvrefeuille C": "Extrait de fleur de chèvrefeuille (Lonicera caprifolium)",
    "Chèvrefeuille J": "Extrait de fleur de chèvrefeuille (Lonicera japonica)",
    "CA": "Acide citrique",
    "SB": "Benzoate de sodium",
    "PS": "Sorbate de potassium",
    "SiO2": "Silice",
    "TGDA": "Diacétate de glutamate de tétrasodium",
    "Linalol": "Linalol",
    "Citronellol": "Citronellol",
    "Geraniol": "Géraniol"
)


#let show-acronyms() = {
    pagebreak(weak:true)
    [
        = Acronymes <acro-main>
    ]

    for (acro, def) in acronyms [
        / #acro: #def #label(acro)
    ]
    
}


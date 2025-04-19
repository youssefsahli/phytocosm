#import "/template.typ": title, project, subtitle, desc, section, chapter
#show: project

#import "@preview/glossy:0.8.0": *
#show: init-glossary.with(yaml("/data/glossary.yaml"))

#title[
    Intérêt de certains principes actifs végétaux en dermo-cosmétologie
    
    #subtitle[Focus sur le gel d'aloé vera, le bisobolol, le bachukiol..]
    // #image("./img/cover.png", width: 60%, alt: "cover image")
]

#outline(title: [Table des matières])
#pagebreak(weak:true)


#include "data/glossary.typ"

#section("chapters/history/history.typ")
#section("chapters/peau/peau.typ")
#section("chapters/bioactifs/bioactifs.typ")
#section("chapters/formulations/formulations.typ")
#section("chapters/galénique/galenic.typ")
#section("chapters/ecology/ecology.typ")


#pagebreak(weak: true)
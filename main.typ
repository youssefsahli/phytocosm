#import "/template.typ": title, project, subtitle, desc
#show: project

#title[
    Intérêt de certains principes actifs végétaux en dermo-cosmétologie
    
    #subtitle[Focus sur le gel d'aloé vera, le bisobolol, le bachukiol..]
    // #image("./img/cover.png", width: 60%, alt: "cover image")
]

#show outline.entry.where(
  level: 1
): set block(above: 2em)

#show outline.entry: it => {
  link(
    it.element.location(),
    it.indented(it.prefix(), it.inner())
  )
}
#outline(title: text(size: 14pt, upper[Table des matières]))
#pagebreak(weak:true)


#include "data/glossary.typ"

#include "./chapters/peau/peau.typ"

#pagebreak(weak: true)

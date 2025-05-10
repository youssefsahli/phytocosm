#import "/template.typ": title, project, subtitle, desc, section, chapter, mono-font
#import "/boxes.typ": simplebox
#show: project

#import "@preview/glossy:0.8.0": *
#show: init-glossary.with(yaml("/data/glossary.yaml"))

#title[
    Intérêt de certains principes actifs végétaux en dermo-cosmétologie
    
    #subtitle[Focus sur le gel d'aloé vera, le bisobolol, le bakuchiol..]
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
#section("chapters/orgs/orgs.typ")
#section("chapters/ecology/ecology.typ")
#section("chapters/products/products.typ")

#pagebreak(weak: true)

#{
  let to-string(content) = {
    if content.has("text") {
      if type(content.text) == str {
        content.text
      } else {
        to-string(content.text)
      }
    } else if content.has("children") {
      content.children.map(to-string).join("")
    } else if content.has("body") {
      to-string(content.body)
    } else if content == [ ] {
      " "
    } else if content == smartquote(double: false) {
      "'"
    }
  }

  show outline.entry: it => {
    let cont = to-string(it.body())
    if cont == none { return } 
    else {
      let words = cont.split(" ")
      if words.len() > 10 { 
        words = words.slice(0, count: 10)
        words.push("...")
      }
      cont = words.join(" ")
    }
    grid(
      columns: (2em,70%, auto, auto),
      "▯▷ ",
      cont.trim(),
      repeat(" "),
      link(it.element.location(), it.page())
    )
  }

  show outline: o => {
    set page(header: none)
    o
    pagebreak(weak: true)
  }
  

  outline(
    title: "Figures",
    target: figure.where(kind: image).or(figure.where(kind: figure)),
  )
  
  outline(
    title: "Molécules",
    target: figure.where(kind: "Molécule"),
  )
  
  outline(
    title: "Tableaux",
    target: figure.where(kind: table),
  )
}
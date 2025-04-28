#import "@preview/showybox:2.0.4": showybox
#import "@preview/frame-it:1.1.2": *
#import "/template.typ": * 

#let date(s) = {
  let (d, m, y) = str.split(s, regex("[/-]")).map(int)
  set text(size: 8pt)
  box(
    baseline: 50%,
    height: 2.8em,
    rect(
      radius: 5pt,
      stroke: (paint: gray, thickness: 0.1pt),
      fill: white.darken(1%),
      str((d,m,y).map(str).join(str(" - ")))
  ))
}
// Basic box
#let simplebox(content, bg: white) = {
    showybox(
        content,
        frame: (
          body-color: bg
        )
    )
}

// Information box
#let mbox(titex, footer, t) = {
    showybox(
        frame: (
            border-color: black,
        ),
        title-style: (
            color: white,
            weight: "bold",
            align: center,
            boxed-style: (
                radius: 5pt
            )
        ),
        title: titex,
        t,
        footer: footer,
    )}

// Commentary box
#let grbox(titex, t) = {
    showybox(
        frame: (
            border-color: gray.darken(20%),
            
            title-color: black,
        ),
        title-style: (
          boxed-style: (
            anchor: (
              x: center,
              y: horizon
            )),
            color: white,
            align: center
        ),

        title: titex,
        t,
    )
}

#let note(title, txt) = grbox(title, txt)

//Product Box
#let pbox(pname, pfab, ingredients) = {
    let items = upper(ingredients.pos().join(" · "))
    show: rest => {align(center, rest)}
    showybox(
        frame: (
            border-color: black,
            body-color: white,
            title-color: white,
        ),
        title-style: (
            color: black,
            font: "MesloLGS NF",
            weight: "bold",
            align: center
        ),

        body-style: (
            align: center,
        ),

        title: [#pfab#super[©] #box[_ #pname _]],
        small(items)
    )
}

#let taxon(name) = {
    let (genus, species) = name.text.split()
    text()[#strong(genus) #emph(species)]
}

#let phyto-component(
    head: "",
    content: [],
    footer: "",
    prop-list: [],
    img: (
        path: "",
        caption: "",
    )
) = {
    show figure.caption: emph
    set figure(
        supplement: [Molécule],
        kind: "Molécule",
        numbering: "A"
    )
    
    mbox(head, footer)[
        #if img.path.len() > 0 {
            [
                #show: rest => align(center + horizon)[#rest]
                #stack(
                  dir: ltr,
                  spacing: 20pt,
                  [
                    #figure(
                        image(
                            img.path,
                            height: 50pt,
                            alt: head + " Molecular Structure",
                        ),
                        caption: img.at("caption", default: head) 
                    ) #label("mol-" + lower(head))
                  ],
                  {
                    set text(size: 10pt)
                    set align(left)
                    set list(marker: "▮▯")
                    prop-list
                  }
                )

                #if content.children.len() > 0 {
                    v(10pt)
                    line(length: 50%)
                    set text(size: 10pt)
                    content
                }
            ]
        }
    ]

}

#let props(title: "Propriétés",t) = [
    #show list: a => {
        set align(center)
        grbox([#title])[
            #box[
                #set align(left)
                #a
            ]]
    }
    
    #t
]

#let plant-src(data-path: "") = {
    if data-path.len() > 0 {
        table(
            columns: (1fr),
            inset: 10pt,
            align: center + horizon,
            stroke: none,
            table.header[Sources],
            csv(data-path),
        )}
}

#let pcomp(title, desc, pr, pa) = {
  phyto-component(
    head: title,
    content: desc,
    prop-list: pr,
    img: (
      path: pa,
    )
  )
}

#let plant(
  pp, // plant img path
  pc, // plant caption
  fp, // fruit img path
  fc, // fruit caption
  psize: auto,
  fsize: auto,
) = {
  v(1em)
  rect(
    stroke: rgb("#fdf9f1").darken(10%),
    fill: rgb("#fdf9f1").lighten(70%),
    inset: 10pt,
    outset: 10pt,
    radius: 10pt,
    grid(
      columns: (1fr, 1fr),
      column-gutter: 15pt,
      align: bottom,
      figure(
        caption: emph(pc),
          rect(
            stroke: gray.transparentize(80%)+1pt,
            radius: 10pt,
            image(height: psize, pp))),
      figure(
        caption: emph(fc),
          rect(
            stroke: gray.transparentize(80%)+1pt,
            radius: 10pt,
            image(height: fsize, fp))),
      )
  )
    v(1em)
}

#let gnote(content) = {
  set text(size: 11pt, weight: "thin", font: "Cochin")
  set par(leading: 1.4em)
  showybox(
    frame: (
    border-color: white,
    body-color: olive.lighten(80%)
  ),
  shadow: (
	  offset: (x: 2pt, y: 3pt),
    color: yellow.lighten(70%)
  ), content
  )
}
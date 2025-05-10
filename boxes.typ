#import "@preview/showybox:2.0.4": showybox
#import "@preview/frame-it:1.1.2": *
#import "@preview/wrap-it:0.1.1": wrap-content
#import "/template.typ": * 

#let wrp = wrap-content

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
            footer-color: sepia
                            .lighten(94%)
                            .desaturate(50%),
        ),
        title-style: (
            color: white,
            weight: "bold",
            align: center,
            boxed-style: (
                radius: 5pt
            )
        ),
        sep: (
          dash: "densely-dash-dotted"
        ),
        footer-style: (
          align: center + horizon,
          sep-thickness: 0pt,
        ),
        title: titex,
        t,
        footer: small(footer),
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
#let pbox(pname, pfab, ..ingredients) = {
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
            weight: "regular",
            align: center,
        ),

        body-style: (
            align: center,
            
        ),

        title: text(size: 10pt)[#upper(pfab)#super[©] -- #box[#pname]],
        text(size: 10pt, small(items))
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
                #v(1em)
                #stack(
                  dir: ltr,
                  spacing: 30pt,
                  [
                    #figure(
                        image(
                            img.path,
                            height: 70pt,
                            alt: head + " Molecular Structure",
                        ),
                        caption: img.at("caption", default: head) 
                    ) #label("mol-" + lower(head))
                  ],
                  {
                    set text(size: 10pt)
                    set align(left)
                    set list(marker: "▮▯")
                    block(
                      prop-list
                    )
                  }
                )
                #v(10pt)
                // #if content.has("children") and content.children.len() > 0 {
                //     // line(
                //     //   length: 100%
                //     // )
                //     set text(size: 10pt)
                //     content
                // }
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
    footer: desc,
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
    body-color: rgb("#543327")
      .lighten(80%)
      .desaturate(20%)
      .mix(
        red
          .lighten(90%)
          .desaturate(50%)
          .transparentize(10%)
      )
  ),
  shadow: (
	  offset: (x: 3pt, y: 2pt),
    color: rgb("#543327").lighten(20%)
  ), 
  pad(
    rest: 3pt,
    top: 9pt,
    content
  )
  )
}
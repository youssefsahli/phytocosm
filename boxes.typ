#import "@preview/showybox:2.0.1": showybox
// Basic box
#let simplebox(content, bg: white) = {
    showybox(
        content
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
            body-color: gray.lighten(70%),
            title-color: gray.lighten(80%),
        ),
        title-style: (
            color: black,
        ),

        title: titex,
        t,
    )
}
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
    img: (
        path: "",
        caption: "",
    )
) = {
    show figure.caption: emph
    set figure(
        supplement: [Molécule],
        numbering: "A"
    )
    
    mbox(head, footer)[
        #if img.path.len() > 0 {
            [
                #show: rest => align(center)[#rest]
                #figure(
                    image(
                        img.path,
                        height: auto,
                        alt: head + " Molecular Structure",
                    ),
                    caption: img.caption
                ) #label(head)

                #if content.children.len() > 0 {
                    v(10pt)
                    line(length: 50%)
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

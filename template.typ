#import "@preview/hydra:0.5.1": hydra
#import "@preview/numberingx:0.0.1"
#import "/boxes.typ"
#import "@preview/use-tabler-icons:0.8.0": *

#let body-font-size = 14pt
#let title-font-size = 2em
#let subtitle-font-size = 0.6em
#let small-font-size = 0.8em
#let italic-font-size = 0.9em

#let mono-font = "Reforma 1918"
#let serif-font = "ETBembo"
#let italic-font = "Cantarell"

#let body-font = serif-font
#let title-font = serif-font
#let subtitle-font = mono-font
#let footer-font = mono-font

#let sepia = rgb("#704214")
#let sepia-bg = sepia.transparentize(90%)

#let figure-spacing = 1em

#let small(content) = {
    text(size: small-font-size)[#content]
}

#let backref(label, content) = {
    box(
        inset: 1em,
        stroke: black,
        fill: sepia-bg,
        link(label), 
        content
    )
}

#let title(t) = align(center, text(
    size: title-font-size,
    font: title-font,
    features: ("calt",)
    
)[
    #set par(justify: false, leading: 0.6em)
    #t
    #pagebreak(weak: true)
])

#let subtitle(t) = align(center, text(
    font: subtitle-font
)[
    #set text(font: subtitle-font, size: subtitle-font-size)
    #t
])

#let project(body) = {

    show outline: body => {
        set text(body-font-size)
        set align(center)
        body
    }

    show table.cell: it => {
        set text(size: small-font-size)
        if it.x == 0 or it.y == 0 {
            strong(it)
        } else { it }
    }

    show heading: it => {
        context {
            if it.level > 1 {
                it
            } else {
                if it.body == [Notes] { pagebreak(weak: true)}
                it
            }
        }
        v(0.5em)
    }

    show list: it => {
        it
        v(0.6em)
    }

    show quote: it => {
        set text(size: body-font-size)
        rect(
            inset: 0.5em,
            // stroke: black,
            fill: sepia-bg,
            [
                #v(0.3em)
                #emph(it)]
        )
    }

    show emph: it => {
        set text(font: italic-font, size: italic-font-size, style: "italic")
        it
    }

    show footnote.entry: it => {
        let loc = it.note.location()
        numbering(
            "1: ",
            ..counter(footnote).at(loc),
        )
        it.note.body
    }

    set footnote(numbering: "1")
    set footnote.entry(separator: none)

    set super(typographic: false)

    set quote(quotes: true)

    set par(
        justify:true,
        leading: 1em,
    )

    set table(
        stroke: (x, y) => if y == 0 {
            (bottom: 0.7pt + black)
        },
        align: (x, y) => (
            if x > 0 {center}
            else {left}
        )
    )
    
    set text(
        font: body-font,
        // alternates: true,
        ligatures: true,
        discretionary-ligatures: false,
        historical-ligatures: false,
        slashed-zero: true,
        // fallback: false,
        lang: "fr",
        region: "FR",
        weight: "regular",
        size: body-font-size,
        hyphenate: false,
        features: ("calt",)
    )

    set heading(
        numbering: "A.1 a ",
        bookmarked: true,
    )

    set page(
        paper: "a4",
        margin: auto,
        numbering: "󰖂  1",
        header: context {
            if here().page() > 1 {
                if calc.odd(here().page()) {
                    align(right, emph(hydra(1)))
             
                } else {
                    align(left, emph(hydra(1)))
                }
            }
        },
        footer: context {
            let page-n = here().page()
            let pattern = here().page-numbering()
            if page-n == 1 {
                text(font: footer-font,
                    size:0.7em,
                    features: ("calt",),[])
                    // small[Y. Sahli])
                
            } else {
                line(length:100%,
                    stroke:
                    (
                        dash: "dashed"
                    )
                )
                set text(size: 0.8em)
                if calc.odd(page-n) {
                    align(right, counter(page).display(pattern))
                } else {
                    align(left, counter(page).display(pattern))
                }
            }
        }
    )
    
    body

    pagebreak(weak:true)
    set page(header: [])
    bibliography("zotero.bib", style: "vancouver-superscript") 
}


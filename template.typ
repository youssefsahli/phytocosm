#import "@preview/hydra:0.5.1": hydra
#import "@preview/numberingx:0.0.1"
#import "@preview/use-tabler-icons:0.8.0": *

#let body-font-size = 13pt
#let title-font-size = 2em
#let subtitle-font-size = 0.6em
#let hsubtitle-font-size = 1.1em
#let small-font-size = 0.8em
#let italic-font-size = 1.1em
#let header-font-size = .9em // there is a hard-coded 1.4 / 1.2 factor

#let mono-font = "New Computer Modern"
#let serif-font = "ETBembo"
#let italic-font = "Adobe Garamond Pro"
#let hsubtitle-font = "Cochin"


#let body-font = serif-font
#let title-font = serif-font
#let subtitle-font = mono-font
#let footer-font = mono-font

#let sepia = rgb("#704214")
#let sepia-bg = sepia.transparentize(90%)

#let figure-spacing = 0.5em

#let annexes = state("Annexes", ()) // we store annexes here so we can list them at the end.
#let anx-idx = state("Index des Annexes", 1) // to add labels to annexes and try to link them in place

#let chapter(p, pb: true) = [
  #if pb [#pagebreak(weak: true)]
  #include(p)
]

#let section(p) = {
  include(p)
  pagebreak(weak: true)
}

#let desc(t) = {
    line(length: 100%, stroke: (
      thickness: 1pt,
      cap: "round"
    ))
    emph[#t]
  } 

#let hdesc(t) = {
    rect(
      fill: sepia-bg.transparentize(80%),
      stroke: none,
      radius: 15pt,
      inset: 15pt,
      text(
        font: mono-font,
        size: small-font-size,
        style: "normal",
        t
      )
    )
  } 

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

// Header subtitle
#let hsubtitle(t) = {
  box(width: 100%, text(
      size: hsubtitle-font-size,
      font: hsubtitle-font,
      style: "normal",
      
      align(left, "         " + t) //ugly but works
    ))
  }

#let annexe(content) = context {
  annexes.update(arr => {
    arr.push(content)
    arr
  })
  let c = anx-idx.get()
  anx-idx.update(c+1)
  let label-name = "anx-"+ str(c)
  link(label(label-name))[_Annexe #str(c)_]
}

#let show_annexes() = context {
  set heading(numbering: "I.")
  set page(header: [])
  let count = 1
  let a = annexes.final()
  for acontent in a {
    align(center + top)[
      #grid(columns: (1fr, 1fr, 1fr),
      line(length: 100%),
      [#upper[Annexe] #numbering("I", count)],
      line(length: 100%),
    )]
    [#acontent #label("anx-"+ str(count))]
    pagebreak(weak: true)
    count = count + 1
  }
}

#let project(body) = {

    show table.cell: it => {
        set text(size: small-font-size)
        if it.x == 0 or it.y == 0 {
            strong(it)
        } else { it }
    }

    set figure(
      placement: none,
    )

    show figure.caption: c => context {
      set text(size: small-font-size)
      let numb = c.numbering
      if c.kind == table { numb = "I" }
      [#c.supplement #c.counter.display(numb) --- #c.body]
    }
      
    show heading: it => {
        set text(size: header-font-size)
           {
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
                #emph(it)
            ]
        )
    }

    show emph: it => {
        set text(font: italic-font, size: italic-font-size)
        it
    }

    show footnote.entry: it => {
        let loc = it.note.location()
        numbering(
            "①: ",
            ..counter(footnote).at(loc),
        )
          it.note.body
    }

    set footnote(numbering: "①")
    set footnote.entry(separator: none)

    show outline: it => {
      show heading: t => {
        align(center, text(size: body-font-size, upper(t)))
      }
      show outline.entry: e => {
        set text(9pt, font: "Cascadia Mono", style: "normal", weight: "thin")
        show regex("󰖂\\s*"): t => []
        e
      }
      it
    }

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
        // numbering: "A.1 a ",
        numbering: (..nums) => {
          let args = nums.pos()
          let counter = 0
          let res = ()
          let sep = ("\u{25B8}", "\u{25B9}", "\u{25D7}")
          for i in args {
            if counter == 0 { 
              res.push(str.from-unicode(64+i))
            } else if counter == 1 {
              res.push(str(i))
            } else if counter == 2 {
              res.push(str.from-unicode(96+i))
            }
            counter = counter + 1
          }
          return res.join(".") + " " + sep.at(counter - 1, default: ".")
        },
        bookmarked: true,
    )

    show heading.where(level: 3): set text(size: 15pt)

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

  {
    show link: L => {
      box(
        baseline: 15%,
        rect(
          radius: 2pt,
          inset: (x: 3pt, y: 3pt),
          outset: (y: 3pt),
          height: 1em,
          fill: sepia-bg.lighten(80%),
          stroke: sepia-bg.lighten(50%),
          text(
          weight: "extralight",
          L
          )
        )
      )
    }
    body
  }
    show_annexes()
    
    pagebreak(weak:true)
    set page(
      header: [],
      columns: 2,
    )
    {
      
      show bibliography: it => {
        show link: L => {
          let cs = (
            "/doi/*[.org]": olive,
            "ncbi": teal,
            "sciencedirect": orange
          )
          let pc = gray
          let T = L.body.text
          for (r, cc) in cs {
            if T.find(regex(r)) != none {
              pc = cc
              break
            }
          }
          let c = pc.lighten(70%).transparentize(70%)
          rect(
            fill: c.lighten(50%),
            stroke: c,
            radius: 5pt,
            L
          ) 
        }
        show heading: t => {
          set text(size: 14pt)
          t
          v(4pt)
        }
        set text(0.5em)
        it
      } 
      bibliography(
        "zotero.bib", 
        title: "Bibliographie",
        style: "vancouver"
      )
    }
}


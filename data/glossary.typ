#import "@preview/glossy:0.8.0": *
#import "@preview/frame-it:1.1.2": *
#import "@preview/showybox:2.0.4": showybox

#import "/template.typ": sepia-bg , sepia, mono-font, body-font

#set page(header: [],)

#let (example, feature, variant, syntax) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("",),
  // You can provide a color or leave it out and it will be generated
  example: ("Example", gray),
  // You can add as many as you want
  syntax: ("Syntax",),
)
#show: frame-style(styles.boxy)
// #show: init-glossary.with(yaml("glossary.yaml"),)

#let capitalize(word) = {
  return upper(word.first()) + word.slice(1)
}

#let T1 = (
  section: (title, body) => {
    set text(font: body-font, size: 12pt)
    align(center)[
      #upper(title)
    ]
    v(1em)
    body
  },

  group: (name, index, total, body) => {
    if name != "" and total > 1 {
      // v(1em)
      // align(center, line(length: 80%))
      set text(font: body-font, size: 12pt)
      align(center, 
        text(font: body-font,size: 1.3em, weight: "bold", fill: gray.darken(80%))[
         #upper(name)
        ]
      )
      // align(center, line(length: 40%, stroke: sepia.transparentize(80%)))
    }
    v(2em)
    if name == "" {
      columns(2, body)
      pagebreak(weak: true)
    } else {
      body
      pagebreak(weak: true)
    }
  },

  entry: (entry, index, total) => {
    let short-display = text(weight: "regular", capitalize(entry.short))
    let long-display = if entry.long == none {
      []
    } else {
      [ · #entry.long]  // Using em-dash for Chicago style
    }

    let description = if entry.description == none {
      []
    } else {
      text(style: "italic", [: #entry.description])
    }

    let refs = text(
        size: 0.8em,
        fill: gray.darken(20%),
         {
           show regex("󰖂\\s*"): t => []
           entry.pages
        }
      )
    rect(
      fill: silver.transparentize(90%).lighten(50%),
      outset: .5em,
      block(
        below: 2em,
        text(
          size: 0.9em,
          {
            grid(
              columns: (1fr, auto),
              gutter: 1em,
              [#short-display#entry.label#long-display#description#entry.label],
              [#refs]
            )
          }
        )
      )
  )
  },
)

#glossary(
  title: "Glossaire & Abbréviations",
  theme: T1, 
  show-all: true
) 

#pagebreak(weak: true)
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
#show: init-glossary.with(yaml("glossary.yaml"),)

#let capitalize(word) = {
  return upper(word.first()) + word.slice(1)
}

#let ys-theme = (
  // Renders the main glossary section with minimal spacing
  // Parameters:
  //   title: The glossary section title
  //   body: Content containing all groups and entries
  section: (title, body) => {
    // align(center, pad(x: 100%, y: 2pt, upper(title)))
    set text(font: body-font)
    align(center, text(size: 12pt)[
      #upper(title)
    ])
    v(10pt)
    set text(size: 9pt, font: "Cascadia Mono")
    columns(2, body)
  },

  // Renders a group of related glossary terms
  // Parameters:
  //   name: Group name (empty string for ungrouped terms)
  //   index: Zero-based group index
  //   total: Total number of groups
  //   body: Content containing the group's entries
  group: (name, index, total, body) => {
    if name != "" and total > 1 {
      v(1em)
      align(center, line(length: 80%))
      align(center, 
        text(font: body-font,size: 1.4em, tracking: 1.5pt, weight: "bold", fill: gray.darken(80%))[
         #(name)
        ]
      )
      // align(center, line(length: 40%, stroke: sepia.transparentize(80%)))
    }
    v(1em)
    body
  },

  // Renders a single glossary entry with term, definition, and page references
  // Parameters:
  //   entry: Dictionary containing term data:
  //     - short: Short form of term
  //     - long: Long form of term (optional)
  //     - description: Term description (optional)
  //     - label: Term's dictionary label
  //     - pages: Linked page numbers where term appears
  //   index: Zero-based entry index within group
  //   total: Total entries in group
  entry: (entry, index, total) => {
    // Format term components with minimal spacing
    let term = text(
      weight: 350,
      fill: gray.darken(60%),
      capitalize(entry.short)
    )

    let long-form = if entry.long == none {
      []
    } else {
      text(fill: gray.darken(60%), weight: "thin", [ · #entry.long])
    }

    let description = if entry.description == none {
      []
    } else {
      text(weight: "extralight", size: 7pt)[· #entry.description]
    }

    // Create the complete entry with tight spacing
    block(
      spacing: 1em,
      grid(
        columns: (auto, 1fr, auto),
        align: left+bottom,
        gutter: 0.5em,
        // Term and description column
        box[#text(weight: "light")[#term]#entry.label#long-form #description],
        // Dots....
        // repeat(h(0.25em) + text(fill: gray, ".") + h(0.25em)),
        h(1em),
        // Page references with smaller font
        text(
          size: 0.8em,
          fill: gray.darken(20%),
           {
             show regex("󰖂\\s*"): t => []
             entry.pages
          }
        )
      )
    )
  },
)

#glossary(
  title: "Glossaire & Abbréviations",
  theme: ys-theme, 
  show-all: true
) 

#pagebreak(weak: true)
#import "@preview/touying:0.6.1": *

#let course-red = rgb("#BF0F1F")
#let page-stroke = stroke(thickness: 2pt, paint: course-red, cap: "butt")
#let new-section-stroke = stroke(thickness: 3pt, paint: course-red, cap: "butt")
#let margin-text-size = 0.6em

#let current-section-state = state("current-section-state", "")

#let slide-number = context counter("touying-slide-counter").display()
#let current-section = context current-section-state.get()
#let register-section(title) = current-section-state.update(title)

#let setup-template(
  title: none,
  subtitle: none,
  author: none,
  date: none,
  header-label: none,
  footer-label: none,
  institution: none,
  body,
) = {
  show: touying-slides.with(
    config-page(
      paper: "presentation-4-3",
      margin: 2cm,
      footer: [
        #set text(size: margin-text-size)
        #set align(horizon)

        #footer-label #h(1fr) #slide-number
      ],
      header: box(stroke: (bottom: page-stroke), inset: (x: 0pt, y: 8pt))[
        #set text(size: margin-text-size)
        #set align(horizon)
        #h(1fr)
        #if header-label != none {
          [#header-label | #text(current-section, fill: course-red)]
        } else {
          [#text(current-section, fill: course-red)]
        }
      ],
    ),
    config-common(
      slide-fn: slide,
      zero-margin-header: false,
      zero-margin-footer: false,
    ),
  )

  set text(font: "Noto Sans", size: 20pt)
  show link: set text(course-red)
  show raw: set text(font: "Fira Code")
  show math.equation: set text(font: "Lete Sans Math")
  show heading: set block(below: 1.2em)
  show heading: set text(size: 1.2em)

  // Tamano de texto del codigo cuando esta en un parrafo
  show raw.where(block: false): set text(size: 1.1em)

  // Tamano de texto del codigo cuando esta en un bloque de codigo
  show raw.where(block: true): set text(size: 16pt)
  show raw.where(block: true): it => block(
    fill: rgb("#ebebeb"),
    stroke: stroke(thickness: 1pt, paint: rgb("#333333")),
    inset: 8pt,
    radius: 4pt,
    width: 100%,
    it,
  )
  set list(spacing: 1em)

  slide(config: config-page(header: none, footer: none))[
    #set align(horizon)
    #stack(
      text(size: 2em, weight: "bold",  title),
      {
        if subtitle != none {
            v(1.2em)
            text(size: 1.4em, subtitle)
        }
      }
    )
    #line(stroke: new-section-stroke, length: 100%)
    #author

    #date

  ]
  body
}

#let new-section-slide(title) = {
  slide(config: config-page(header: none, footer: none))[
    #set align(horizon)
    #set text(size: 2em)
    #strong(title)
    #line(stroke: new-section-stroke, length: 100%)
    #register-section(title)
  ]
}

#let inverted-slide(top, bottom: none) = {
  slide(config: config-page(header: none, footer: none, fill: course-red.lighten(20%)))[
    #set align(horizon)
    #set text(size: 2em, fill: white)
    #set align(center)
    #strong(top)
    #line(stroke: 3pt + white, length: 100%)
    #strong(bottom)
  ]
}
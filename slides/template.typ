#import "@preview/polylux:0.4.0": slide, toolbox

#let course-red = rgb("#BF0F1F")
#let page-stroke = stroke(thickness: 2pt, paint: course-red, cap: "butt")
#let new-section-stroke = stroke(thickness: 3pt, paint: course-red, cap: "butt")
#let margin-text-size = 0.7em

#let setup-template(
  title: none,
  subtitle: none,
  course-name: none,
  title-header: none,
  body
) = {

  set page(
  paper: "presentation-4-3",
    margin: 2cm,
    footer: [
      #set text(size: margin-text-size)
      #set align(horizon)

      #course-name #h(1fr) #toolbox.slide-number
    ],
    header: box(stroke: (bottom: page-stroke), inset: (x: 0pt, y: 8pt))[
      #set text(size: margin-text-size)
      #set align(horizon)
      #h(1fr)
      #title-header | #toolbox.current-section
    ]
  )

  set text(font: "Noto Sans", size: 20pt)
  show link: set text(course-red)
  show raw: set text(font: "Fira Code")
  show math.equation: set text(font: "Lete Sans Math")
  show heading: set block(below: 2em)
  show heading: set text(size: 1em)
  show raw.where(block: true): set text(size: 16pt) // Code size in blocks
  show raw.where(block: true): it => block(
    fill: rgb("#ebebeb"),
    stroke: stroke(thickness: 1pt, paint: rgb("#333333")),
    inset: 8pt,
    radius: 4pt,
    width: 100%,
    it
  )

  slide[
    #set page(footer: none, header: none)
    #set align(horizon)
    #text(size: 2em, weight: "bold")[#title]
    #line(stroke: new-section-stroke, length: 100%)
    #subtitle
  ]
  body
}

#let new-section-slide(title) = slide[
  #set page(footer: none, header: none)
  #set align(horizon)
  #set text(size: 2em)
  #strong(title)
  #line(stroke: new-section-stroke, length: 100%)
  #toolbox.register-section(title)
]
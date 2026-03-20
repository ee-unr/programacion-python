
#import "@preview/touying:0.6.3": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "template.typ":  setup-template
#import "list-diagram.typ": list-diagram


#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)


#show: setup-template.with(
  title: [Programación en Python],
  subtitle: [Clase 2.1: Colecciones de datos],
  date: [25/03/2026],
  header-label: [Clase 2.1],
  footer-label: [Colecciones de datos],
)


#slide[
  = Diagrama de lista

  #place(center + horizon)[
    #fletcher-diagram(
      spacing: (8mm, 8mm),
      node-stroke: 1.5pt,
      edge-stroke: 1.3pt,
      node-outset: 5pt,
      list-diagram(
        "autores",
        ("Agresti", "Dobson", "Gelman", "Vehtari", "Bernardo"),
      ),
    )
  ]
]

#slide[
  = Diagrama de lista

  #place(center + horizon)[
    #fletcher-diagram(
      spacing: (8mm, 8mm),
      node-stroke: 1.5pt,
      edge-stroke: 1.3pt,
      node-outset: 5pt,
      list-diagram(
        "autores",
        ("Agresti", "Dobson", "Gelman"),
        selected-indices: (1, )
      ),
    )
  ]
]



#slide[
  = Diagrama de lista

  #place(center + horizon)[
    #fletcher-diagram(
      spacing: (8mm, 8mm),
      node-stroke: 1.5pt,
      edge-stroke: 1.3pt,
      node-outset: 5pt,
      list-diagram(
        "autores",
        ("Agresti", "Dobson", "Gelman", "Capo", "Yo"),
        negative-indices: true,
        selected-indices: (1, 2)
      ),
    )
  ]
]

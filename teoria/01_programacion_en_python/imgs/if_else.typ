#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond

#set page(width: 155mm, height: 195mm, margin: 0mm)
#set text(font: "Noto Sans", size: 20pt)

#place(center + horizon)[
  #diagram(
    spacing: (12mm, 12mm),
    node-stroke: 2pt,
    edge-stroke: 1.5pt,
    node-corner-radius: 4pt,
    node-outset: 5pt,

    node(
      (0pt, 460pt),
      [Inicio],
      name: <inicio>,
      width: 42mm,
      height: 18mm,
      fill: rgb("#dff0d8"),
      stroke: rgb("#93b77e"),
    ),

    node(
      (0pt, 300pt),
      [Condición],
      name: <condicion>,
      width: 38mm,
      height: 28mm,
      fill: rgb("#efe4bf"),
      stroke: rgb("#d0aa43"),
      shape: diamond,
    ),

    node(
      (225pt, 300pt),
      [Ejecutar\ bloque `if`],
      name: <bloque_if>,
      width: 50mm,
      height: 24mm,
      fill: rgb("#d9d0e2"),
      stroke: rgb("#8f73a8"),
    ),

    node(
      (0pt, 120pt),
      [Ejecutar\ bloque `else`],
      name: <bloque_else>,
      width: 50mm,
      height: 24mm,
      fill: rgb("#d9d0e2"),
      stroke: rgb("#8f73a8"),
    ),

    node(
      (0pt, -20pt),
      [Fin],
      name: <fin>,
      width: 42mm,
      height: 18mm,
      fill: rgb("#dff0d8"),
      stroke: rgb("#93b77e"),
    ),

    edge(<inicio.south>, <condicion.north>, "-|>"),
    edge(<condicion.east>, <bloque_if.west>, "-|>", [True]),
    edge(<condicion.south>, <bloque_else.north>, "-|>", [False], label-side: right),
    edge(<bloque_else.south>, <fin.north>, "-|>"),
    edge(<bloque_if.south>, <fin.east>, "-|>", corner: right),
  )
]

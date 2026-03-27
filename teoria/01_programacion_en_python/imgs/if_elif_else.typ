#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond

#set page(width: 165mm, height: 250mm, margin: 0mm)
#set text(font: "Noto Sans", size: 20pt)

#place(center + horizon)[
  #diagram(
    spacing: (12mm, 12mm),
    node-stroke: 2pt,
    edge-stroke: 1.5pt,
    node-corner-radius: 4pt,
    node-outset: 5pt,

    node(
      (0pt, 620pt),
      [Inicio],
      name: <inicio>,
      width: 42mm,
      height: 18mm,
      fill: rgb("#dff0d8"),
      stroke: rgb("#93b77e"),
    ),

    node(
      (0pt, 470pt),
      [Condición 1],
      name: <condicion_1>,
      width: 38mm,
      height: 28mm,
      fill: rgb("#efe4bf"),
      stroke: rgb("#d0aa43"),
      shape: diamond,
    ),

    node(
      (235pt, 470pt),
      [Ejecutar bloque\ `if`],
      name: <bloque_if>,
      width: 60mm,
      height: 24mm,
      outset: 16pt,
      fill: rgb("#d9d0e2"),
      stroke: rgb("#8f73a8"),
    ),

    node(
      (0pt, 290pt),
      [Condición 2],
      name: <condicion_2>,
      width: 38mm,
      height: 28mm,
      fill: rgb("#efe4bf"),
      stroke: rgb("#d0aa43"),
      shape: diamond,
    ),

    node(
      (235pt, 290pt),
      [Ejecutar bloque\ `elif`],
      name: <bloque_elif>,
      width: 60mm,
      height: 24mm,
      outset: 8pt,
      fill: rgb("#d9d0e2"),
      stroke: rgb("#8f73a8"),
    ),

    node(
      (0pt, 110pt),
      [Ejecutar\ bloque `else`],
      name: <bloque_else>,
      width: 50mm,
      height: 24mm,
      fill: rgb("#d9d0e2"),
      stroke: rgb("#8f73a8"),
    ),

    node(
      (0pt, -30pt),
      [Fin],
      name: <fin>,
      width: 42mm,
      height: 18mm,
      fill: rgb("#dff0d8"),
      stroke: rgb("#93b77e"),
    ),

    edge(<inicio.south>, <condicion_1.north>, "-|>"),
    edge(<condicion_1.east>, <bloque_if.west>, "-|>", [True]),
    edge(<condicion_1.south>, <condicion_2.north>, "-|>", [False], label-side: right),
    edge(<condicion_2.east>, <bloque_elif.west>, "-|>", [True]),
    edge(<condicion_2.south>, <bloque_else.north>, "-|>", [False], label-side: right),
    edge(<bloque_else.south>, <fin.north>, "-|>"),
    edge(<bloque_if.east>, <fin.east>, "-|>", corner: right),
    edge(<bloque_elif.east>, <fin.east>, "-|>", corner: right),
  )
]

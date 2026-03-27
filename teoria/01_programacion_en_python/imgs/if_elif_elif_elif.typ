#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond

#set page(width: 170mm, height: 335mm, margin: 0mm)
#set text(font: "Noto Sans", size: 20pt)

#place(center + horizon)[
  #diagram(
    spacing: (12mm, 12mm),
    node-stroke: 2pt,
    edge-stroke: 1.5pt,
    node-corner-radius: 4pt,
    node-outset: 5pt,

    node(
      (0pt, 920pt),
      [Inicio],
      name: <inicio>,
      width: 42mm,
      height: 18mm,
      fill: rgb("#dff0d8"),
      stroke: rgb("#93b77e"),
    ),

    node(
      (0pt, 760pt),
      [Condición 1],
      name: <condicion_1>,
      width: 38mm,
      height: 28mm,
      fill: rgb("#efe4bf"),
      stroke: rgb("#d0aa43"),
      shape: diamond,
    ),

    node(
      (235pt, 760pt),
      [Ejecutar bloque\ `if`],
      name: <bloque_if>,
      width: 60mm,
      height: 24mm,
      outset: 20pt,
      fill: rgb("#d9d0e2"),
      stroke: rgb("#8f73a8"),
    ),

    node(
      (0pt, 580pt),
      [Condición 2],
      name: <condicion_2>,
      width: 38mm,
      height: 28mm,
      fill: rgb("#efe4bf"),
      stroke: rgb("#d0aa43"),
      shape: diamond,
    ),

    node(
      (235pt, 580pt),
      [Ejecutar bloque\ `elif 1`],
      name: <bloque_elif_1>,
      width: 60mm,
      height: 24mm,
      outset: 16pt,
      fill: rgb("#d9d0e2"),
      stroke: rgb("#8f73a8"),
    ),

    node(
      (0pt, 400pt),
      [Condición 3],
      name: <condicion_3>,
      width: 38mm,
      height: 28mm,
      fill: rgb("#efe4bf"),
      stroke: rgb("#d0aa43"),
      shape: diamond,
    ),

    node(
      (235pt, 400pt),
      [Ejecutar bloque\ `elif 2`],
      name: <bloque_elif_2>,
      width: 60mm,
      height: 24mm,
      outset: 12pt,
      fill: rgb("#d9d0e2"),
      stroke: rgb("#8f73a8"),
    ),

    node(
      (0pt, 220pt),
      [Condición 4],
      name: <condicion_4>,
      width: 38mm,
      height: 28mm,
      fill: rgb("#efe4bf"),
      stroke: rgb("#d0aa43"),
      shape: diamond,
    ),

    node(
      (235pt, 220pt),
      [Ejecutar bloque\ `elif 3`],
      name: <bloque_elif_3>,
      width: 60mm,
      height: 24mm,
      outset: 8pt,
      fill: rgb("#d9d0e2"),
      stroke: rgb("#8f73a8"),
    ),

    node(
      (0pt, 20pt),
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

    edge(<condicion_2.east>, <bloque_elif_1.west>, "-|>", [True]),
    edge(<condicion_2.south>, <condicion_3.north>, "-|>", [False], label-side: right),

    edge(<condicion_3.east>, <bloque_elif_2.west>, "-|>", [True]),
    edge(<condicion_3.south>, <condicion_4.north>, "-|>", [False], label-side: right),

    edge(<condicion_4.east>, <bloque_elif_3.west>, "-|>", [True]),
    edge(<condicion_4.south>, <fin.north>, "-|>", [False], label-side: right),

    edge(<bloque_if.east>, <fin.east>, "-|>", corner: right),
    edge(<bloque_elif_1.east>, <fin.east>, "-|>", corner: right),
    edge(<bloque_elif_2.east>, <fin.east>, "-|>", corner: right),
    edge(<bloque_elif_3.east>, <fin.east>, "-|>", corner: right),
  )
]

#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond

#set page(width: 225mm, height: 190mm, margin: 0mm)
#set text(font: "Noto Sans", size: 20pt)

#place(center + horizon)[
  #diagram(
    spacing: (12mm, 12mm),
    node-stroke: 2pt,
    edge-stroke: 1.5pt,
    node-corner-radius: 4pt,
    node-outset: 5pt,

    node(
      (0pt, 360pt),
      [Inicio],
      name: <inicio>,
      width: 42mm,
      height: 18mm,
      fill: rgb("#dff0d8"),
      stroke: rgb("#93b77e"),
    ),

    node(
      (0pt, 200pt),
      [#raw("numero < 5", lang: "python")],
      name: <condicion>,
      width: 40mm,
      height: 30mm,
      fill: rgb("#efe4bf"),
      stroke: rgb("#d0aa43"),
      shape: diamond,
    ),

    node(
      (290pt, 200pt),
      [#raw("numero += 1", lang: "python")],
      name: <actualizacion>,
      width: 60mm,
      height: 20mm,
      fill: rgb("#d9d0e2"),
      stroke: rgb("#8f73a8"),
      outset: 12pt,
    ),

    node(
      (290pt, 35pt),
      [#raw("print(f\"El número es {numero}\")", lang: "python")],
      name: <impresion>,
      width: 120mm,
      height: 20mm,
      fill: rgb("#d9d0e2"),
      stroke: rgb("#8f73a8"),
      outset: 8pt,
    ),

    node(
      (0pt, -110pt),
      [Fin],
      name: <fin>,
      width: 42mm,
      height: 18mm,
      fill: rgb("#dff0d8"),
      stroke: rgb("#93b77e"),
    ),

    edge(<inicio.south>, <condicion.north>, "-|>"),
    edge(<condicion.east>, <actualizacion.west>, "-|>", [True]),
    edge(<condicion.south>, <fin.north>, "-|>", [False], label-side: left),
    edge(<actualizacion.south>, <impresion.north>, "-|>"),
    edge(<impresion.west>, <condicion.south>, "-|>", shift: (0pt, -30pt)),
  )
]

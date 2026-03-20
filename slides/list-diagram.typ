#import "@preview/fletcher:0.5.8" as fletcher: node, edge

#let list-node-name(kind, idx: none) = {
  let kind = str(kind)
  if idx == none {
    kind
  } else {
    kind + "-" + str(idx)
  }
}

#let list-anchor(kind, idx: none, anchor: "default") = {
  (name: list-node-name(kind, idx: idx), anchor: anchor)
}

#let list-cell(
  pos,
  idx,
  idx-body: none,
  width: 40pt,
  top-height: 30pt,
  bottom-height: 45pt,
  node-fill: rgb("#d7dfe8"),
  node-stroke: rgb("#2c3742"),
  layer: 0,
) = {
  let (x, y) = pos
  let dy = (top-height + bottom-height) / 2
  let resolved-idx-body = if idx-body == none { raw(str(idx)) } else { idx-body }
  let top-name = list-node-name("idx", idx: idx)
  let bottom-name = list-node-name("slot", idx: idx)
  let cell-name = list-node-name("cell", idx: idx)

  {
    node(
      (x, y),
      resolved-idx-body,
      name: top-name,
      width: width,
      height: top-height,
      fill: node-fill,
      stroke: node-stroke,
      layer: layer,
    )
    node(
      (x, y - dy),
      [],
      name: bottom-name,
      width: width,
      height: bottom-height,
      fill: node-fill,
      stroke: node-stroke,
      layer: layer,
    )
    node(
      name: cell-name,
      enclose: (top-name, bottom-name),
      fill: none,
      stroke: none,
      layer: layer - 1,
    )
  }
}

#let list-value-body(v) = {
  if type(v) == content {
    v
  } else {
    raw(repr(v))
  }
}

#let estimate-value-width(
  v,
  inset: 8pt,
  char-width: 9.5pt,
  extra-width: 8pt,
  min-width: 32pt,
) = {
  let chars = repr(v).clusters().len()
  calc.max(chars * char-width + 2 * inset + extra-width, min-width)
}

#let compute-value-centers(x0, cell-step, value-widths, value-gap) = {
  let n = value-widths.len()
  if n == 0 {
    ()
  } else {
    let cells-center-x = x0 + (n - 1) * cell-step / 2
    let total-values-width = value-widths.fold(0pt, (acc, w) => acc + w)
    let total-row-width = total-values-width + (n - 1) * value-gap
    let first-center-x = cells-center-x - total-row-width / 2 + value-widths.at(0) / 2
    let centers = ()
    let current-x = first-center-x
    for (i, w) in value-widths.enumerate() {
      if i > 0 {
        let prev-w = value-widths.at(i - 1)
        current-x += prev-w / 2 + value-gap + w / 2
      }
      centers.push(current-x)
    }
    centers
  }
}

#let list-diagram(
  var-name,
  values,
  selected-indices: (),
  negative-indices: false,
  origin: (100pt, 100pt),
  value-origin: (0pt, -50pt),
  value-gap: 14pt,
  var-offset-x: -250pt,
  var-fill: rgb("#ece7f1"),
  var-stroke: rgb("#8f73a8"),
  var-inset: 8pt,
  cell-width: 45pt,
  cell-height: (40pt, 45pt),
  cell-fill: rgb("#d7dfe8"),
  cell-stroke: rgb("#2c3742"),
  selected-cell-fill: rgb("#e8c1c1"),
  selected-cell-stroke: rgb("#c65f5f"),
  selected-idx-fill: rgb("#b04134"),
  value-inset: 10pt,
  value-char-width: 10pt,
  value-extra-width: 8pt,
  value-min-width: 32pt,
  value-fill: rgb("#e8f0e6"),
  value-stroke: rgb("#8ca788"),
) = {
  let (x0, y0) = origin
  let (vx0, vy0) = value-origin
  let idx-height = cell-height.at(0)
  let slot-height = cell-height.at(1)
  let dy = (idx-height + slot-height) / 2
  let n = values.len()
  let cell-step = cell-width
  let transparentize = 50%

  let stroke-width = 1.2pt
  let selected-stroke-width = 2pt

  let unselected-edge-color = rgb("#8c8c8c")
  let selected-mask = range(0, n).map(i => selected-indices.any(it => it == i))
  let is-selected = i => selected-mask.at(i)
  let has-selection = selected-mask.any(it => it)
  let value-bodies = values.map(list-value-body)
  let value-widths = values.map(v => estimate-value-width(
    v,
    inset: value-inset,
    char-width: value-char-width,
    extra-width: value-extra-width,
    min-width: value-min-width,
  ))
  let value-centers = compute-value-centers(x0, cell-step, value-widths, value-gap)

  {
    node(
      (x0 + var-offset-x, y0 - dy),
      raw(str(var-name)),
      name: list-node-name("var"),
      fill: var-fill,
      stroke: var-stroke,
      inset: var-inset,
    )

    for i in range(0, n) {
      let selected = is-selected(i)
      let display-idx = if negative-indices { i - n } else { i }
      let resolved-idx-body = if selected {
        [
          #set text(fill: selected-idx-fill, weight: "bold")
          #raw(str(display-idx))
        ]
      } else {
        raw(str(display-idx))
      }
      let resolved-node-fill = if selected { selected-cell-fill } else { cell-fill }
      let resolved-node-stroke = if selected {
        (paint: selected-cell-stroke, thickness: 2pt)
      } else {
        (paint: cell-stroke, thickness: 1.2pt)

      }
      let resolved-layer = if selected { 2 } else { 0 }
      list-cell(
        (x0 + i * cell-step, y0),
        i,
        idx-body: resolved-idx-body,
        width: cell-width,
        top-height: idx-height,
        bottom-height: slot-height,
        node-fill: resolved-node-fill,
        node-stroke: resolved-node-stroke,
        layer: resolved-layer,
      )
    }

    if n > 0 {
      node(
        name: list-node-name("cells"),
        enclose: range(0, n).map(i => list-node-name("cell", idx: i)),
        fill: none,
        stroke: none,
      )
    }

    for (i, body) in value-bodies.enumerate() {
      let selected = is-selected(i)
      let dim-value = has-selection and not selected

      let resolved-value-fill = if dim-value and type(value-fill) == color {
        value-fill.transparentize(transparentize)
      } else {
        value-fill
      }

      let resolved-value-stroke-paint = if dim-value and type(value-stroke) == color {
        value-stroke.transparentize(transparentize)
      } else {
        value-stroke
      }

      let resolved-value-stroke-width = if selected {
        selected-stroke-width
      } else {
        stroke-width
      }

      let resolved-value-body = if dim-value {
        [
          #set text(fill: rgb("#000000").transparentize(transparentize))
          #body
        ]
      } else {
        body
      }

      node(
        (value-centers.at(i), vy0),
        resolved-value-body,
        name: list-node-name("value", idx: i),
        inset: value-inset,
        fill: resolved-value-fill,
        stroke: (paint: resolved-value-stroke-paint, thickness: resolved-value-stroke-width),
      )
    }

    if n > 0 {
      edge(
        vertices: (
          list-anchor("var", anchor: "east"),
          list-anchor("cells", anchor: "west"),
        ),
        marks: "-|>",
      )
    }

    for i in range(0, n) {
      let selected = is-selected(i)
      if selected or not has-selection {
        edge(
          vertices: (
            list-anchor("slot", idx: i, anchor: "south"),
            list-anchor("value", idx: i, anchor: "north"),
          ),
          marks: "-|>",
        )
      } else {
        edge(
          vertices: (
            list-anchor("slot", idx: i, anchor: "south"),
            list-anchor("value", idx: i, anchor: "north"),
          ),
          marks: "-|>",
          stroke: unselected-edge-color,
        )
      }
    }
  }
}

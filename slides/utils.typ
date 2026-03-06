

#import "@preview/touying:0.6.1": only, pause, uncover

#let one-by-one(start: 1, mode: hide, ..children) = {
  for (idx, child) in children.pos().enumerate() {
    uncover((beginning: start + idx), child)
  }
}

#let item-by-item(start: 1, mode: hide, body) = {
  let is-item(it) = type(it) == content and it.func() in (
    list.item, enum.item, terms.item
  )
  let children = if type(body) == content and body.has("children") {
    body.children
  } else {
    body
  }
  one-by-one(start: start, mode: mode, ..children.filter(is-item))
}

#let later(body, strand: 1, mode: hide) = {
  if body in ([], [ ], parbreak(), linebreak()) {
    body
  } else {
    [#pause #body]
  }
}

#let reveal-code(
  start: 1,
  lines: (),
  before: gray,
  after: hide,
  full: true,
  body,
) = {
  let lines = (0,) + lines
  let (before-action, after-action) = (before, after).map(mode => {
    if type(mode) == color {
      it => text(fill: mode, it.text)
    } else if mode == hide {
      hide
    } else {
      panic("Modo invalido para reveal-code: " + repr(mode))
    }
  })

  for (idx, (from, to)) in lines.windows(2).enumerate() {
    show raw.line: it => {
      if it.number <= from {
        before-action(it)
      } else if it.number > to {
        after-action(it)
      } else {
        it
      }
    }
    only(start + idx, body)
  }

  if full {
    only((beginning: start + lines.len() - 1), body)
  }
}

// Anotación
#let code-annotation(fill: rgb("#dbeafe"), stroke:rgb("#555"),  body) = {
  box(
    fill: fill,
    stroke: stroke,
    inset: 8pt,
    radius: 4pt,
  )[
    #set align(center)
    #body
  ]
}
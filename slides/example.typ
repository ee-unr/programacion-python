#import "@preview/touying:0.6.1": *
#import themes.simple: *

#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *

#show: simple-theme.with(
  aspect-ratio: "4-3",
  config-info(
    title: [Demo Touying + reveal-code],
    subtitle: [Programacion en Python],
    author: [Tomas Capretto],
    date: datetime.today(),
    institution: [UNR - FCECON],
    logo: [PY],
  ),
)

#show: codly-init.with()
#codly(
  languages: codly-languages,
  display-name: false,
  display-icon: false,
  zebra-fill: none,
  smart-indent: false,
)

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

#slide[
  = Reveal code en Touying

  ````typst
  #reveal-code(
    start: 1,
    lines: (1, 3, 5),
    before: gray,
    after: hide,full: true,
  )[
    ```python
    ...
    ```
  ]
  ````
]

#slide[
  = Ejemplo 1
  #reveal-code(lines: (1, 3, 4))[
    ```python
    total = 0
    for i in range(1, 4):
        total += i
    print(total)
    ```
  ]
]

#slide[
  = Ejemplo 2 (`full: false`)
  #codly(number-format: none)
  #reveal-code(lines: (1, 3, 5, 7), full: false)[
    ```python
    texto = "  hola, touying  "
    texto = texto.strip()
    texto = texto.upper()
    print(texto)
    print(len(texto))
    print(texto.title())
    print(texto.lower())
    ```
  ]

  #only(1)[Inicializacion]
  #only(2)[Limpieza de espacios]
  #only(3)[Transformaciones]
  #only(4)[Salida final]
]

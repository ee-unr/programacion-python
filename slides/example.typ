#import "@preview/polylux:0.4.0": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()
#codly(
  languages: codly-languages,
  display-name: false,
  display-icon: false,
  zebra-fill: none,
  smart-indent: false,
)

#import "template.typ": *
#let title = "Conociendo Python"

#show: setup-template.with(
  title: [Primera clase: \ Conociendo Python],
  subtitle: [Tomás Capretto \ \ Enero 2026],
  course-name: "Programación en Python",
  title-header: "Clase 1"
)

#new-section-slide[Introducción]

#slide[
  = About this presentation
  This presentation is supposed to briefly showcase what you can do with this
  package.

  For a full documentation, read the
  #link("https://polylux.dev/book/")[online book].
]


#slide[
  = My first slide

  Here come my three favourite fonts:
  #show: later

  + Atkinson Hyperlegible
  + Alegreya
  + TeX Gyre Pagella

  #show: later

  And now some math:
  $
    sum_(k = 1)^n k = (n (n + 1)) / 2
  $
]

#slide[
  = Second slide

  #toolbox.side-by-side[
    #rect(width: 100%, height: 1fr)[(imagine this being an image)]
  ][
    On the left, you see a #only(2)[*not so*] beautiful image.
  ]
]

#slide[
  = Dynamic overlays

  This line is always visible.
  #uncover(2)[This appears on subslide 2.]
  #uncover("3-")[This stays from subslide 3 on.]

  #only(1)[Only on the first subslide.]
  #only(2)[Only on the second subslide.]
  #only((beginning: 3))[Only from the third subslide onward.]
]

#slide[
  = Item-by-item list

  #item-by-item(mode: luma(240))[
    + Define the goal
    + Sketch the steps
    + Fill in the details
    + Share the result
  ]
]


#slide[
  = Reveal code

  Esto se mantiene en todas las slides

  // 1. Hasta la linea 1
  // 2. Hasta la linea 3
  // 3. Hasta la línea 4
  // 4. Completo
  #codly(number-format: none) // Borrar enumeración
  #reveal-code(lines: (1, 3, 4))[
  ```python
  total = 0
  for i in range(1, 4):
      total += 1
  print(total)
  ```
  ]

]


#slide[
  = Reveal code

  También en todas las slides, pero...

  // 1. Hasta la linea 1
  // 2. Hasta la linea 3
  // 3. Hasta la línea 4
  // 4. Completo
  #reveal-code(lines: (1, 3, 4))[
  ```python
  total = 0
  for i in range(1, 4):
      total += 1
  print(total)
  ```
  ]

  #only(3)[
  ```
  5
  ```
  ]

  #only(1)[Inicializamos un contador en 0]
  #only(2)[Iteramos desde 1 a 4...]
  #only(3)[Imprimimos el total]
  #only(4)[Qué bonito código que escribimos!]

]


#slide[

  = Vemos `uncover()`

  Acá empieza el texto... #uncover(2)[*aparece después*] conserva espacios!

]


#slide[

  = Veamos cómo funciona `#show: later`
  first
  #show: later

  second
  #show: later

  third
]

#slide[

  = Un later mas complejo...

  #[
    this is scope 1
    #show: later
    still scope 1
  ]

  #[
    this is scope 2
    #show: later.with(strand: 2)
    still scope 2
  ]

]

#slide[
  #one-by-one[Do you know ][$pi$ ][to a thousand decimal places?]
]

#slide[
  #one-by-one(start: 3)[This ][came ][pretty late.]
]

#slide[
  #item-by-item[
    - first
    - second
    - third
  ]
  Este texto *siempre* está.

  #item-by-item[
    - first
    - second
    - third
  ]

]

#slide[
  https://polylux.dev/book/dynamic/alternatives.html
]

#slide[
  #toolbox.side-by-side(gutter: 5mm, columns: (1fr, 2fr, 1fr))[
    #rect(width: 100%, stroke: none, fill: aqua, height: 20pt)
    hola?
  ][
    #rect(width: 100%, stroke: none, fill: teal)
    que paso?
  ][
    #rect(width: 100%, stroke: none, fill: eastern)
  ]
]


#slide[
  == Codly features
  // Genera un warning 'layout did not converge within 5 attempts'
  #codly(
    highlights: (
      (line: 4, start: 5, end: none, fill: red),
      (line: 5, start: 16, end: 25, fill: green, tag: "(a)"),
      (line: 5, start: 29, fill: blue, tag: "(b)")
    ),
  )
  ```python
  def fib(n):
      if n <= 1:
          return n
      else:
          return fib(n - 1) + fib(n - 2)
  print(fib(25))
  ```
]

#slide[
  == Codly features (II)
  #codly(
    header: [`example.py`],
    header-cell-args: (align: center, )
  )
  ```python
  def fib(n):
    if n <= 1:
      return n
    else:
      return fib(n - 1) + fib(n - 2)
  print(fib(25))
  ```
]


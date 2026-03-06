#import "@preview/touying:0.6.1": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/gentle-clues:1.3.1": *
#import "@preview/pinit:0.2.2": *

#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#import fletcher.shapes: diamond, ellipse
#import "template.typ": (
  code-annotation,
  inverted-slide,
  item-by-item,
  later,
  new-section-slide,
  reveal-code,
  setup-template,
)


#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)

#show: codly-init.with()
#codly(
  languages: codly-languages,
  display-name: false,
  display-icon: false,
  zebra-fill: none,
  smart-indent: false,
)

#show: setup-template.with(
  title: [Conociendo Python],
  subtitle: [Tomás Capretto \ \ Marzo 2026],
  course-name: "Programación en Python",
  title-header: "Clase 1"
)

#new-section-slide[Qué es Python]

#slide[
  = Python en una _slide_
  #components.side-by-side(gutter: 3mm, columns: (2fr, 1fr))[
      #set text(size: 1.2em)
      #item-by-item[
      - Lenguaje interpretado
      - De propósito general
      - De alto nivel
      - Gratis
      - Código abierto
      - Ecosistema de librerías
      - Comunidad
  ]
  ][
    #set align(center)
    #image("python-logo.png", width:60%)
  ]
]

#new-section-slide[Positron]

#slide[
  = Positron en una _slide_

  #components.side-by-side(gutter: 3mm, columns: (2fr, 1fr))[
      #set text(size: 1.2em)
      #item-by-item[
      - Editor de código
      - Creado por Posit (antes RStudio)
      - Basado en Visual Studio Code
      - Diseñado para ciencia de datos
      - Enfocado en R y Python
      - Gratis
      - Código abierto
      - Rstudio #emoji.heart VS Code
  ]
  ][
    #set align(center)
    #image("positron-icon.svg", width:60%)
  ]
]

#inverted-slide[A laburar]

#new-section-slide[Tipos de datos elementales]

#slide[
  = Tipos de datos elementales

  Python cuenta con 5 tipos de datos elementales: \
  `int`, `float`, `str`, `bool`, `NoneType`.

  #codly(number-format: none)
  ```python
  13              # <class 'int'>
  2.71            # <class 'float'>
  13.0            # <class 'float'>
  13.             # <class 'float'>
  .7              # <class 'float'>
  "Hola hola"     # <class 'str'>
  'Hola hola'     # <class 'str'>
  True            # <class 'bool'>
  False           # <class 'bool'>
  None            # <class 'NoneType'>
  ```

]

#slide[


  #info(title: "Escalares de verdad")[
    Python no es un lenguaje vectorizado, a diferencia de R. \
    Los valores enteros, flotantes, etc. son *escalares* de verdad, \
    no vectores de longitud 1.
  ]

  #show: later

  #success(title: "Conversión entre tipos")[
    Es posible convertir entre tipos de datos, siempre que tenga sentido.

    ```python
    float(12)
    bool(0)
    float("1.25")
    int(12.5)
    str(False)
    ```

  ]

]


#new-section-slide[Variables y asignaciones]

#slide[
  = Variables y asignaciones

  Las variables se asignan con el símbolo `=` y la sintaxis es:

  ```python
  <nombre> = <expresión>
  ```

  #show: later

  Por ejemplo:

  ```python
  mensaje = "¡Hola, curso!"
  ```

  #show: later

  o:

  ```python
  a = 1
  b = -5
  c = 6
  x1 = (-b + (b ** 2 - 4 * a * c) ** 0.5) / (2 * a)
  x2 = (-b - (b ** 2 - 4 * a * c) ** 0.5) / (2 * a)
  ```

]

#slide[
  = Asignacion múltiple

  En vez de hacer esto:

  ```python
  a = 1
  b = -5
  c = 6
  ```

  #show: later

  Python nos permite hacer esto:

  ```python
  a, b, c = 1, -5, 6
  ```

  #show: later

  #memo(title: "La realidad siempre es más compleja")[
    La asignación múltiple no es un simple atajo sintáctico,
    es consecuencia del *empaquetado* y *desempaquetado*, 
    mecanismo que veremos más adelante.
  ]

]

#slide[
  = Nombres permitidos

  #set text(size: 0.92em)

  - Solo pueden contener *letras*, *números* y *guiones bajos*
  - Deben comenzar con letra o guión bajo, pero no con un número.
    - `mensaje_1` ✅
    - `1_mensaje` ❌
  - No pueden contener espacios
    - `el_mensaje` vs `el mensaje`
  - No pueden ser palabras reservadas de Python

  #show: later

  #info(title: "Consejos")[
  - Usar nombres breves pero descriptivos
    - `mensaje` mejor que `mj`
    - `equipo_favorito`  mejor que `eq_fav`
  - No usar tildes ni caracteres específicos del castellano (`ñ`).
  ]

]

#new-section-slide[Expresiones]

#slide[
  = Expresiones

  #memo(title: "¿Qué es una expresión?")[
    Una expresión es una combinación de *operadores* y *operandos* que se puede evaluar para producir un valor.
  ]
]

#slide[
  = Expresiones

  #set text(size: .98em)

  #memo(title: "¿Qué es un operador?")[
    Un símbolo o palabra que define una operación.
    - Aritméticos: `+`, `-`, `*`, `/`, `**`, `//`, `%`.
    - Lógicos: `not`, `and`, `or`.
    - Comparación: `is`, `is not`, `==`, `!=`, `>`, `>=`, `<`, `<=`.
  ]

  #show: later

  #memo(title: "¿Y un operando?")[
    Cada uno de los elementos sobre los que actúa el operador.

    - Valores literales: `5`, `"posit"`, `True`, `1.8`, etc.
    - Variables: `x`, `y`, `mi_objeto`, etc.
    - Llamadas a funciones: `sum(x, 5)`, `fun(a, b, c, d)`, etc.
  ]
]


#slide[
  = Ejemplos
  #show raw.where(block: true): set text(size: 20pt)

  #codly(number-format: numbering.with("1"))
  #reveal-code(lines: (1, 2, 3, 4, 5, 6))[
    ```python
    2 ** 8
    False or True
    int(((a + b) ** 2) / 1.8)
    12 + sum(x, y, z)
    1
    "foo"
    ```
  ]
]

#slide[
  = Comparación de objetos

  Python permite comparar objetos utilizando dos operadores:

  - `==`
  - `is`

  #show: later

  La diferencia entre ellos es que `==` compara en *valor*,
  mientras que `is` compara en *identidad*.

  #show: later

  La identidad de un objeto se obtiene llamando a `id()`:

  ```python
  >>> id("bar")
  139233362987312
  ```

  Veremos ejemplos más adelante.

]

#slide[
  = Operaciones con `str`

  Hay objetos que admiten ser utilizados con ciertos operadores.

  Por ejemplo, la suma (`+`) y la multiplicación (`*`) tienen sentido con las
  cadenas de caracteres.

  #show: later

  Con cadenas de texto, sumar es concatenar.

  #codly(number-format: none)
  ```python
  >>> "f" + "a"
  'fa'
  ```

  #show: later

  Y donde vale sumar, vale que multiplicar por `n` es sumar el valor `n` veces:

  #codly(number-format: none)
  ```python
  >>> "z" * 3
  'zzz'
  ```
]

#slide[
  = Métodos

  Los objetos también pueden ofrecer acciones que no se implementan a través de operadores,
  sino de métodos.

  #show: later

  #v(3em)

  Por ahora, conformémonos con decir que un método es una función a la que se puede acceder a
  través de un objeto.

  #show: later

  #v(3em)

  Las cadenas de texto implementan una gran variedad de métodos, utiles para realizar diversas
  tareas.

]

#slide[
  = Métodos de `str`

  Cambiar la capitalización:

  #codly(number-format: none)
  #reveal-code(lines: (1, 3, 5, 7, 9), full: false)[
    ```python
    >>> texto = "Hola, qué tal?"
    >>> texto.upper()
    'HOLA, QUÉ TAL?'
    >>> texto.lower()
    'hola, qué tal?'
    >>> texto.title()
    'Hola, Qué Tal?'
    >>> texto.capitalize()
    'Hola, qué tal?'
    ```
  ]

]

#slide[
  = Métodos de `str`

  Eliminar espacios en blanco

  #codly(number-format: none)
  #reveal-code(lines: (1, 3, 5, 7, 9), full: false)[
  ```python
  >>> texto = "    algún texto   "
  >>> texto.rstrip()
  '    algún texto'
  >>> texto.lstrip()
  'algún texto   '
  >>> texto.strip()
  'algún texto'
  >>> texto.strip().capitalize() # Encadenamiento de métodos
  'Algún texto'
  ```
  ]

]

#slide[
  = f-_strings_

  Las f-_strings_ permiten *interpolar* cadenas de texto.

  #show: later

  Sin f-_strings_:

  #codly(number-format: none)
  ```python
  >>> nombre = "Tomás"
  >>> edad = 30
  >>> print("Soy " + nombre + " y tengo " + str(edad) + " años.")
  Soy Tomás y tengo 30 años.
  ```

  #show: later

  Con f-_strings_:

  #codly(number-format: none)
  ```python
  >>> nombre = "Tomás"
  >>> edad = 30
  >>> print(f"Soy {nombre} y tengo {edad} años.")
  Soy Tomás y tengo 30 años.
  ```

]

#new-section-slide[Funciones]

#slide[
  = ¿Por qué usamos funciones?

  #set text(size: 1.4em)
  #set list(spacing: 1.4em)

  #item-by-item[
    - Reutilización de código
    - Organización
    - Modularidad
  ]

  #uncover("4-")[
    #v(5em)
    #set align(center)
   Nada que ustedes no supieran ya #emoji.face.wink
  ]

]


#slide[

  #show raw: it => {
    show regex("pin\d+"): it => pin(eval(it.text.slice(3)))
    it
  }

  #v(7em)

  #set align(center)
  #show raw.where(block: true): set text(size: 26pt)
  #show raw.where(block: true): it => block(width: 70%, it)


  ```python
  pin1defpin2 pin3funpin4(pin5x, y, zpin6)pin7:pin8
    pin9# <cuerpo de la función>pin10
    pin11returnpin12 pin13valorpin14
  ```


  #uncover(2)[
    #pinit-highlight(1, 2, dy: -1.1em, fill: rgb(0, 0, 255, 50))

    #pinit-point-from(
      (1, 2),
      body-dx: -120pt,
      body-dy: -60pt,
      offset-dx: 0pt,
      offset-dy: -90pt,
      pin-dy: -25pt,
      pin-dx: 0pt,
    )[
      #code-annotation[
        Indica comienzo de\
        definición de una función
      ]
    ]
  ]

  #uncover(3)[
    #pinit-highlight(3, 4, dy: -1.1em, fill: rgb(0, 0, 255, 50))

    #pinit-point-from(
      (3, 4),
      body-dx: -70pt,
      body-dy: -60pt,
      offset-dx: 0pt,
      offset-dy: -90pt,
      pin-dy: -25pt,
      pin-dx: 0pt,
    )[
      #code-annotation[
        Nombre\
        de la función
      ]
    ]
  ]


  #uncover(4)[
    #pinit-highlight(5, 6, dy: -1.2em, extended-height: 1.6em, fill: rgb(0, 0, 255, 50))

    #pinit-point-from(
      (5, 6),
      body-dx: -70pt,
      body-dy: -60pt,
      offset-dx: 0pt,
      offset-dy: -90pt,
      pin-dx: 0pt,
      pin-dy: -25pt
    )[
      #code-annotation[Argumentos \ de la función]
    ]
  ]

  #uncover(5)[
    #pinit-highlight(7, 8, dy: -1.2em, extended-height: 1.6em, fill: rgb(0, 0, 255, 50))

    #pinit-point-from(
      (7, 8),
      body-dx: -90pt,
      body-dy: -60pt,
      offset-dx: 0pt,
      offset-dy: -90pt,
      pin-dx: 0pt,
      pin-dy: -25pt
    )[
      #code-annotation[Comienza un \ bloque de código]
    ]
  ]

  #uncover(6)[
    #pinit-highlight(9, 10, dy: -1.2em, extended-height: 1.6em, fill: rgb(0, 0, 255, 50))

    #pinit-point-from(
      9,
      body-dx: -120pt,
      body-dy: 5pt,
      offset-dx: -60pt,
      offset-dy: 70pt,
      pin-dx: -5pt,
      pin-dy: -8pt
    )[
      #code-annotation[Código que se ejecuta \ cuando se llama a la función]
    ]
  ]

  #uncover(7)[
    #pinit-highlight(11, 12, dy: -1.2em, extended-height: 1.6em, fill: rgb(0, 0, 255, 50))

    #pinit-point-from(
      (11, 12),
      body-dx: -120pt,
      body-dy: 5pt,
      offset-dx: 0pt,
      offset-dy: 70pt,
      pin-dx: 0pt,
      pin-dy: 10pt
    )[
      #code-annotation[Indica que se devuelve un valor \ y el fin de la ejecución \
      de la función]
    ]
  ]

  #uncover(8)[
    #pinit-highlight(13, 14, dy: -1.2em, extended-height: 1.6em, fill: rgb(0, 0, 255, 50))

    #pinit-point-from(
      (13, 14),
      body-dx: -140pt,
      body-dy: 5pt,
      offset-dx: 0pt,
      offset-dy: 70pt,
      pin-dx: 0pt,
      pin-dy: 10pt
    )[
      #code-annotation[Valor que devuelve la función]
    ]
  ]
]

#inverted-slide[A laburar]

#new-section-slide[Ejecución condicional]


#slide[
  #place(center + horizon)[
    #fletcher-diagram(
      spacing: (12mm, 12mm),
      node-stroke: 2pt,
      edge-stroke: 1.5pt,
      node-corner-radius: 4pt,
      node-outset: 5pt,

      node(
        (-100pt, 340pt),
        [¿Aprobaste\ el parcial?],
        name: <parcial>,
        width: 50mm,
        height: 25mm,
        fill: rgb("#efe4bf"),
        stroke: rgb("#d0aa43"),
        shape: ellipse,
      ),
      pause,
      edge(<parcial.south>, <recuperatorio.north>, "-|>", [No #emoji.face.sad], label-side: right),
      pause,
      node(
        (-100pt, 180pt),
        [¿Aprobaste el\ recuperatorio?],
        name: <recuperatorio>,
        width: 60mm,
        height: 25mm,
        fill: rgb("#efe4bf"),
        stroke: rgb("#d0aa43"),
        shape: ellipse,
      ),
      pause,
      edge(<recuperatorio.south>, <libre.north>, "-|>", [No #emoji.face.cry]),
      node(
        (-100pt, 0pt),
        [Libre],
        name: <libre>,
        width: 38mm,
        height: 20mm,
        fill: rgb("#d9d0e2"),
        stroke: rgb("#8f73a8"),
      ),

      fletcher.hide({
        node(
          (150pt, 340pt),
          [¿Aprobaste\ el TP?],
          name: <tp>,
          width: 50mm,
          height: 25mm,
          fill: rgb("#efe4bf"),
          stroke: rgb("#d0aa43"),
          shape: ellipse,
        )
        node(
          (300pt, 160pt),
          [¿Promedio\ mayor a 8?],
          name: <promedio>,
          width: 50mm,
          height: 25mm,
          fill: rgb("#efe4bf"),
          stroke: rgb("#d0aa43"),
          shape: ellipse,
        )

        node(
          (200pt, 0pt),
          [Regular],
          name: <regular>,
          width: 38mm,
          height: 20mm,
          fill: rgb("#d9d0e2"),
          stroke: rgb("#8f73a8"),
        )

        node(
          (400pt, 0pt),
          [Promovido],
          name: <promovido>,
          width: 38mm,
          height: 20mm,
          fill: rgb("#d9d0e2"),
          stroke: rgb("#8f73a8"),
        )
      })

    )
  ]
]


#slide[
  #place(center + horizon)[
    #fletcher-diagram(
      spacing: (12mm, 12mm),
      node-stroke: 2pt,
      edge-stroke: 1.5pt,
      node-corner-radius: 4pt,
      node-outset: 5pt,

      node(
        (-100pt, 340pt),
        [¿Aprobaste\ el parcial?],
        name: <parcial>,
        width: 50mm,
        height: 25mm,
        fill: rgb("#efe4bf"),
        stroke: rgb("#d0aa43"),
        shape: ellipse,
      ),

      edge(<parcial.south>, <recuperatorio.north>, "-|>", [No #emoji.face.sad], label-side: right),

      node(
        (-100pt, 180pt),
        [¿Aprobaste el\ recuperatorio?],
        name: <recuperatorio>,
        width: 60mm,
        height: 25mm,
        fill: rgb("#efe4bf"),
        stroke: rgb("#d0aa43"),
        shape: ellipse,
      ),

      pause,
      edge(<recuperatorio.east>, <tp.south-west>, "-|>", [Sí #emoji.face.cover]),
      node(
        (150pt, 340pt),
        [¿Aprobaste\ el TP?],
        name: <tp>,
        width: 50mm,
        height: 25mm,
        fill: rgb("#efe4bf"),
        stroke: rgb("#d0aa43"),
        shape: ellipse,
      ),
      pause,
      edge(<tp.south>, <libre.east>, "-|>", [No #emoji.face.fear.sweat], bend: 30deg, label-side: right),
      node(
        (-100pt, 0pt),
        [Libre],
        name: <libre>,
        width: 38mm,
        height: 20mm,
        fill: rgb("#d9d0e2"),
        stroke: rgb("#8f73a8"),
      ),
      fletcher.hide({
        node(
          (-100pt, 0pt),
          [Libre],
          name: <libre>,
          width: 38mm,
          height: 20mm,
          fill: rgb("#d9d0e2"),
          stroke: rgb("#8f73a8"),
        )
        node(
          (300pt, 160pt),
          [¿Promedio\ mayor a 8?],
          name: <promedio>,
          width: 50mm,
          height: 25mm,
          fill: rgb("#efe4bf"),
          stroke: rgb("#d0aa43"),
          shape: ellipse,
        )
        node(
          (200pt, 0pt),
          [Regular],
          name: <regular>,
          width: 38mm,
          height: 20mm,
          fill: rgb("#d9d0e2"),
          stroke: rgb("#8f73a8"),
        )
        node(
          (400pt, 0pt),
          [Promovido],
          name: <promovido>,
          width: 38mm,
          height: 20mm,
          fill: rgb("#d9d0e2"),
          stroke: rgb("#8f73a8"),
        )
      })



    )
  ]
]


#slide[
  #place(center + horizon)[
    #fletcher-diagram(
      spacing: (12mm, 12mm),
      node-stroke: 2pt,
      edge-stroke: 1.5pt,
      node-corner-radius: 4pt,
      node-outset: 5pt,

      node(
        (-100pt, 340pt),
        [¿Aprobaste\ el parcial?],
        name: <parcial>,
        width: 50mm,
        height: 25mm,
        fill: rgb("#efe4bf"),
        stroke: rgb("#d0aa43"),
        shape: ellipse,
      ),

      edge(<parcial.east>, <tp.west>, "-|>", [Sí #emoji.face.beam]),
      node(
        (150pt, 340pt),
        [¿Aprobaste\ el TP?],
        name: <tp>,
        width: 50mm,
        height: 25mm,
        fill: rgb("#efe4bf"),
        stroke: rgb("#d0aa43"),
        shape: ellipse,
      ),
      pause,

      edge(<tp.east>, <promedio.north>, "-|>", [Sí #emoji.face.cool], corner: right),
      node(
        (300pt, 160pt),
        [¿Promedio\ mayor a 8?],
        name: <promedio>,
        width: 50mm,
        height: 25mm,
        fill: rgb("#efe4bf"),
        stroke: rgb("#d0aa43"),
        shape: ellipse,
      ),
      pause,
      node(
        (400pt, 0pt),
        [Promovido],
        name: <promovido>,
        width: 38mm,
        height: 20mm,
        fill: rgb("#d9d0e2"),
        stroke: rgb("#8f73a8"),
      ),

      edge(<promedio.south>, <promovido.north>, "-|>", [Sí #emoji.face.stars]),
      fletcher.hide({
        node(
          (-100pt, 180pt),
          [¿Aprobaste el\ recuperatorio?],
          name: <recuperatorio>,
          width: 60mm,
          height: 25mm,
          fill: rgb("#efe4bf"),
          stroke: rgb("#d0aa43"),
          shape: ellipse,
        )
        node(
          (-100pt, 0pt),
          [Libre],
          name: <libre>,
          width: 38mm,
          height: 20mm,
          fill: rgb("#d9d0e2"),
          stroke: rgb("#8f73a8"),
        )
        node(
          (200pt, 0pt),
          [Regular],
          name: <regular>,
          width: 38mm,
          height: 20mm,
          fill: rgb("#d9d0e2"),
          stroke: rgb("#8f73a8"),
        )

      })
    )
  ]
]


#slide[
  #place(center + horizon)[
    #fletcher-diagram(
      spacing: (12mm, 12mm),
      node-stroke: 2pt,
      edge-stroke: 1.5pt,
      node-corner-radius: 4pt,
      node-outset: 5pt,

      node(
        (-100pt, 340pt),
        [¿Aprobaste\ el parcial?],
        name: <parcial>,
        width: 50mm,
        height: 25mm,
        fill: rgb("#efe4bf"),
        stroke: rgb("#d0aa43"),
        shape: ellipse,
      ),

      edge(<parcial.south>, <recuperatorio.north>, "-|>", [No #emoji.face.sad], label-side: right),
      edge(<parcial.east>, <tp.west>, "-|>", [Sí #emoji.face.beam]),

      node(
        (-100pt, 180pt),
        [¿Aprobaste el\ recuperatorio?],
        name: <recuperatorio>,
        width: 60mm,
        height: 25mm,
        fill: rgb("#efe4bf"),
        stroke: rgb("#d0aa43"),
        shape: ellipse,
      ),

      edge(<recuperatorio.east>, <tp.south-west>, "-|>", [Sí #emoji.face.cover]),

      node(
        (-100pt, 0pt),
        [Libre],
        name: <libre>,
        width: 38mm,
        height: 20mm,
        fill: rgb("#d9d0e2"),
        stroke: rgb("#8f73a8"),
      ),
      edge(<recuperatorio.south>, <libre.north>, "-|>", [No #emoji.face.cry]),

      node(
        (150pt, 340pt),
        [¿Aprobaste\ el TP?],
        name: <tp>,
        width: 50mm,
        height: 25mm,
        fill: rgb("#efe4bf"),
        stroke: rgb("#d0aa43"),
        shape: ellipse,
      ),

      edge(<tp.east>, <promedio.north>, "-|>", [Sí #emoji.face.cool], corner: right),
      edge(<tp.south>, <libre.east>, "-|>", [No #emoji.face.fear.sweat], bend: 30deg, label-side: right),

      node(
        (300pt, 160pt),
        [¿Promedio\ mayor a 8?],
        name: <promedio>,
        width: 50mm,
        height: 25mm,
        fill: rgb("#efe4bf"),
        stroke: rgb("#d0aa43"),
        shape: ellipse,
      ),

      node(
        (200pt, 0pt),
        [Regular],
        name: <regular>,
        width: 38mm,
        height: 20mm,
        fill: rgb("#d9d0e2"),
        stroke: rgb("#8f73a8"),
      ),

      node(
        (400pt, 0pt),
        [Promovido],
        name: <promovido>,
        width: 38mm,
        height: 20mm,
        fill: rgb("#d9d0e2"),
        stroke: rgb("#8f73a8"),
      ),


      edge(<promedio.south>, <regular.north>, "-|>", [No #emoji.face.meh]),
      edge(<promedio.south>, <promovido.north>, "-|>", [Sí #emoji.face.stars]),
    )
  ]
]

#slide[
  = Partes de estructura `if`

  #show raw: it => {
    show regex("pin\d+"): it => pin(eval(it.text.slice(3)))
    it
  }

  #v(6em)

  #set align(center)
  #show raw.where(block: true): set text(size: 26pt)
  #show raw.where(block: true): it => block(width: 72%, it)

  ```python
  pin1ifpin2 pin3nota >= 6pin4pin5:pin6
      pin7print("Aprobado")pin8
  ```

  #uncover(2)[
    #pinit-highlight(1, 2, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (1, 2),
      body-dx: -80pt,
      body-dy: -40pt,
      offset-dx: 0pt,
      offset-dy: -90pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[Palabra clave `if`]
    ]
  ]

  #uncover(3)[
    #pinit-highlight(3, 5, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (3, 5),
      body-dx: -145pt,
      body-dy: -65pt,
      offset-dx: 0pt,
      offset-dy: -90pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[
        *Condición* que a evaluar,\ debe resultar en `True` o `False`
      ]
    ]
  ]

  #uncover(4)[
    #pinit-highlight(5, 6, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (5, 6),
      body-dx: -89pt,
      body-dy: -65pt,
      offset-dx: 0pt,
      offset-dy: -90pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[
        Comienza un\ bloque de código
      ]
    ]
  ]

  #uncover(5)[
    #pinit-highlight(7, 8, dy: -1.2em, extended-height: 1.6em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (7, 8),
      body-dx: -120pt,
      body-dy: 5pt,
      offset-dx: 0pt,
      offset-dy: 70pt,
      pin-dx: 0pt,
      pin-dy: 10pt,
    )[
      #code-annotation[Bloque que se ejecuta si \ la condición es verdadera]
    ]
  ]
]

#slide[
  = Partes de estructura `if`-`else`

  #show raw: it => {
    show regex("pin\d+"): it => pin(eval(it.text.slice(3)))
    it
  }

  #v(4.5em)

  #set align(center)
  #show raw.where(block: true): set text(size: 24pt)
  #show raw.where(block: true): it => block(width: 78%, it)

  ```python
  pin1ifpin2 pin3nota >= 6pin4pin5:pin6
      pin7print("Aprobado")pin8
  pin9elsepin10pin11:pin12
      pin13print("Desaprobado")pin14
  ```

  #uncover(2)[
    #pinit-highlight(9, 12, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (9, 12),
      body-dx: -170pt,
      body-dy: -90pt,
      offset-dx: 0pt,
      offset-dy: -90pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[
        Declara bloque que se ejecuta cuando la \
        condición del `if` no es verdadera.\
        Palabra clave es `else`.
      ]
    ]
  ]

  #uncover(3)[
    #pinit-highlight(13, 14, dy: -1.2em, extended-height: 1.6em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (13, 14),
      body-dx: -140pt,
      body-dy: 8pt,
      offset-dx: 0pt,
      offset-dy: 70pt,
      pin-dx: 0pt,
      pin-dy: 10pt,
    )[
      #code-annotation[Bloque que se ejecuta\ *solo* cuando \ la condición del `if` es `False`]
    ]
  ]
]

#slide[
  = Partes de estructura `if`-`elif`-`else`

  #show raw: it => {
    show regex("pin\d+"): it => pin(eval(it.text.slice(3)))
    it
  }

  #v(2.5em)

  #set align(center)
  #show raw.where(block: true): set text(size: 22pt)
  #show raw.where(block: true): it => block(width: 80%, it)

  ```python
  pin1ifpin2 pin3nota >= 8pin4pin5:pin6
      pin7print("Promovido")pin8
  pin9elifpin10 pin11nota >= 6pin12pin13:pin14
      pin15print("Regular")pin16
  pin17elsepin18pin19:pin20
      pin21print("Desaprobado")pin22
  ```

  #uncover(2)[
    #pinit-highlight(1, 6, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (1, 6),
      body-dx: -130pt,
      body-dy: -35pt,
      offset-dx: 0pt,
      offset-dy: -60pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[
        Primera condición a evaluar
      ]
    ]
  ]

  #uncover(3)[
    #pinit-highlight(7, 8, dy: -1.2em, extended-height: 1.6em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (7, 8),
      body-dx: -130pt,
      body-dy: -10pt,
      offset-dx: 0pt,
      offset-dy: 60pt,
      pin-dx: 0pt,
      pin-dy: 8pt,
    )[
      #code-annotation[Bloque que se ejecuta si `nota >= 8`]
    ]
  ]

  #uncover(4)[
    #pinit-highlight(9, 14, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      14,
      body-dx: 5pt,
      body-dy: -40pt,
      offset-dx: 100pt,
      offset-dy: -10pt,
      pin-dx: 5pt,
      pin-dy: -10pt,
    )[
      #code-annotation[
        Si la nota no es mayor o igual al 8,\
        se evalúa si es mayor o igual a 6. \
        La palabra clave es `elif`.
      ]
    ]
  ]

  #uncover(5)[
    #pinit-highlight(15, 16, dy: -1.2em, extended-height: 1.6em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (15, 16),
      body-dx: -110pt,
      body-dy: 5pt,
      offset-dx: 0pt,
      offset-dy: 60pt,
      pin-dx: 0pt,
      pin-dy: 8pt,
    )[
      #code-annotation[Bloque que se ejecuta si `nota >= 6`]
    ]
  ]

  #uncover(6)[
    #pinit-highlight(17, 20, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (17, 20),
      body-dx: -120pt,
      body-dy: 10pt,
      offset-dx: 0pt,
      offset-dy: 80pt,
      pin-dx: 0pt,
      pin-dy: 10pt,
    )[
      #code-annotation[
        Declara bloque alternativo.\
        Se ejecuta cuando nota no es mayor o igual a 8,\
        ni mayor o igual a 6.
      ]
    ]
  ]

  #uncover(7)[
    #pinit-highlight(21, 22, dy: -1.2em, extended-height: 1.6em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (21, 22),
      body-dx: -140pt,
      body-dy: 8pt,
      offset-dx: 0pt,
      offset-dy: 60pt,
      pin-dx: 0pt,
      pin-dy: 8pt,
    )[
      #code-annotation[
        Código del bloque alternativo
      ]
    ]
  ]
]

#inverted-slide[A laburar]

#new-section-slide[Bucles]

#slide[
  = Partes de estructura `for`

  #show raw: it => {
    show regex("pin\d+"): it => pin(eval(it.text.slice(3)))
    it
  }

  #v(6em)

  #set align(center)
  #show raw.where(block: true): set text(size: 24pt)
  #show raw.where(block: true): it => block(width: 80%, it)

  ```python
  pin1forpin2 pin3ipin4 pin5inpin6 pin7range(3)pin8pin9:pin10
      pin11print(f"El numero es {i}")pin12
  ```

  #uncover(2)[
    #pinit-highlight(1, 2, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (1, 2),
      body-dx: -85pt,
      body-dy: -35pt,
      offset-dx: 0pt,
      offset-dy: -100pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[Palabra clave `for`]
    ]
  ]

  #uncover(3)[
    #pinit-highlight(3, 4, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (3, 4),
      body-dx: -100pt,
      body-dy: -35pt,
      offset-dx: 0pt,
      offset-dy: -100pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[Variable de iteración]
    ]
  ]

  #uncover(4)[
    #pinit-highlight(5, 6, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (5, 6),
      body-dx: -80pt,
      body-dy: -35pt,
      offset-dx: 0pt,
      offset-dy: -100pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[Palabra clave `in`]
    ]
  ]

  #uncover(5)[
    #pinit-highlight(7, 8, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (7, 8),
      body-dx: -130pt,
      body-dy: -35pt,
      offset-dx: 0pt,
      offset-dy: -100pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[Objeto sobre el que se itera]
    ]
  ]

  #uncover(6)[
    #pinit-highlight(9, 10, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (9, 10),
      body-dx: -175pt,
      body-dy: -35pt,
      offset-dx: 0pt,
      offset-dy: -100pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[Indican el inicio del bloque de código]
    ]
  ]

  #uncover(7)[
    #pinit-highlight(11, 12, dy: -1.2em, extended-height: 1.6em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (11, 12),
      body-dx: -145pt,
      body-dy: 8pt,
      offset-dx: 0pt,
      offset-dy: 70pt,
      pin-dx: 0pt,
      pin-dy: 10pt,
    )[
      #code-annotation[Bloque de código que se ejecuta en cada iteración]
    ]
  ]

]

#slide[
  = Partes de estructura `while`

  #show raw: it => {
    show regex("pin\d+"): it => pin(eval(it.text.slice(3)))
    it
  }

  #v(4.5em)

  #set align(center)
  #show raw.where(block: true): set text(size: 22pt)
  #show raw.where(block: true): it => block(width: 84%, it)

  ```python
  numero = 0
  pin3whilepin4 pin5numero < 4pin6pin7:pin8
      pin9numero = numero + 1
      pin11print(f"El numero es {numero}")pin12
  ```

  #uncover(2)[
    #pinit-highlight(3, 4, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (3, 4),
      body-dx: -95pt,
      body-dy: -45pt,
      offset-dx: 0pt,
      offset-dy: -90pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[Palabra clave `while`]
    ]
  ]

  #uncover(3)[
    #pinit-highlight(5, 6, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (5, 6),
      body-dx: -160pt,
      body-dy: -45pt,
      offset-dx: 0pt,
      offset-dy: -90pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[Condición que se evalúa a `True` o `False`]
    ]
  ]

  #uncover(4)[
    #pinit-highlight(7, 8, dy: -1.1em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (7, 8),
      body-dx: -175pt,
      body-dy: -45pt,
      offset-dx: 0pt,
      offset-dy: -90pt,
      pin-dx: 0pt,
      pin-dy: -25pt,
    )[
      #code-annotation[Indican el inicio del bloque de código]
    ]
  ]

  #uncover(5)[
    #pinit-highlight(9, 12, dy: -1.2em, extended-height: 1.6em, fill: rgb(0, 0, 255, 50))
    #pinit-point-from(
      (11, 12),
      body-dx: -240pt,
      body-dy: 8pt,
      offset-dx: 0pt,
      offset-dy: 70pt,
      pin-dx: 0pt,
      pin-dy: 10pt,
    )[
      #code-annotation[
        Bloque de código que se ejecuta en cada iteración \
        mientras la condición sea verdadera
      ]
    ]
  ]

]


#inverted-slide([A laburar], bottom: [Fin])
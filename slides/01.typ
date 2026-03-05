#import "@preview/polylux:0.4.0": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/gentle-clues:1.3.1": *
#import "@preview/pinit:0.2.2": *
#import "template.typ": setup-template, new-section-slide, inverted-slide

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
  subtitle: [Tomás Capretto \ \ Enero 2026],
  course-name: "Programación en Python",
  title-header: "Clase 1"
)

#new-section-slide[Qué es Python]

#slide[
  = Python en una _slide_
  #toolbox.side-by-side(gutter: 3mm, columns: (2fr, 1fr))[
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

  #toolbox.side-by-side(gutter: 3mm, columns: (2fr, 1fr))[
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

  Por ahora, conformémonos con decir que un método es una función a la que se puede acceder a
  través de un objeto.

  #show: later

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
    Nada que ustedes no supieran #emoji.face.wink
  ]

]


#slide[
  #let annotation(body) = {
    box(
      fill: rgb("#dbeafe"),
      inset: 8pt,
      radius: 4pt,
      stroke: rgb("#555")
    )[
      #set align(center)
      #body
    ]
  }

  #show raw: it => {
    show regex("pin\d+"): it => pin(eval(it.text.slice(3)))
    it
  }

  #v(7em)

  #set align(center)
  #show raw.where(block: true): set text(size: 26pt) // Code size
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
      #annotation[
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
      #annotation[
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
      #annotation[Argumentos \ de la función]
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
      #annotation[Comienza un \ bloque de código]
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
      #annotation[Código que se ejecuta \ cuando se llama a la función]
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
      #annotation[Indica que se devuelve un valor \ y el fin de la ejecución \
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
      #annotation[Valor que devuelve la función]
    ]
  ]
]

#inverted-slide[A laburar]

#new-section-slide[Ejecución condicional]

#slide[
  = Titulo
]

#new-section-slide[Bucles]

#slide[

]





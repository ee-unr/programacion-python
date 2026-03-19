#import "@preview/touying:0.6.1": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/gentle-clues:1.3.1": *
#import "@preview/pinit:0.2.2": *

#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#import fletcher.shapes: diamond, ellipse
#import "template.typ": (
  inverted-slide,
  new-section-slide,
  setup-template,
)

#import "utils.typ": (
  code-annotation,
  item-by-item,
  later,
  reveal-code,
)


#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)

#show: codly-init.with()
#codly(
  languages: codly-languages,
  display-name: false,
  display-icon: false,
  zebra-fill: none,
  smart-indent: false,
  number-format: none
)

#show: setup-template.with(
  title: [Programación en Python],
  subtitle: [Clase 2.1: Colecciones de datos],
  date: [25/03/2026],
  header-label: [Clase 2.1],
  footer-label: [Colecciones de datos],
)


#slide[
  - Los tipos de datos elementales son limitados
  - Para resolver problemas complejos, eficientemente, necesitamos estructuras de datos más complejas.

  ```python
  nombre_1 = "Juan"
  nombre_2 = "Carla"
  nombre_3 = "Evelina"
  nombre_4 = "Leandro"

  edad_1 = 29
  edad_2 = 34
  edad_3 = 33
  edad_4 = 38
  ```
]

#slide[
  = Hoy

  - Listas
  - Tuplas
  - Diccionarios
]

#new-section-slide[Listas]

#slide[
  = Definición

  *Esto es una lista*

  ```python
  >>> [1, 2, 3, 4, 5]
  [1, 2, 3, 4, 5]
  ```

  *Esto también*

  ```python
  >>> ["a", "e", True, 256]
  ['a', 'e', True, 256]
  ```

  *¿Pero qué es?*

  - Secuencia ordenada de objetos
  - Mutable

  Objeto que contiene otros objetos en un orden determinado,
  cuyo contenido puede modificarse.
]

#slide[
  = Creación

  Las listas se definen escribiendo elementos entre corchetes `[]`, separados por comas:

  ```python
  >>> lista = ["Bayes", "Laplace", "Fisher"]
  ```

  Su representación es idéntica a la definición:

  ```python
  >>> lista
  ['Bayes', 'Laplace', 'Fisher']
  ```

  Y su tipo es `list`:

  ```python
  >>> type(lista)
  <class 'list'>
  ```
]

#slide[
  = ¿Qué quiere decir que es ordenada?

  Supongamos las siguientes listas:

  ```python
  >>> l1 = [1, 2, 3]
  >>> l2 = [2, 1, 3]
  ```

  *¿Son iguales?*

  #reveal-code(
    lines: (1, 2),
    before: none,
    after: hide,
    full: false,
  )[
    ```python
    >>> l1 == l2
    False
    ```
  ]
]

#slide[
  = ¿Qué quiere decir que es ordenada?

  Y estas otras listas, ¿son iguales?

  ```python
  >>> l1 = [1, 2, 3]
  >>> l2 = [1, 2, 3]
  ```

  #reveal-code(
    start: 1,
    lines: (1, 2),
    before: none,
    after: hide,
    full: true,
  )[
    ```python
    >>> l1 == l2
    True
    ```
  ]

  #show: later

  *¿Y son idénticas?*

  #reveal-code(
    start: 3,
    lines: (1, 2),
    before: none,
    after: hide,
    full: false,
  )[
    ```python
    >>> l1 is l2
    False
    ```
  ]
]

#slide[
  = Igualdad en valor y en identidad

  Mientras `==` compara valor, `is` compara identidad.

  ```python
  >>> l1 == l2
  True
  >>> l1 is l2
  False
  >>> id(l1)
  127087380616448
  >>> id(l2)
  127087378339712
  ```

  Dos objetos pueden ser *iguales* pero no *el mismo*.

]

#slide[
  = Detalles de implementación

  Con escalares inmutables y cadenas de texto, Python puede reutilizar objetos en memoria.

  ```py
  >>> 10 is 10
  True
  ```

  ```py
  >>> "hola" is "hola"
  True
  ```

  ```py
  >>> True is True
  True
  ```

  Dado que Python almacena estos valores una única vez en memoria,
  la comparación en identidad devuelve `True`.

  *¿Cuál es la razón para almacenarlos una única vez?*

]


#slide[
  = Acceder a elementos

  #reveal-code(
    lines: (2, 3),
    before: none,
    after: hide,
    full: false,
  )[
    ```py
    >>> autores = ["Agresti", "Dobson", "Gelman"]
    >>> autores[1]
    'Dobson'
    ```
  ]
]

#slide[
  = _Zero-based indexing_

  ```py
  >>> autores[0]
  'Agresti'
  >>> autores[1]
  'Dobson'
  >>> autores[2]
  'Gelman'
  ```

  #info(title: "En síntesis")[
    - El primer elemento está en la posición *0*.
    - El último elemento está en la posición *n - 1*.
  ]

]

#slide[
  = Diagrama de lista

  - Diagrama con representación gráfica, traer de apunte y hacer con fletcher.
]

#slide[
  = Diagrama de lista

  - Mostrar un diagrama con la lista _en memoria_
  - La idea es aclarar por qué se usa *0-based indexing*.

]

#slide[
  = Índices negativos

  Esto también funciona

  ```py
  >>> autores = ["Agresti", "Dobson", "Gelman"]
  >>> autores[-1]
  'Gelman'
  ```

  === En general

  - El índice -1 indica el último elemento.
  - El índice -2 indica el penúltimo elemento.
  - Y así sucesivamente.

]

#slide[
  = Acceder a sublistas

  Se usan rebanadas o _slices_ de la siguiente manera:

  ```py
  >>> lista[inicio:fin]
  ```

  Por ejemplo:

  ```py
  >>> ingredientes = ["Azúcar", "Flores", "Colores", "Sustancia X"]
  >>> ingredientes[1:3]
  ['Flores', 'Colores']
  ```

]

#slide[
  = Acceder a sublistas

  Se puede pasar solo el límite superior:

  ```py
  >>> lista[:fin]
  ```

  Por ejemplo:

  ```py
  >>> ingredientes[:3]
  ['Azúcar', 'Flores', 'Colores']
  ```
]

#slide[
  = Acceder a sublistas

  Y también solo el límite inferior:

  ```py
  >>> lista[inicio:]
  ```

  Por ejemplo:

  ```py
  >>> ingredientes[2:]
  ['Colores', 'Sustancia X']
  ```

]

#slide[
  = Acceder a sublistas
  #set align(horizon)

  #info(title: "¿Sabías qué?")[
    Es válido no pasar ni `inicio` ni `fin` al crear un _slice_.

    ```py
    >>> lista[:]
    ```

    #v(1.5em)

    El siguiente bloque devuelve una *copia* de la lista original:

    ```py
    >>> ingredientes[:]
    ['Azúcar', 'Flores', 'Colores', 'Sustancia X']
    ```

    #v(1.5em)

    #set align(center)
    *¿Cómo podríamos comprobarlo?* #emoji.face.think
  ]

]


#inverted-slide[Quiz]

#slide[
  = Quiz

  Explique el resultado de las siguientes expresiones:

  ```python
  >>> [1, 2, 3] == [1.0, 2, 3.0]
  ```

  ```py
  >>> cosas = ["a", "b", "c", "d", "e", "f"]
  >>> cosas[:-2]
  >>> cosas[-5:]
  ```

  ```python
  >>> [0][0]
  >>> [1][1]
  ```

  ```python
  >>> cosas = [True, False, False, None]
  >>> cosas[4 / 2]
  ```

]

#new-section-slide[Cómo modificar listas]

#slide[
  = Reemplazar elementos

  ```py
  >>> marcas = ["Puerto Blest", "Martínez", "Fuego Tostadores"]
  ```

  Reemplazar un único elemento:

  ```py
  >>> marcas[0] = "Bialetti"
  >>> marcas
  ['Bialetti', 'Martínez', 'Fuego Tostadores']
  ```

  Reemplazar una sublista:

  ```py
  >>> marcas[1:3] = ["Indios Verdes", "John & Joe"]
  >>> marcas
  ['Bialetti', 'Indios Verdes', 'John & Joe']
  ```

]

#slide[
  = Reemplazar elementos

  ¡Valen índices negativos!

  ```py
  >>> marcas[-3] = "Cuervo"
  >>> marcas
  ['Cuervo', 'Indios Verdes', 'John & Joe']
  ```

  También en rebanadas:

  ```py
  >>> marcas[-2:] = ["Martínez", "Fuego Tostadores"]
  >>> marcas
  ['Cuervo', 'Martínez', 'Fuego Tostadores']
  ```

  ```py
  >>> marcas[-3:-1] = ["Puerto Blest", "Indigo"]
  >>> marcas
  ['Puerto Blest', 'Indigo', 'Fuego Tostadores']
  ```

]


#slide[
  = Agregar elementos, al final

  #v(-0.5em)

  De a uno, al final, utilizando el método `.append()`:

  ```py
  >>> vocales = ["a", "e", "i", "o"]
  >>> vocales.append("u")
  >>> vocales
  ['a', 'e', 'i', 'o', 'u']
  ```

  Con otra lista #footnote[En realidad, cualquier otra secuencia.], utilizando `.extend()`:

  ```py
  >>> bartulos = [3.14, "casa", 11]
  >>> bartulos.extend(["casa", True])
  >>> bartulos
  [3.14, 'casa', 11, 'casa', True]
  ```


]


#slide[
  #show heading: set text(size: 0.9em)
  = Agregar elementos, en posición arbitraria

  También se puede insertar un elemento en una posición arbitraria con `.insert()`:

  ```py
  >>> logicos = [True, True, False, False]
  >>> logicos.insert(2, "surprise")
  >>> logicos
  [True, True, 'surprise', False, False]
  ```

  #info(title: "Importante")[
    La posición indica dónde se agrega el nuevo elemento. \
    El resto de los elementos se desplaza hacia la derecha.
  ]

  Tanto `.append()`, como `.extend()` e `insert()` son métodos *_in-place_*.

]


#slide[
  = ¿_In-place_? ¿Qué es?

  #info(title: "Definición")[
    Un método _in-place_ modifica el objeto original que realiza la llamada, no crea uno nuevo.

    En Python, estos métodos suelen devolver un valor: `None`.
  ]


  #info(title: "Pregunta")[
    ¿Cómo podríamos verificar que el objeto al que apunta nuestra variable siga siendo el mismo luego de llamar al método _in-place_?
  ]

]


#slide[
  = Eliminar elementos

  El método `.pop()` elimina elementos a partir de su índice:
  ```py
  >>> autores = ["McElreath", "Jaynes", "Fisher"]
  >>> autores.pop(1)
  >>> autores
  ['McElreath', 'Fisher']
  ```

  El método `.remove()` lo hace a partir del valor:

  ```py
  >>> galletitas = ["Melba", "Oreo", "Macucas", "Rumba"]
  >>> galletitas.remove("Oreo")
  >>> galletitas
  ['Melba', 'Macucas', 'Rumba']
  ```

]


#slide[
  = Eliminar elementos: detalles

  El método `.pop()` *devuelve* el valor eliminado:
  ```python
  >>> l = [10, 100, 1000]
  >>> e = l.pop(-1)
  >>> e
  1000
  ```

  Si no se le pasa ningún valor, extrae por defecto el último:
  ```python
  >>> l = ["a", "bb", "ccc"]
  >>> l.pop()
  'ccc'
  ```

]

#slide[
  = Eliminar elementos: detalles

  Por otro lado, `.remove()` no devuelve nada (¿qué significa?)
  ```python
  >>> numeros = [1, 2, 3, 4, 5]
  >>> numeros.remove(3)
  ```

  Si el valor está repetido, elimina la primera ocurrencia:
  ```python
  >>> l = [1, 2, 3, 2, 2, 4]
  >>> l.remove(2)
  >>> l
  [1, 3, 2, 2, 4]
  ```

  Y si no existe, arroja un error.

]

#slide[
  = Eliminar elementos con `del`

  La sentencia `del`, que se usa para eliminar variables, también elimina
  elementos de una lista.

  ```python
  >>> galletitas = ["Melba", "Oreo", "Macucas", "Rumba"]
  >>> del galletitas[3]
  >>> galletitas
  ['Melba', 'Oreo', 'Macucas']
  ```

  Al igual que `.pop()` y `remove()`, `del` también opera _in-place_.

]


#new-section-slide[Operaciones útiles sobre listas]

#slide[
  = Ordenar una lista

  ```python
  >>> galletitas = ["Melba", "Oreo", "Macucas", "Rumba"]
  >>> galletitas.sort()
  >>> galletitas
  ['Macucas', 'Melba', 'Oreo', 'Rumba']
  ```


  ```python
  >>> galletitas = ["Melba", "Oreo", "Macucas", "Rumba"]
  >>> galletitas.sort(reverse=True)
  >>> galletitas
  ['Rumba', 'Oreo', 'Melba', 'Macucas']
  ```

]


#slide[
  = Invertir una lista

  ```python
  >>> numeros = [1, 2, 3, 4, 5, 6]
  >>> numeros.reverse()
  >>> numeros
  [6, 5, 4, 3, 2, 1]
  ```

]

#inverted-slide[
  ¡¿Todo tiene que ser _in-place_?!

  #show: later
  Por suerte, no
]

#slide[
  = Operaciones no destructivas sobre listas

  #reveal-code(
    lines: (1, 2, 3, 4, 5, 6, 7, 8, 9),
    after: hide,
    full: false,
  )[
    ```python
    >>> [1, 2, 3] + [4, 5, 6]
    >>> ["x", "y"] * 3
    >>> sorted([1, 10, 3, 2, 5, 6])
    >>> max([1, 2, 3])
    >>> min([1, 2, 3])
    >>> sum([1, 2, 3])
    >>> ["a", "b", "c"].index("b")
    >>> [10, 10, 11, 12].count(10)
    >>> len([1, 1, 1, 1])
    ```
  ]
  #v(-0.75em)
  #box(
      width: 100%,
      inset: 16pt,
      radius: 4pt,
      fill: luma(245),
      stroke: luma(200),
  )[
    #only(1)[#raw("[1, 2, 3, 4, 5, 6]", lang: "python")]
    #only(2)[#raw("['x', 'y', 'x', 'y', 'x', 'y']", lang: "python")]
    #only(3)[#raw("[1, 2, 3, 5, 6, 10]", lang: "python")]
    #only(4)[#raw("3", lang: "python")]
    #only(5)[#raw("1", lang: "python")]
    #only(6)[#raw("6", lang: "python")]
    #only(7)[#raw("1", lang: "python")]
    #only(8)[#raw("2", lang: "python")]
    #only(9)[#raw("4", lang: "python")]
  ]

  #only(1)[Concatena listas y devuelve una nueva.]
  #only(2)[Repite la lista la cantidad de veces indicada.]
  #only(3)[Ordena y devuelve una nueva lista.]
  #only(4)[Devuelve el mayor elemento.]
  #only(5)[Devuelve el menor elemento.]
  #only(6)[Calcula la suma de los elementos.]
  #only(7)[Devuelve la posición de la primera coincidencia.]
  #only(8)[Cuenta cuántas veces aparece un valor.]
  #only(9)[Devuelve la cantidad de elementos.]


]

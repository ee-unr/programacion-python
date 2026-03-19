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
  ```

  *Esto también*

  ```python
  >>> ["a", "e", True, 256]
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

  ```python
  >>> l1 == l2
  False # TODO: reveal
  ```
]

#slide[
  = ¿Qué quiere decir que es ordenada?

  Y estas otras listas, ¿son iguales?

  ```python
  >>> l1 = [1, 2, 3]
  >>> l2 = [2, 1, 3]
  ```

  ```python
  >>> l1 == l2
  True # TODO: reveal
  ```

  *¿Y son idénticas?*
  ```python
  >>> l1 is l2
  False # TODO: reveal
  ```
]

#slide[
  = Identidad

  Explicar diferencia entre igualdad en valor e igualdad en identidad.
  Mostrar id(l1), id(l2), etc.
  Mostrar por que no podiamos hacerlo con numeros o cadenas.

]


#slide[
  = Acceder a elementos

  ```py
  >>> autores = ["Agresti", "Dobson", "Gelman"]
  >>> autores[1]
  'Dobson' # TODO: reveal
  ```
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

  Callout:

  - El primer elemento está en la posición 0.
  - El último elemento está en la posición n - 1.

]

#slide[
  = Diagrama de lista

  - Diagrama con representacion grafica, traer de apunte y hacer con fletcher.
]

#slide[
  = Diagrama de lista

  - Mostrar un diagrama con la lista _en memoria_
  - La idea es aclarar por qué se usa 0 based idexing.

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

  Rebanadas:

  ```py
  >>> lista[inicio:fin]
  ```

  Por ejemplo:

  ```py
  >>> letras = ["a", "b", "c", "d"]
  >>> lista[2:3]
  ```

]


#slide[
  = Quiz

  ```python
  [1, 2, 3] == [1.0, 2, 3.0]
  ```

  Tomar algunos de autoevaluacion

]
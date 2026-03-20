#import "@preview/touying:0.6.3": *
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

  ```python
  >>> l1 == l2
  False
  ```
]

#slide[
  = ¿Qué quiere decir que es ordenada?

  Y estas otras listas, ¿son iguales?

  ```python
  >>> l1 = [1, 2, 3]
  >>> l2 = [1, 2, 3]
  ```

  ```python
  >>> l1 == l2
  True
  ```

  #show: later

  *¿Y son idénticas?*

  ```python
  >>> l1 is l2
  False
  ```
]

#slide[
  = Igualdad en valor y en identidad

  Mientras `==` compara valor, `is` compara identidad.

  #reveal-code(
    lines: (2, 4, 6, 8),
    before: none,
    after: hide,
  )[
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
  ]

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
    lines: (1, 3),
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

  #touying-raw(
    ```py
    >>> autores[0]
    'Agresti'
    >>> autores[1]
    'Dobson'
    >>> autores[2]
    'Gelman'
    ```
  )

  #pause

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

  #touying-raw(
    ```py
    >>> autores = ["Agresti", "Dobson", "Gelman"]
    >>> autores[-1]
    //pause
    'Gelman'
    ```
  )


  #pause

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

  #pause

  Por ejemplo:

  #touying-raw(
    ```py
    >>> ingredientes = ["Azúcar", "Flores", "Colores", "Sustancia X"]
    >>> ingredientes[1:3]
    // pause
    ['Flores', 'Colores']
    ```
  )

]

#slide[
  = Acceder a sublistas

  Se puede pasar solo el límite superior:

  ```py
  >>> lista[:fin]
  ```

  #pause

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

  #pause

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

  #pause

  ```py
  >>> cosas = ["a", "b", "c", "d", "e", "f"]
  >>> cosas[:-2]
  >>> cosas[-5:]
  ```

  #pause

  ```python
  >>> [0][0]
  >>> [1][1]
  ```

  #pause

  ```python
  >>> cosas = [True, False, False, None]
  >>> cosas[4 / 2]
  ```

]

#slide[
  = Reemplazar elementos

  ```py
  >>> marcas = ["Puerto Blest", "Martínez", "Fuego Tostadores"]
  ```

  #pause

  Reemplazar un único elemento:

  #touying-raw(
    ```py
    >>> marcas[0] = "Bialetti"
    >>> marcas
    ['Bialetti', 'Martínez', 'Fuego Tostadores']
    ```
  )

  #pause

  Reemplazar una sublista:

  #touying-raw(
      ```py
    >>> marcas[1:3] = ["Indios Verdes", "John & Joe"]
    >>> marcas
    ['Bialetti', 'Indios Verdes', 'John & Joe']
    ```
  )

]

#slide[
  = Reemplazar elementos

  ¡Valen índices negativos!

  #touying-raw(
    ```py
    >>> marcas[-3] = "Cuervo"
    >>> marcas
    ['Cuervo', 'Indios Verdes', 'John & Joe']
    ```
  )


  #pause

  También en rebanadas:

  #touying-raw(
    ```py
    >>> marcas[-2:] = ["Martínez", "Fuego Tostadores"]
    >>> marcas
    ['Cuervo', 'Martínez', 'Fuego Tostadores']
    ```
  )

  #pause

  #touying-raw(
    ```py
    >>> marcas[-3:-1] = ["Puerto Blest", "Indigo"]
    >>> marcas
    ['Puerto Blest', 'Indigo', 'Fuego Tostadores']
    ```
  )

]


#slide[
  = Agregar elementos, al final

  #v(-0.5em)

  De a uno, al final, utilizando el método `.append()`:

  #touying-raw(
    ```py
    >>> vocales = ["a", "e", "i", "o"]
    >>> vocales.append("u")
    //pause
    >>> vocales
    ['a', 'e', 'i', 'o', 'u']
    ```
  )

  #pause

  Con otra lista #footnote[En realidad, cualquier otra secuencia.], utilizando `.extend()`:

  #touying-raw(
    ```py
    >>> bartulos = [3.14, "casa", 11]
    >>> bartulos.extend(["casa", True])
    //pause
    >>> bartulos
    [3.14, 'casa', 11, 'casa', True]
    ```
  )

]

#slide[
  #show heading: set text(size: 0.9em)
  = Agregar elementos, en posición arbitraria

  También se puede insertar un elemento en una posición arbitraria con `.insert()`:

  #touying-raw(
    ```py
    >>> logicos = [True, True, False, False]
    >>> logicos.insert(2, "surprise")
    >>> logicos
    // pause
    [True, True, 'surprise', False, False]
    ```
  )

  #pause

  #info(title: "Importante")[
    La posición indica dónde se agrega el nuevo elemento. \
    El resto de los elementos se desplaza hacia la derecha.
  ]

  #pause

  Tanto `.append()`, como `.extend()` e `insert()` son métodos *_in-place_*.

]


#slide[
  = ¿_In-place_? ¿Qué es?

  #info(title: "Definición")[
    Un método _in-place_ modifica el objeto original que realiza la llamada, no crea uno nuevo.

    En Python, estos métodos suelen devolver un valor: `None`.
  ]

  #pause

  #info(title: "Pregunta")[
    ¿Cómo podríamos verificar que el objeto al que apunta nuestra variable siga siendo el mismo luego de llamar al método _in-place_?
  ]

]


#slide[
  = Eliminar elementos

  El método `.pop()` elimina elementos a partir de su índice:

  #touying-raw(
    ```py
    >>> autores = ["McElreath", "Jaynes", "Fisher"]
    >>> autores.pop(1)
    // pause
    >>> autores
    ['McElreath', 'Fisher']
    ```
  )

  El método `.remove()` lo hace a partir del valor:

  #touying-raw(
    ```py
    >>> galletitas = ["Melba", "Oreo", "Macucas", "Rumba"]
    >>> galletitas.remove("Oreo")
    // pause
    >>> galletitas
    ['Melba', 'Macucas', 'Rumba']
    ```
  )

]


#slide[
  = Eliminar elementos: detalles

  El método `.pop()` *devuelve* el valor eliminado:

  #touying-raw(
    ```python
    >>> l = [10, 100, 1000]
    >>> e = l.pop(-1)
    // pause
    >>> e
    1000
    ```
  )

  Si no se le pasa ningún valor, extrae por defecto el último:
  #touying-raw(
    ```python
    >>> l = ["a", "bb", "ccc"]
    // pause
    >>> l.pop()
    'ccc'
    ```
  )

]

#slide[
  = Eliminar elementos: detalles

  Por otro lado, `.remove()` no devuelve nada (¿qué significa?)
  ```python
  >>> numeros = [1, 2, 3, 4, 5]
  >>> numeros.remove(3)
  ```

  Si el valor está repetido, elimina la primera ocurrencia:
  #reveal-code(
    lines: (2, 4),
    before: none,
    after: hide,
    full: true,
  )[
  ```python
  >>> l = [1, 2, 3, 2, 2, 4]
  >>> l.remove(2)
  >>> l
  [1, 3, 2, 2, 4]
  ```
  ]

  Y si no existe, arroja un error.

]

#slide[
  = Eliminar elementos con `del`

  La sentencia `del`, que se usa para eliminar variables, también elimina
  elementos de una lista.

  #reveal-code(
    lines: (2, 4),
    before: none,
    after: hide,
    full: true,
  )[
  ```python
  >>> galletitas = ["Melba", "Oreo", "Macucas", "Rumba"]
  >>> del galletitas[3]
  >>> galletitas
  ['Melba', 'Oreo', 'Macucas']
  ```
  ]

  Al igual que `.pop()` y `remove()`, `del` también opera _in-place_.

]

#slide[
  = Ordenar una lista

  #touying-raw(
    ```python
    >>> galletitas = ["Melba", "Oreo", "Macucas", "Rumba"]
    >>> galletitas.sort()
    // pause
    >>> galletitas
    ['Macucas', 'Melba', 'Oreo', 'Rumba']
    ```
  )


  #touying-raw(
    ```python
    >>> galletitas = ["Melba", "Oreo", "Macucas", "Rumba"]
    >>> galletitas.sort(reverse=True)
    // pause
    >>> galletitas
    ['Rumba', 'Oreo', 'Melba', 'Macucas']
    ```
  )

]

#slide[
  = Invertir una lista

  #reveal-code(
    lines: (2, 4),
    before: none,
    after: hide,
    full: false,
  )[
  ```python
  >>> numeros = [1, 2, 3, 4, 5, 6]
  >>> numeros.reverse()
  >>> numeros
  [6, 5, 4, 3, 2, 1]
  ```
  ]

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

#new-section-slide[Tuplas]

#slide[
  = Definición

  *Esto es una tupla*

  ```py
  >>> (1, 2, 3, 4, 5)
  (1, 2, 3, 4, 5)
  ```

  *Esto también*

  ```py
  >>> "LE", "LC", "DNI"
  ('LE', 'LC', 'DNI')
  ```

  *Pero, ¿cómo se define?*

  Una tupla es...

  - Secuencia ordenada de objetos
  - Inmutable

]

#slide[
  = Creación

  #reveal-code(
    lines: (1, 3, 5),
    before: none,
    after: hide,
    full: true,
  )[
  ```py
  >>> tipos_identificacion = ("LE", "LC", "DNI", "CUIT", "CUIL")
  >>> tipos_identificacion
  ('LE', 'LC', 'DNI', 'CUIT', 'CUIL')
  >>> type(tipos_identificacion)
  <class 'tuple'>
  ```
  ]
]

#slide[
  = Acceder a elementos

  #touying-raw(
    ```py
    >>> tipos_identificacion[0]
    'LE'
    // pause
    >>> tipos_identificacion[-1]
    'CUIL'
    // pause
    >>> tipos_identificacion[2:4]
    ('DNI', 'CUIT')
    ```
  )

  #pause

  El indexado y el _slicing_ funcionan igual que en listas.
  Al seleccionar una porción, se obtiene una nueva tupla.
]

#slide[
  = Inmutabilidad

  Al contrario de las listas, no podemos reasignar elementos:

  ```py
  >>> tipos_identificacion[0] = "NUEVO"
  TypeError: 'tuple' object does not support item assignment
  ```

  #pause

  Tampoco existen métodos como `.append()`, `.remove()` o `.sort()`.
]

#slide[
  = Operaciones útiles sobre tuplas

  En general, las operaciones no destructivas que funcionan con listas
  también funcionan con tuplas.

  #reveal-code(
    lines: (2, 4, 6, 8, 10),
    before: none,
    after: hide,
    full: false,
  )[
  ```py
  >>> sorted((4, 1, 3, 2))
  [1, 2, 3, 4]
  >>> min((4, 1, 3, 2))
  1
  >>> sum((4, 1, 3, 2))
  10
  >>> len((4, 1, 3, 2))
  4
  >>> "DNI" in tipos_identificacion
  True
  ```
  ]
]

#slide[
  = Concatenar crea otro objeto

  #reveal-code(
    lines: (2, 4, 6, 8),
    before: none,
    after: hide,
    full: false,
  )[
  ```py
  >>> original = ("LE", "LC", "DNI")
  >>> nueva = original + ("CUIT",)
  >>> original is nueva
  False
  >>> original
  ('LE', 'LC', 'DNI')
  >>> nueva
  ('LE', 'LC', 'DNI', 'CUIT')
  ```
  ]
]

#slide[
  = Tuplas como registros

  Una tupla es útil para representar estructuras pequeñas que no deberían cambiar.

  #touying-raw(
    ```py
    >>> personas = [("Juan", 29), ("Carla", 34), ("Evelina", 33)]
    //pause
    >>> personas[1]
    ('Carla', 34)
    //pause
    >>> personas[1][0]
    'Carla'
    ```
  )

  #pause

  Cada tupla es un registro `(nombre, edad)`.
]

#slide[
  = Lista vs. tupla

  - `[]` crea listas; `()` suele usarse para tuplas.#footnote[No siempre: en Python, la coma es lo que realmente define una tupla.]
  - Las listas son mutables; las tuplas son inmutables.
  - Si la colección debe cambiar, usar `list`.
  - Si la colección no debe cambiar, usar `tuple`.
]

#slide[
  = Detalle importante

  En Python, la coma define la tupla:

  ```py
  >>> x = (3)
  >>> type(x)
  <class 'int'>
  ```

  #pause

  ```py
  >>> y = (3,)
  >>> type(y)
  <class 'tuple'>
  ```

]

#new-section-slide[Diccionarios]

#slide[
  = Definición

  Un diccionario es una estructura de datos que mapea claves con valores.

  ```py
  >>> personas = {"Juan": 29, "Carla": 34, "Evelina": 33, "Ana": 38}
  >>> personas
  {'Juan': 29, 'Carla': 34, 'Evelina': 33, 'Ana': 38}
  ```

  #pause

  ```py
  >>> type(personas)
  <class 'dict'>
  ```

  #pause

  En un diccionario, cada elemento es un par `clave: valor`.
]

#slide[
  = ¿Por qué usar diccionarios?

  Queremos representar esta información:

  ```py
  >>> nombres = ["Juan", "Carla", "Evelina", "Ana"]
  >>> edades = [29, 34, 33, 38]
  ```

  #pause

  Podríamos usar una lista de tuplas:

  ```py
  >>> personas = [
  ...     ("Juan", 29), ("Carla", 34), ("Evelina", 33), ("Ana", 38)
  ... ]
  ```

  #pause

  Pero si queremos buscar la edad de una persona por nombre,
  un diccionario suele ser más natural.
]

#slide[
  = Creación

  Se definen entre llaves `{}`:

  ```py
  >>> precios = {"café": 3200, "tostado": 5800, "medialuna": 900}
  ```

  También pueden crearse con `dict()`:

  #touying-raw(
    ```py
    >>> descuentos = dict(lunes=0, martes=20, miercoles=10)
    //pause
    >>> descuentos
    {'lunes': 0, 'martes': 20, 'miercoles': 10}
    ```
  )
]

#slide[
  = Propiedades importantes

  ```py
  >>> d = {"nombre": "Juan", "edad": 29}
  >>> len(d)
  2
  ```

  #item-by-item[
    - `len(d)` cuenta pares `clave: valor`.
    - Las claves deben ser únicas.
    - Los valores pueden repetirse.
    - Es mutable.
  ]
]

#slide[
  = Claves únicas

  Si repetimos una clave, sobrevive la última asignación:

  #touying-raw(
    ```py
    >>> d = {"a": 1, "b": 2, "a": 999}
    //pause
    >>> d
    {'a': 999, 'b': 2}
    ```
  )
]

#slide[
  = Acceder a elementos

  En diccionarios no usamos índices, usamos claves:

  #reveal-code(
    lines: (1, 3, 5),
    before: none,
    after: hide,
    full: false,
  )[
  ```py
  >>> personas = {"Juan": 29, "Carla": 34, "Evelina": 33, "Ana": 38}
  >>> personas["Juan"]
  29
  >>> personas[0]
  KeyError: 0
  ```
  ]
]

#slide[
  = Verificar existencia

  Los operadores `in` y `not in` evalúan la existencia de *claves*:

  #reveal-code(
    lines: (1, 3, 5, 7, 9),
    before: none,
    after: hide,
    full: false,
  )[
  ```py
  >>> d = {"color": "azul", "forma": "cuadrado"}
  >>> "color" in d
  True
  >>> "area" in d
  False
  >>> "area" not in d
  True
  >>> "azul" in d
  False
  ```
  ]
]

#slide[
  = Acceder a claves y valores

  #reveal-code(
    lines: (1, 3, 5, 7),
    before: none,
    after: hide,
    full: false,
  )[
  ```py
  >>> d = {"color": "azul", "forma": "cuadrado"}
  >>> d.keys()
  dict_keys(['color', 'forma'])
  >>> d.values()
  dict_values(['azul', 'cuadrado'])
  >>> d.items()
  dict_items([('color', 'azul'), ('forma', 'cuadrado')])
  ```
  ]
]

#slide[
  = Modificar y agregar elementos

  La misma sintaxis sirve para ambas operaciones:

  #reveal-code(
    lines: (1, 3, 5),
    before: none,
    after: hide,
    full: true,
  )[
  ```py
  >>> personas = {"Juan": 29, "Carla": 34}
  >>> personas["Juan"] = 54
  >>> personas["Marisa"] = 29
  >>> personas
  {'Juan': 54, 'Carla': 34, 'Marisa': 29}
  ```
  ]
]

#slide[
  = Eliminar elementos

  Con `del` eliminamos una clave sin recuperar el valor:

  #touying-raw(
    ```py
    >>> descuentos = {"lunes": 0, "martes": 20, "miercoles": 10}
    >>> del descuentos["martes"]
    // pause
    >>> descuentos
    {'lunes': 0, 'miercoles': 10}
    ```
  )

  Con `.pop()` eliminamos y recuperamos el valor:

  #touying-raw(
    ```py
    >>> descuento_lunes = descuentos.pop("lunes")
    // pause
    >>> descuento_lunes
    0
    // pause
    >>> descuentos
    {'miercoles': 10}
    ```
  )
]

#slide[
  = Actualizar diccionarios

  `.update()` modifica el diccionario original:

  #touying-raw(
    ```py
    >>> datos = {"nombre": "Guille", "ciudad": "Rosario"}
    // pause
    >>> datos_nuevos = {"ciudad": "Roldán", "hijos": 2}
    >>> datos.update(datos_nuevos)
    // pause
    >>> datos
    {'nombre': 'Guille', 'ciudad': 'Roldán', 'hijos': 2}
    ```
  )

  #pause

  El operador `|` devuelve uno nuevo:

  #touying-raw(
    ```py
    >>> d1 = {"a": 1, "b": 2}
    >>> d2 = {"b": 10, "c": 25}
    >>> d3 = d1 | d2
    // pause
    >>> d3
    {'a': 1, 'b': 10, 'c': 25}
    ```
  )
]

#slide[
  = Estructuras anidadas
  #v(-0.5em)

  Los valores de un diccionario pueden ser otros diccionarios o listas:

  ```py
  >>> usuarios = {
  ...   "aeinstein": {
  ...       "nombre": "albert",
  ...       "apellido": "einstein",
  ...       "ciudad": "princeton",
  ...   },
  ...   "mcurie": {
  ...       "nombre": "marie",
  ...       "apellido": "curie",
  ...       "ciudad": "paris",
  ...   },
  ... }
  >>> usuarios["aeinstein"]["ciudad"]
  'princeton'
  ```
]

#slide[
  = Listas, tuplas y diccionarios

  - Las listas y tuplas son secuencias: se accede por posición.
    - Listas: se pueden modificar
    - Tuplas: no se pueden modificar
  - Los diccionarios no son secuencias: se accede por clave.
  - Si el problema es clave #sym.arrow valor, usar `dict`.
]

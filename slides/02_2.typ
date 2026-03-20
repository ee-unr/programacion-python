#import "@preview/touying:0.6.3": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/gentle-clues:1.3.1": *

#import "template.typ": inverted-slide, new-section-slide, setup-template
#import "utils.typ": item-by-item, reveal-code

#show: codly-init.with()
#codly(
  languages: codly-languages,
  display-name: false,
  display-icon: false,
  zebra-fill: none,
  smart-indent: false,
  number-format: none,
)

#show: setup-template.with(
  title: [Programación en Python],
  subtitle: [Clase 2.2: Uso de código externo],
  date: [25/03/2026],
  header-label: [Clase 2.2],
  footer-label: [Uso de código externo],
)

#slide[
  = Motivación

  Supongamos que necesitamos:

  #item-by-item[
    - Calcular una raíz cuadrada
    - Generar números aleatorios
    - Obtener un promedio
  ]

  #jump(4)

  #v(1em)
  #memo(title: "Problema")[
    No hay función _built-in_ que realice esas tareas en Python.
  ]

  #pause
  #v(1em)

  #question(title: "¿Qué hacemos?")[
    ¿Tiene sentido programarlas desde cero?
  ]

]

#slide[
  = Motivación

  Supongamos que necesitamos:

  - Calcular una raíz cuadrada
  - Generar números aleatorios
  - Obtener un promedio


  #v(1em)
  #memo(title: "Problema")[
    No hay función _built-in_ que realice esas tareas en Python.
  ]

  #v(1em)

  #question(title: "¿Qué hacemos?")[
    ¿Tiene sentido programarlas desde cero? *Por supuesto que no*.
  ]

]

#new-section-slide[Módulos y paquetes]

#slide[
  = Módulos y paquetes

  #item-by-item[
    - Cuando usamos código externo lo hacemos a través de módulos y paquetes.
    - Un *módulo* es un archivo de Python, por ejemplo `modulo.py`.
    - Un *paquete* es una colección de módulos organizados de manera particular.
  ]

  #jump(5)

  === ¿Para qué existen?

  #item-by-item(start: 6)[
    - Para no repetir código.
    - Para organizar un programa de mejor manera.
    - Para aprovechar código escrito por otras personas.
  ]

]

#slide[
  = Librería estándar de Python

  Colección de módulos y paquetes que viene incluida con Python.

  #pause

  Ejemplos:

  - `math`
  - `random`
  - `statistics`
  - `os`
  - ...


]

#new-section-slide[Importar código]

#slide[
  = La sentencia `import`

  La forma más simple de importar un módulo o paquete es:

  ```py
  import <nombre>
  ```

  #pause

  Y después accedemos a sus objetos con `math.nombre`.

  #touying-raw(
    ```py
    >>> import math
    //pause
    >>> math.sqrt(16)
    4.0
    //pause
    >>> math.pi
    3.141592653589793
    //pause
    >>> type(math.pi)
    <class 'float'>
    ```
  )
]

#slide[
  = Comprendiendo los _namespaces_

  Importar `math` disponibiliza de manera directa el módulo `math`,\
  no los objetos que contiene en su _namespace_
  #footnote[Puede ser pensado como el equivalente de un ambiente en R].

  #touying-raw(
    ```py
    >>> import math
    >>> sqrt(16)
    //pause
    NameError: name 'sqrt' is not defined
    ```
  )

]

#slide[
  = Importar varios módulos o paquetes

  Basta con escribir varios `import`:

  #touying-raw(
    ```py
    >>> import math
    >>> import random
    //pause
    >>> math.factorial(5)
    120
    //pause
    >>> random.random()
    0.34718286416366235
    ```
  )
]

#slide[
  = ¿Qué hay adentro de un _namespace_?

  La función `dir()` lista los nombres en el _namespace_ de un objeto,
  e.g. de   módulos y paquetes:

  #touying-raw(
    ```py
    >>> import math
    >>> dir(math)
    ['acos', 'asin', 'cos', 'pi', 'sqrt', ...]
    ```
  )

  #pause

  #danger(title: [¡`dir` funciona con cualquier objeto!])[
    ```py
    >>> dir("hola :)")
    ['__add__', '__class__', '__contains__', '__delattr__', ...]
    ```
  ]

  #pause

  En la práctica, el autocompletado del editor suele alcanzar.

]

#slide[
  = `from ... import ...`

  Se pueden importar objetos específicos:

  #touying-raw(
    ```py
    >>> from math import log
    //pause
    >>> log(5)
    1.6094379124341003
    ```
  )

  #pause

  También se pueden importar múltiples objetos en específico:

  #touying-raw(
    ```py
    >>> from statistics import mean, median
    >>> numeros = [4, 5, 9, 30, 3, 8, 6]
    //pause
    >>> mean(numeros)
    9.285714285714286
    //pause
    >>> median(numeros)
    6
    ```
  )
]


#slide[
  = Uso de aliases

  Podemos renombrar lo que importamos.

  #pause

  Vale con módulos:

  ```py
  >>> import math as mates
  >>> mates.cos(mates.pi)
  -1.0
  ```

  #pause

  Y cualquier objeto en general:

  ```py
  >>> from math import sqrt as raiz
  >>> raiz(81)
  9.0
  ```

]

#slide[
  = Importar todo

  Es posible traer todos los objetos de un módulo/paquete al _namespace_ actual.

  #pause
  #v(1em)

  ```py
  from <module> import *
  ```

  #pause
  #v(1em)

  Pero, es una *pésima idea* #emoji.thumb.down

  #pause
  #v(1em)

  #item-by-item(start: 4)[
    - Se incorporan una cantidad desconocida (potencialmente grande) de nombres al ambiente actual.
    - Pueden ocasionar colisiones de nombres y sobrevive el último en ser cargado.
    - Después cuesta saber de dónde salió y qué es cada cosa.
  ]

]

#new-section-slide[Módulos propios]

#slide[
  = Un módulo propio

  Un archivo llamado `funciones.py` también es un módulo. Supongamos:
  #pause
  ```py
  def es_par(n):
      if n % 2 == 0:
          return True
      return False

  def es_primo(n):
      if n <= 1:
          return False
      for i in range(2, n):
          if n % i == 0:
              return False
      return True
  ```
]

#slide[
  = Importar módulo propio

  Si lo queremos importar, ¿dónde tiene que estar?
  #pause

  Si el módulo está en el proyecto actual (en la raíz o un subdirectorio), Python puede encontrarlo.

  #pause

  ```text
  proyecto/
  ├── funciones.py
  └── programa.py
  ```


]

#slide[
  = Importar módulo propio

  Desde `programa.py`:

  #touying-raw(
    ```py
    >>> import funciones
    //pause
    >>> funciones.es_par(12)
    True
    //pause
    >>> funciones.es_par(15)
    False
    //pause
    >>> funciones.es_primo(11)
    True
    ```
  )
]

#slide[
  = Importar objetos del módulo propio

  También funciona así:

  #touying-raw(
    ```py
    >>> from funciones import es_par, es_primo
    //pause
    >>> es_par(12)
    True
    //pause
    >>> es_primo(15)
    False
    ```
  )

]

#new-section-slide[Paquetes externos]

#slide[
  = ¿Qué cambia?

  #item-by-item[
    - Los módulos de la librería estándar ya vienen con Python.
    - Los paquetes externos se instalan aparte.
    - El gestor más común es `pip`.
    - El repositorio más usado es PyPI.
  ]
]

#slide[
  = `pip`

  `pip` se usa desde la terminal #footnote[Aunque Posit nos engaña y nos permite hacerlo desde la consola.]

  #pause

  Consultar paquetes instalados:

  ```bash
  pip list
  ```

  #pause

  Instalar un paquete:

  ```bash
  pip install nombre-paquete
  ```
]

#slide[
  = `python -m pip`

  También podemos ejecutar `pip` como módulo de Python:

  ```bash
  python -m pip install nombre-paquete
  ```

  #pause

  #info(title: "¿Para qué sirve?")[
    Ayuda a que `pip` quede asociado al Python que estamos usando.
  ]
]

#slide[
  = Resumen

  #item-by-item[
    - #raw("import modulo", lang: "python") trae el módulo.
    - #raw("from modulo import objeto", lang: "python") trae un objeto puntual.
    - Un archivo `.py` propio, y sus objetos, también pueden importarse.
    - La herramienta `pip` permite instalar paquetes de terceros.
  ]
]

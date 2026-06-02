#import "@preview/touying:0.6.3": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/gentle-clues:1.3.1": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, ellipse

#import "template.typ": inverted-slide, new-section-slide, setup-template
#import "utils.typ": item-by-item, reveal-code
#import "list-diagram.typ": list-diagram

#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)
#let commit-style = (
  width: 11mm,
  height: 9mm,
  fill: white,
  stroke: rgb("#BF0F1F"),
  shape: ellipse,
)

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
  subtitle: [Clase 12: Git & GitHub],
  date: [03/06/2026],
  header-label: [Clase 12],
  footer-label: [Git & GitHub],
)

#new-section-slide[Git, GitHub... ¿qué son?]

#slide[
  = Git, GitHub... ¿qué son?

  *Git* es un sistema de control de versiones distribuido.

  #pause

  *GitHub* es una plataforma en línea para alojar proyectos gestionados con Git.
  
  #pause
  
  Git puede usarse sin GitHub.
  
  #pause
  
  GitHub no reemplaza a Git, lo complementa.

]

#new-section-slide[Git]

#slide[
  = A quién no le pasó

  #pause

  #align(center)[
    #image("imgs/caos.png", width: 92%)
  ]
 

]

#slide[
  = Sistema de Control de Versiones (VCS)

  Un *VCS* permite:

  - Mantener un registro del historial de cambios.
  - Documentar *qué* cambió y *cuándo* cambió.
  - Volver a versiones anteriores si algo sale mal.
  - Coordinar el trabajo cuando participan varias personas.

  #pause

  #v(2em)

  Algunos ejemplos:

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    rows: auto,
    align: center,
    image("imgs/cvs-logo.svg", width: 50%),
    image("imgs/subversion-logo.svg", width: 50%),
    image("imgs/mercurial-logo.svg", width: 50%),
    image("imgs/git-logo.svg", width: 67%)
  )

]

#slide[
  = El proyecto como historial

  Git guarda "fotografías" del estado del proyecto en distintos momentos.

  #align(center)[
    #image("imgs/tree.svg", width: 80%)
  ]

  Cada punto representa un _*commit*_: una instantánea de los cambios guardados.
]

#slide[
  = Sobre Git

  Existen distintos sistemas de control de versiones. Lo distintivo de Git es que es:

  - *Distribuido*: cada persona tiene una copia completa del repositorio y de su historial.
  - *Eficiente*: las operaciones suelen ser rápidas y el almacenamiento es liviano.
  - *Completo*: permite registrar cambios, comparar versiones, crear ramas y fusionarlas.
  - _*Open source*_: es libre y sigue evolucionando desde su aparición en 2005.

  #v(1em)

  
  Página oficial: #link("https://git-scm.com")


]

#slide[
  = Instalación

  #align(center + horizon)[
    #text(48pt)[Demostración en vivo]
  ]

]

#slide[
  = Git Bash

  Git Bash es una consola para usar Git y comandos de terminal estilo Linux dentro de Windows.

  === Comandos básicos de Bash

  #codly(number-format: numbering.with("1"))
  ```bash
  ls
  cd <directorio>
  cd ..
  pwd
  mkdir <nombre>
  touch <nombre>
  rm <nombre>
  cp <nombre> <directorio>
  mv <nombre> <directorio>
  ```

  #codly(number-format: none)
]

#slide[
  = Configuración mínima

  Todas las acciones en Git necesitan un autor.

  Se utiliza el comando `git config` de la siguiente manera:

  ```bash
  git config --global user.name <nombre>
  git config --global user.email <email>
  ```

  Si se omite el _flag_ `--global`, la configuración aplica solo al repositorio donde se realiza.

  Para ver qué otras cosas se pueden hacer con `git config`:

  ```bash
  git config -h
  ```

]

#slide[
  = Repositorio

  Un *repositorio* es un lugar donde se guarda un proyecto, incluyendo sus archivos, carpetas y el historial de cambios.

  #pause

  Git se encarga del seguimiento del historial de cambios y nos permite navegar entre versiones
  de nuestro proyecto.

  #pause

  Las *ramas* hacen posible trabajar de forma colaborativa e independiente:
  se pueden realizar cambios, probar ideas o corregir errores sin afectar directamente
  el proyecto principal.

  #pause

  Git se encarga de que la *fusión* de cambios sea amena y segura.
]

#slide[
  = Inicialización de un repositorio

  Para inicializar un repositorio se debe ejecutar `git init` en la raíz del proyecto:

  ```bash
  git init
  ```
  ```
  Initialized empty Git repository in /prueba/.git/
  ```

  #pause

  Se crea una carpeta oculta llamada `.git` que contiene
  todas las referencias asociadas al sistema de control de versiones.

  ```bash
  ls .git
  ```
  ```
  branches  config  description  HEAD  hooks  info  objects  refs
  ```

]


#slide[
  = Guardado de cambios

  En Git no alcanza con modificar archivos:
  
  1. Hay que elegir qué cambios guardar.
  2. Luego, hay que "guardarlos" explícitamente

  #pause

  ```bash
  git status
  git add <archivo>
  git add .
  git commit -m "<mensaje>"
  ```

  - `git status` muestra el estado actual del repositorio.
  - `git add` agrega cambios al área de _stage_.
  - `git commit` crea la fotografía del estado preparado.
  - El mensaje debe describir de manera clara qué se guardó.

]

#slide[
  = El área de _stage_

  El área de _stage_ es una zona intermedia donde se preparan los cambios del próximo commit.

  #v(1em)

  #align(center)[
    ```text
    archivos modificados  ->  stage  ->  commit
    ```
  ]

  #v(1em)

  Git solo guarda en el commit los cambios que fueron agregados con `git add`.
]

#slide[
  = Consulta de estado

  Para saber qué está pasando en el repositorio usamos principalmente:

  ```bash
  git status
  git log
  ```

  - `git status` muestra archivos modificados, eliminados, agregados o no rastreados.
  - También indica qué cambios ya están en _stage_ y cuáles no.
  - `git log` muestra la lista de commits realizados.
  - Cada commit tiene un *hash* que lo identifica de manera única.
]

// #slide[
//   = `HEAD`

//   `HEAD` es un puntero al commit actual del repositorio.

//   #v(1em)

  
//   - Indica nuestra posición actual en la línea de tiempo del proyecto.
//   - Cuando hacemos un nuevo commit, `HEAD` se mueve hacia ese commit.
//   - Permite entender desde qué versión estamos trabajando.


//   #v(1em)
//   #info(title: "Síntesis")[
//     El historial contiene muchos commits y `HEAD` señala dónde estamos parados ahora.
//   ]

// ]

#slide[
  = Ramas

  Una *rama* es una línea de desarrollo independiente dentro del repositorio.

  - Permite trabajar en una parte del proyecto sin afectar directamente a otras.
  - Sirve para probar ideas, desarrollar funcionalidades o corregir errores.
  - Cada rama tiene su propio conjunto de cambios y commits.
  - Cuando el trabajo está listo, puede fusionarse con otra rama.
]

#slide[
  = Ramas
  Una rama parte de un _commit_, avanza de manera separada y luego puede integrarse.

  #align(center)[
    #image("imgs/merge.png", width:80%)
  ]


]

#slide[
  = Manipulación de ramas

  Comandos básicos para crear y movernos entre ramas:

  ```bash
  git branch
  git branch <nombre_rama>
  git switch <nombre_rama>
  git switch -c <nombre_rama>
  git checkout -b <nombre_rama>
  ```

  - `git branch` lista las ramas existentes.
  - `git branch <nombre_rama>` crea una rama nueva.
  - `git switch <nombre_rama>` cambia a otra rama.
  - `git switch -c` crea una rama y se mueve a ella.

]

#slide[
  = Fusión de ramas

  En algún momento necesitamos integrar el trabajo de una rama en otra.

  Usaremos `git merge`.

  ```bash
  git merge <nombre_rama>
  ```

  - Hay que estar situados en la rama de destino.
  - Git toma los cambios de la otra rama y los aplica sobre la actual.
  - La fusión combina los historiales de ambas líneas de trabajo.
  - Después se puede verificar el resultado con `git status` o `git log`.
]


#slide[
  = Eliminación de ramas

  Cuando una rama ya cumplió su objetivo, puede eliminarse:

  ```bash
  git branch -d <nombre_rama>
  git branch -D <nombre_rama>
  ```

  #item-by-item[
    - `-d` intenta borrar la rama de manera segura.
    - `-D` fuerza la eliminación.
    - Conviene borrar ramas cuando ya fueron integradas o dejaron de ser útiles.
  ]
]

#slide[
  = El archivo `.gitignore`

  A veces hay archivos que no queremos incluir en los commits:
  
  - Información delicada que no debería versionarse.
  - Archivos temporales.
  - Resultados generados automáticamente.
  - Configuraciones locales.

  #pause

  El archivo `.gitignore` se ubica en la raíz del proyecto y contiene *reglas de exclusión*.
  Por ejemplo:

  ```textpb
  archivo_temporal.txt
  carpeta_temporal/
  *.log
  **/temp
  ```

  #pause

  El archivo `.gitignore` sí debe agregarse al repositorio.

]


// #slide[
//   = Resumen

//   Flujo mínimo de trabajo con Git:

//   ```bash
//   git init
//   git status
//   git add <archivo>
//   git commit -m "<mensaje>"
//   git branch <nombre_rama>
//   git switch <nombre_rama>
//   git merge <nombre_rama>
//   ```

// ]

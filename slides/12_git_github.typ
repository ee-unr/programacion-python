#import "@preview/touying:0.6.3": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *

#import "template.typ": inverted-slide, new-section-slide, setup-template

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

  - `-d` intenta borrar la rama de manera segura.
  - `-D` fuerza la eliminación.
  - Conviene borrar ramas cuando ya fueron integradas o dejaron de ser útiles.
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

#new-section-slide[GitHub]

#slide[
  = GitHub: de local a remoto

  Hasta ahora trabajamos con Git en nuestra computadora.

  GitHub agrega un repositorio remoto: una copia del proyecto alojada en un servidor.

  - Permite compartir código con otras personas.
  - Sirve como punto común para sincronizar cambios.
  - Conserva el historial de Git también en la nube.
  - Es útil tanto para equipos como para proyectos individuales.
]

#slide[
  = Repositorios remotos

  En GitHub, los proyectos se guardan en repositorios.

  - Un repositorio público puede ser visto por cualquier persona.
  - Un repositorio privado solo es accesible para quienes tengan permiso.
  - Cada repositorio tiene una URL propia.
  - La URL suele seguir el formato `https://github.com/<usuario>/<repositorio>`.

  GitHub también suma herramientas de colaboración: issues, pull requests, revisión de código y acciones automáticas.
]

#slide[
  = Repositorio personal y repositorio de proyecto

  GitHub permite crear distintos tipos de repositorios.

  - El repositorio personal usa el mismo nombre que el usuario.
  - Ese repositorio define la página principal del perfil.
  - Un repositorio de proyecto guarda el código de una aplicación, análisis, paquete o trabajo específico.
  - Para un proyecto existente en local, se puede crear un repositorio vacío en GitHub y vincularlo después.
]

#slide[
  = Archivos habituales en GitHub

  Al crear un repositorio, GitHub puede inicializar algunos archivos útiles.

  - `README.md`: documentación inicial del proyecto.
  - `.gitignore`: reglas para no versionar archivos innecesarios o sensibles.
  - Licencia: condiciones de uso, distribución y colaboración.

  `README.md` se escribe normalmente en Markdown, un formato simple para estructurar texto, enlaces, listas, tablas e imágenes.
]

#slide[
  = Autenticación SSH

  Para interactuar con GitHub desde la terminal necesitamos autenticarnos.

  SSH utiliza dos claves:

  - Una clave privada, que queda en nuestra computadora.
  - Una clave pública, que agregamos a la cuenta de GitHub.

  Con esa relación, GitHub puede reconocer que nuestra computadora está autorizada para acceder a los repositorios correspondientes.

  #link("https://docs.github.com/es/authentication/connecting-to-github-with-ssh")

]

#slide[
  = Conectar local y remoto

  Si ya tenemos un proyecto con Git en local, debemos asociarlo al repositorio remoto.

  ```bash
  git remote add origin git@github.com:<usuario>/<repositorio>.git
  ```

  `origin` es el nombre habitual de la referencia remota.

  La primera subida suele indicar también rama y remoto:

  ```bash
  git push -u origin main
  ```

  El `-u` deja configurado el destino para futuros `git push`.
]

#slide[
  = Clonar un repositorio

  Si el proyecto ya existe en GitHub, podemos traerlo a nuestra computadora.

  ```bash
  git clone <URL>
  ```

  Clonar no es lo mismo que descargar un `.zip`.

  - Trae archivos, ramas, etiquetas e historial.
  - Deja el proyecto listo para seguir usando Git.
  - Puede hacerse con HTTPS o SSH.
  - SSH suele ser más cómodo cuando ya configuramos autenticación.
]

#slide[
  = Sincronización remota

  En un proyecto compartido, el repositorio remoto puede cambiar mientras trabajamos en local.

  ```bash
  git fetch
  git pull
  ```

  - `git fetch` descarga información del remoto, pero no aplica cambios sobre nuestros archivos.
  - `git pull` descarga cambios y los fusiona con nuestra rama local.
  - Si aparecen conflictos, hay que resolverlos antes de continuar.
  - La primera vez puede ser necesario definir cómo combinar cambios:

  ```bash
  git config pull.rebase false
  ```
]

#slide[
  = Subir código a GitHub

  El flujo local sigue siendo el mismo: modificar, preparar y crear commit.

  ```bash
  git status
  git add <archivo>
  git commit -m "<mensaje>"
  git push
  ```

  `git push` envía los commits locales al repositorio remoto.

  Si otras personas subieron cambios antes, Git puede rechazar el `push` hasta que sincronicemos con `pull`.
]


#slide[
  = Forks

  Un *fork* es una copia de un repositorio creada en nuestra cuenta de GitHub.

  Se usa cuando:

  - No tenemos permisos de escritura en el repositorio original.
  - Queremos proponer cambios sin modificar directamente el proyecto base.
  - Queremos experimentar o evolucionar el proyecto por nuestra cuenta.

  Después de hacer el fork, podemos clonarlo, modificarlo, hacer commits y subir cambios a nuestra copia.
]

#slide[
  = Pull Requests

  Una *pull request* es una solicitud para que revisen e integren nuestros cambios.

  En el flujo con fork:

  - Hacemos un fork del repositorio original.
  - Clonamos nuestra copia.
  - Modificamos archivos y creamos commits.
  - Subimos los cambios con `git push`.
  - Abrimos una pull request hacia el repositorio original.

  Quien mantiene el proyecto revisa la propuesta y, si corresponde, hace el merge.
]

#slide[
  = Resumen GitHub

  Proyecto propio:

  ```text
  crear repo remoto -> git remote add -> git push -> git pull / git fetch
  ```

  Proyecto ajeno:

  ```text
  fork -> git clone -> cambios -> git add / commit / push -> pull request
  ```

  Git sigue registrando el historial.

  GitHub agrega el punto remoto donde se comparte, sincroniza y revisa el trabajo.
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

# Plantilla de curso en Quarto

Plantilla de Quarto para crear sitios web para cursos.

## Uso

### Dependencias

- [Quarto](https://quarto.org/docs/get-started/), versión 1.8 o superior.

### Primeros pasos

1. En GitHub, hacer clic en el botón verde **Use this template** y crear un nuevo repositorio.
1. Clonar el nuevo repositorio en tu máquina local.
1. Modificar los archivos de configuración mencionados en
[Configuración del sitio](#configuración-del-sitio), según sea necesario.

Para visualizar el sitio de forma local, se pueden usar los comandos:

- `quarto preview` para ver los cambios en tiempo real, o
- `quarto render` para generar todo el sitio y explorarlo de manera estática (por defecto, guardado en `_site`).

### Publicación

Para publicar el sitio web en GitHub Pages,
ver la [documentación oficial de Quarto](https://quarto.org/docs/publishing/github-pages.html).

Esta plantilla incluye una [acción de GitHub](.github/workflows/publish.yml)
para compilar y publicar el sitio de forma automática.

>[!NOTE]
> Aunque se compile y publique el sitio automáticamente mediante GitHub Actions, es necesario
> utilizar `quarto publish gh-pages` al menos una vez de forma manual, tal como se indica en la 
> documentación de Quarto.

## Configuración del sitio

### Contenido

La plantilla incluye contenidos de ejemplo para los datos del curso.
Para adaptarla a un curso específico, es necesario editar los siguientes archivos:

* `_quarto.yml`: configuración del proyecto de Quarto.  
Define aspectos como el nombre del curso, su logo, el favicon, el pie de página,
así como el contenido del _sidebar_ y del _navbar_, entre otros.
* `templates/front.yml`: datos del curso que se muestran en la _home_.
* `templates/instructors.yml`: datos de los docentes que se muestran en la _home_.

### Estilo

El estilo visual del sitio está determinado por los siguientes archivos:

* `_brand.yml`: configuración del _branding_ del sitio.  
Centraliza la definición de colores, tipografías y otros elementos visuales,
y establece variables que son utilizadas por los estilos SCSS de la plantilla en el archivo `styles.scss`.
Para más información, ver [_Multiformat branding with `_brand.yml`_](https://quarto.org/docs/authoring/brand.html).
* `styles.scss`: define los estilos del sitio utilizando las variables declaradas en `_brand.yml`.

Una vez clonado el repositorio, estos archivos se pueden modificar para adaptar el sitio según se desee.

### Otros

- `templates/front.ejs` y `templates/instructors.ejs`: plantillas EJS que luego se utilizan en la _home_.
- `citas/bibliografia.bib`: archivo de bibliografía en formato BibTeX.

## Extensiones

Se utilizan las siguientes extensiones de Quarto:

- [quarto-ext/fontawesome](https://github.com/quarto-ext/fontawesome): para usar íconos de Font Awesome.
- [pandoc-ext/section-bibliographies](https://github.com/pandoc-ext/section-bibliographies): para generar bibliografías por sección.

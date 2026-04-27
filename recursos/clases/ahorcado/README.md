# Ahorcado

Juego de ahorcado en consola.

## Uso

```cmd
python ahorcado.py
```

Durante la partida:

- Ingresá una letra por turno.
- `Ctrl+C` o `Ctrl+D` sale del juego.
- Si usás `-a/--ayuda`, se muestra la definición de la palabra.

## CLI

```text
usage: ahorcado.py [-h] [-d DIFICULTAD] [-l LONGITUD] [-a]
                   [-c {estadistica,lenguaje,programacion,raras}]

Juego del ahorcado con palabras cargadas desde JSON.

options:
  -h, --help            show this help message and exit
  -d, --dificultad      Filtra las palabras por nivel de dificultad.
  -l, --longitud        Filtra las palabras por longitud.
  -a, --ayuda           Muestra la definicion de la palabra debajo del tablero.
  -c, --conjunto        Selecciona un conjunto de datos especifico.
```

Ejemplos:

```bash
python ahorcado.py -a
python ahorcado.py -c lenguaje
python ahorcado.py -d media
python ahorcado.py -l 8
```

## Datos

Los datos están en `datos/` y cada registro tiene:

```json
{"palabra": "humanidad", "dificultad": "media", "significado": "Conjunto de los seres humanos."}
```

Conjuntos disponibles:

- `lenguaje.json`: 845 palabras. Vocabulario general en español con definiciones breves.
- `raras.json`: 194 palabras. Palabras poco comunes o de uso menos frecuente.
- `estadistica.json`: 97 palabras. Términos básicos y frecuentes de estadística.
- `programacion.json`: 49 palabras. Términos introductorios de programación y conceptos afines.

## Sonidos

Archivos en `sonidos/`:

- `wrong.wav`: letra incorrecta
- `block.wav`: entrada inválida o repetida
- `fail.wav`: derrota
- `win.wav`: victoria

## Nota

El juego usa `winsound`, así que los sonidos están pensados para Windows.

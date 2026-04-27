import argparse    # Crear una CLI
import json        # Leer (y escribir) archivos JSON
import os          # Para interactuar con el sistema operativo
import random      # Selección al azar
import shutil      # Consultar tamaño de la terminal
import textwrap    # Partir texto en múltiples líneas
import winsound    # Emitir sonidos (en Windows!)

from pathlib import Path  # Crear y manipular rutas


# Imágenes del ahorcado (la r permite tomar todos los caracteres de manera literal)
IMAGENES = [
    r"""
  +---+
      |
      |
      |
    =====""",
    r"""
  +---+
  O   |
      |
      |
    =====""",
    r"""
  +---+
  O   |
  |   |
      |
    =====""",
    r"""
  +---+
  O   |
 /|   |
      |
    =====""",
    r"""
  +---+
  O   |
 /|\  |
      |
    =====""",
    r"""
  +---+
  O   |
 /|\  |
 /    |
    =====""",
    r"""
  +---+
  O   |
 /|\  |
 / \  |
    =====""",
]

# Declaración de constantes (rutas, conjuntos, puntajes, etc.)
SONIDOS_DIR = Path("sonidos")
DATA_DIR = Path("datos")
CONJUNTOS = ("estadistica", "lenguaje", "programacion", "raras")
SONIDOS = {
    "error": SONIDOS_DIR / "wrong.wav",
    "bloqueo": SONIDOS_DIR / "block.wav",
    "derrota": SONIDOS_DIR / "fail.wav",
    "victoria": SONIDOS_DIR / "win.wav",
}
PUNTAJES_POR_ERRORES = {
    0: 100,
    1: 70,
    2: 50,
    3: 30,
    4: 10,
    5: 5,
}


def limpiar_pantalla():
    os.system("cls||clear")


def reproducir_sonido(archivo):
    try:
        winsound.PlaySound(
            str(archivo),
            winsound.SND_FILENAME | winsound.SND_ASYNC | winsound.SND_NODEFAULT,
        )
    except RuntimeError:
        pass


def leer_entrada(entrada):
    try:
        return input(entrada)
    # EOFError: Ctrl+D o Ctrl+Z
    # KeyobardInterrupt: Ctrl+C
    except (EOFError, KeyboardInterrupt):
        print()
        raise SystemExit("Saliendo del juego.")


def imprimir_encabezado(
    palabras_adivinadas,
    palabras_jugadas,
    puntos_acumulados,
    letras_erradas,
    ancho_terminal
):
    resumen_superior = (
        f"Puntos: {puntos_acumulados} | Adivinadas: {palabras_adivinadas} | Jugadas: {palabras_jugadas}"
    )
    resumen_errores = f"Fallos: {len(letras_erradas)}/6"
    espacio = ancho_terminal - len("AHORCADO") - len(resumen_superior)

    print("AHORCADO" + " " * espacio + resumen_superior)
    print(resumen_errores.rjust(ancho_terminal))


def mostrar_tablero(
    letras_erradas,
    letras_acertadas,
    palabra_secreta,
    puntos_acumulados,
    palabras_adivinadas,
    palabras_jugadas,
    ayuda_palabra="",
    mensaje_estado="",
):
    limpiar_pantalla()
    ancho_terminal = shutil.get_terminal_size(fallback=(80, 24)).columns
    imprimir_encabezado(
        palabras_adivinadas=palabras_adivinadas,
        palabras_jugadas=palabras_jugadas,
        puntos_acumulados=puntos_acumulados,
        letras_erradas=letras_erradas,
        ancho_terminal=ancho_terminal
    )
    print(IMAGENES[len(letras_erradas)])
    print()

    if letras_erradas:
        print("Fallos: " + " ".join(letras_erradas))
    else:
        print("Fallos: ")

    progreso = ""
    for letra in palabra_secreta:
        if letra in letras_acertadas:
            progreso += letra + " "
        else:
            progreso += "_ "

    print("Palabra: " + progreso.strip())
    if mensaje_estado:
        print("Estado: " + mensaje_estado)
    
    if ayuda_palabra:
        print("Ayuda:")
        for linea in textwrap.wrap(ayuda_palabra, width=max(20, ancho_terminal - 2),):
            print(linea)
    print()


def pedir_letra(
    letras_usadas,
    letras_erradas,
    letras_acertadas,
    palabra_secreta,
    puntos_acumulados,
    palabras_adivinadas,
    palabras_jugadas,
    ayuda_palabra,
):
    mensaje_error = ""

    while True:
        mostrar_tablero(
            letras_erradas,
            letras_acertadas,
            palabra_secreta,
            puntos_acumulados,
            palabras_adivinadas,
            palabras_jugadas,
            ayuda_palabra,
            mensaje_error,
        )
        intento = leer_entrada("Adivina una letra (Ctrl+C para salir): ").lower().strip()

        if len(intento) != 1:
            reproducir_sonido(archivo = SONIDOS.get("bloqueo"))
            mensaje_error = "Ingresa solo una letra."
        elif not intento.isalpha():
            reproducir_sonido(archivo = SONIDOS.get("bloqueo"))
            mensaje_error = "Ingresa una letra valida (a-z, ñ)."
        elif intento in letras_usadas:
            reproducir_sonido(archivo = SONIDOS.get("bloqueo"))
            mensaje_error = "Esa letra ya la intentaste."
        else:
            return intento


def cargar_palabras_desde_json(directorio, conjunto=None):
    if conjunto is None:
        archivos_json = sorted(directorio.glob("*.json"))
    else:
        archivos_json = [directorio / f"{conjunto}.json"]

    palabras = []
    for archivo in archivos_json:
        with archivo.open(encoding="utf-8") as descriptor:
            palabras = json.load(descriptor)

    return palabras


def filtrar_palabras(registros, dificultad=None, longitud=None):
    if dificultad is not None:
        dificultad_buscada = dificultad.strip().lower()
        registros_filtrados = [
            registro
            for registro in registros
            if registro["dificultad"] == dificultad_buscada
        ]
        return registros_filtrados

    if longitud is not None:
        registros_filtrados = [
            registro
            for registro in registros
            if len(registro["palabra"]) == longitud
        ]
        return registros_filtrados

    return registros


def juego_ahorcado(registros, mostrar_ayuda=False):
    letras_erradas = []
    letras_acertadas = []
    registro_actual = random.choice(registros)
    palabra_secreta = registro_actual["palabra"]
    ayuda_palabra = registro_actual["significado"] if mostrar_ayuda else ""
    juego_terminado = False
    puntos_acumulados = 0
    palabras_adivinadas = 0
    palabras_jugadas = 0

    while True:
        letra = pedir_letra(
            letras_erradas + letras_acertadas,
            letras_erradas,
            letras_acertadas,
            palabra_secreta,
            puntos_acumulados,
            palabras_adivinadas,
            palabras_jugadas,
            ayuda_palabra,
        )

        if letra in palabra_secreta:
            letras_acertadas.append(letra)

            gano = True
            for letra_palabra in palabra_secreta:
                if letra_palabra not in letras_acertadas:
                    gano = False
                    break

            if gano:
                puntos_palabra = PUNTAJES_POR_ERRORES.get(len(letras_erradas), 0)
                puntos_acumulados += puntos_palabra
                palabras_adivinadas += 1
                palabras_jugadas += 1
                reproducir_sonido(SONIDOS.get("victoria"))
                mostrar_tablero(
                    letras_erradas,
                    letras_acertadas,
                    palabra_secreta,
                    puntos_acumulados,
                    palabras_adivinadas,
                    palabras_jugadas,
                    ayuda_palabra,
                    (
                        f"Bien! Adivinaste la palabra: {palabra_secreta}. "
                        f"Sumaste {puntos_palabra} puntos."
                    ),
                )
                juego_terminado = True
        else:
            letras_erradas.append(letra)

            if len(letras_erradas) == len(IMAGENES) - 1:
                reproducir_sonido(SONIDOS.get("derrota"))
                palabras_jugadas += 1
                mostrar_tablero(
                    letras_erradas,
                    letras_acertadas,
                    palabra_secreta,
                    puntos_acumulados,
                    palabras_adivinadas,
                    palabras_jugadas,
                    ayuda_palabra,
                    (
                        f"Te quedaste sin intentos. La palabra era: {palabra_secreta}. "
                        "Sumaste 0 puntos."
                    ),
                )
                juego_terminado = True
            else:
                reproducir_sonido(SONIDOS.get("error"))

        if juego_terminado:
            respuesta = leer_entrada("Quieres jugar otra vez? (s/n, Ctrl+C para salir): ").lower().strip()
            if respuesta.startswith("s"):
                letras_erradas = []
                letras_acertadas = []
                registro_actual = random.choice(registros)
                palabra_secreta = registro_actual["palabra"]
                ayuda_palabra = registro_actual["significado"] if mostrar_ayuda else ""
                juego_terminado = False
            else:
                break


def main():
    # Crear CLI
    parser = argparse.ArgumentParser(
        description="Juego del ahorcado con palabras cargadas desde JSON."
    )
    parser.add_argument(
        "-d",
        "--dificultad",
        help="Filtra las palabras por nivel de dificultad.",
    )
    parser.add_argument(
        "-l",
        "--longitud",
        type=int,
        help="Filtra las palabras por longitud.",
    )
    parser.add_argument(
        "-a",
        "--ayuda",
        action="store_true",
        help="Muestra la definicion de la palabra debajo del tablero.",
    )
    parser.add_argument(
        "-c",
        "--conjunto",
        choices=CONJUNTOS,
        help="Selecciona un conjunto de datos especifico.",
    )
    args = parser.parse_args()

    try:
        registros = cargar_palabras_desde_json(DATA_DIR, conjunto=args.conjunto)       
        registros_filtrados = filtrar_palabras(
            registros,
            dificultad=args.dificultad,
            longitud=args.longitud,
        )
    except (FileNotFoundError, ValueError, json.JSONDecodeError) as error:
        parser.error(str(error))

    juego_ahorcado(registros_filtrados, mostrar_ayuda=args.ayuda)


if __name__ == "__main__":
    main()
import random
import unicodedata

def normalizar(texto: str) -> str:
    texto = texto.strip().upper()
    texto = ''.join(
        c for c in unicodedata.normalize("NFD", texto)
        if unicodedata.category(c) != "Mn"
    )
    return texto


def generar_parejas(nombres: list[str]) -> dict:
    # VALIDACIONES GLOBALES ---------------------------------------
    if len(nombres) not in (2, 4, 6, 8):
        return {"error": "La cantidad debe ser 2, 4, 6 u 8 personas."}

    # Normalizar + Validar
    procesados = []
    for n in nombres:
        n2 = normalizar(n)
        if len(n2) < 4:
            return {"error": f"El nombre '{n}' debe tener mínimo 4 caracteres."}
        if n2 in procesados:
            return {"error": f"El nombre '{n}' está repetido."}
        procesados.append(n2)

    nombres = procesados
    random.shuffle(nombres)
    cantidad = len(nombres)

    # CASO 1 → 2 PERSONAS ----------------------------------------
    if cantidad == 2:
        etiquetas = ["PAR", "IMPAR"]
        random.shuffle(etiquetas)
        return {
            "tipo": "individuos",
            "asignaciones": [
                {"persona": nombres[0], "etiqueta": etiquetas[0]},
                {"persona": nombres[1], "etiqueta": etiquetas[1]},
            ]
        }

    # CASO 2 → 4 / 8 PERSONAS ------------------------------------
    if cantidad in (4, 8):
        parejas = []
        for i in range(0, cantidad, 2):
            parejas.append([nombres[i], nombres[i+1]])

        etiquetas = ["PAR"] * (len(parejas) // 2) + ["IMPAR"] * (len(parejas) // 2)
        random.shuffle(etiquetas)

        return {
            "tipo": "parejas",
            "asignaciones": [
                {"pareja": pareja, "etiqueta": etiquetas[i]}
                for i, pareja in enumerate(parejas)
            ]
        }

    # CASO 3 → 6 PERSONAS ----------------------------------------
    if cantidad == 6:
        grupo1 = nombres[:3]
        grupo2 = nombres[3:]

        etiquetas = ["PAR", "IMPAR"]
        random.shuffle(etiquetas)

        return {
            "tipo": "grupos",
            "grupos": [
                {"grupo": grupo1, "etiqueta": etiquetas[0]},
                {"grupo": grupo2, "etiqueta": etiquetas[1]},
            ]
        }

    # Fallback (no debería ocurrir):
    return {"error": "Error inesperado."}

from fastapi import FastAPI
from pydantic import BaseModel
from logic import generar_parejas

app = FastAPI(title="Parejas Random API")

class Personas(BaseModel):
    nombres: list[str]

@app.post("/generar")
def generar(personas: Personas):
    return generar_parejas(personas.nombres)


# ----------- NECESARIO PARA RENDER Y PRUEBAS LOCALES ----------
if __name__ == "_main_":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=10000)
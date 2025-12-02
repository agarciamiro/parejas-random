from fastapi import FastAPI
from fastapi.responses import FileResponse
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from logic import generar_parejas

app = FastAPI(title="Parejas Random API")

# Servir carpeta /static
app.mount("/static", StaticFiles(directory="static"), name="static")

class Personas(BaseModel):
    nombres: list[str]

@app.post("/generar")
def generar(personas: Personas):
    return generar_parejas(personas.nombres)

# Ruta raíz "/" → mostrar frontend
@app.get("/")
def read_root():
    return FileResponse("static/index.html")

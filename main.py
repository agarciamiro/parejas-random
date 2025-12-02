from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from pydantic import BaseModel
from logic import generar_parejas

app = FastAPI()

# Servir la carpeta static/
app.mount("/static", StaticFiles(directory="static"), name="static")

# Ruta para servir index.html como página principal
@app.get("/")
def root():
    return FileResponse("static/index.html")


class Personas(BaseModel):
    nombres: list[str]

@app.post("/generar")
def generar(personas: Personas):
    return generar_parejas(personas.nombres)

from fastapi import FastAPI, Request
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from logic import generar_parejas
from pydantic import BaseModel

app = FastAPI()

# Servir carpeta static (CSS, JS, imágenes)
app.mount("/static", StaticFiles(directory="static"), name="static")

# Servir templates
templates = Jinja2Templates(directory="templates")

# Modelo de entrada
class Personas(BaseModel):
    nombres: list[str]

# Ruta principal → muestra index.html
@app.get("/")
async def home(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})

# Endpoint API
@app.post("/generar")
async def generar(personas: Personas):
    return generar_parejas(personas.nombres)

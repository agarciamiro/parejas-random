from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from pydantic import BaseModel
from logic import generar_parejas

app = FastAPI()

# Servir carpeta /static
app.mount("/static", StaticFiles(directory="static"), name="static")

# Servir templates
templates = Jinja2Templates(directory="templates")


# -------- MODELO DEL ENDPOINT --------
class Personas(BaseModel):
    nombres: list[str]


@app.post("/generar")
def generar(personas: Personas):
    return generar_parejas(personas.nombres)


# -------- RUTA PRINCIPAL "/" --------
@app.get("/", response_class=HTMLResponse)
def home(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})

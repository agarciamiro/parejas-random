from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from pydantic import BaseModel
from logic import generar_parejas

app = FastAPI()

# Servir /static (JS y CSS)
app.mount("/static", StaticFiles(directory="static"), name="static")

# Servir templates
templates = Jinja2Templates(directory="templates")


# ======== MODELO DE ENTRADA PARA LA API ========
class Personas(BaseModel):
    nombres: list[str]


# ======== RUTA PRINCIPAL (frontend) ========
@app.get("/", response_class=HTMLResponse)
def home(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})


# ======== API PARA GENERAR PAREJAS ========
@app.post("/generar")
def generar(personas: Personas):
    return generar_parejas(personas.nombres)

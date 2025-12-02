from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from logic import generar_parejas

app = FastAPI()

# Configurar templates y carpeta static
templates = Jinja2Templates(directory="templates")
app.mount("/static", StaticFiles(directory="static"), name="static")

# Página principal
@app.get("/", response_class=HTMLResponse)
def home(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})

# API
@app.post("/generar")
def generar(data: dict):
    nombres = data.get("nombres", [])
    return generar_parejas(nombres)








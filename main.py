from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from logic import generar_parejas

app = FastAPI()

# Rutas de templates y archivos estáticos
templates = Jinja2Templates(directory="templates")
app.mount("/static", StaticFiles(directory="static"), name="static")


# ------------------------------
# Página principal (HTML)
# ------------------------------
@app.get("/", response_class=HTMLResponse)
def home(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})


# ------------------------------
# API para generar parejas
# ------------------------------
@app.post("/generar")
def generar(data: dict):
    nombres = data.get("nombres", [])
    return generar_parejas(nombres)









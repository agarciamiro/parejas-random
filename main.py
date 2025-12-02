from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles

from logic import generar_parejas

app = FastAPI()

# Carpetas de templates y estáticos
templates = Jinja2Templates(directory="templates")
app.mount("/static", StaticFiles(directory="static"), name="static")


# Página principal: devuelve templates/index.html
@app.get("/", response_class=HTMLResponse)
async def home(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})


# Endpoint API para generar parejas
@app.post("/generar")
async def generar(data: dict):
    nombres = data.get("nombres", [])
    return generar_parejas(nombres)




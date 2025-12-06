🎱 Parejas Random

<p align="center">
  <img src="AppIcons/appstore.png" width="180">
</p>

<h1 align="center">📱 PAREJAS RANDOM</h1>
<h3 align="center">App + API para generar parejas y grupos aleatorios</h3>

---

## 🧠 ¿Qué es Parejas Random?

Una app inteligente para formar *parejas* o *grupos* aleatorios para:

•⁠  ⁠2 personas → cada uno recibe *PAR* o *IMPAR*
•⁠  ⁠4 personas → 2 parejas, mitad PAR y mitad IMPAR
•⁠  ⁠6 personas → 2 grupos de 3, uno PAR y uno IMPAR
•⁠  ⁠8 personas → 4 parejas, mitad PAR y mitad IMPAR

Funciona en:

•⁠  ⁠🌐 *Web*
•⁠  ⁠⚡ *API en Render (FastAPI)*
•⁠  ⁠📱 *App iPhone (SwiftUI)*

---

## 🚀 Tecnologías

### Backend (API)
•⁠  ⁠Python 3
•⁠  ⁠FastAPI
•⁠  ⁠Uvicorn
•⁠  ⁠Pydantic

### Frontend
•⁠  ⁠HTML + CSS + JS
•⁠  ⁠Service Worker (soporte PWA)

### iOS App
•⁠  ⁠SwiftUI
•⁠  ⁠WKWebView (versión web embebida)
•⁠  ⁠Iconos personalizados

### Hosting
•⁠  ⁠Render.com  
•⁠  ⁠GitHub (repositorio)

---

## 📦 Instalación local

```bash
pip install -r requirements.txt
uvicorn main:app --reload

API disponible en:

http://127.0.0.1:8000

🔧 API — Endpoints

POST /generar

Request:

{
  "nombres": ["Juan", "Pedro", "Jose", "Rafael"]
}

Response:

{
  "tipo": "parejas",
  "asignaciones": [
    {"pareja": ["JUAN", "PEDRO"], "etiqueta": "PAR"},
    {"pareja": ["JOSE", "RAFAEL"], "etiqueta": "IMPAR"}
  ]
}

🌐 Web App

Archivos principales:

static/
templates/index.html
main.py
logic.py

Para ejecutarla:

python main.py

📱 iPhone App

Ubicada en:

/ParejasRandomApp/

Archivos relevantes:
	•	ContentView.swift
	•	ApiService.swift
	•	Models.swift
	•	ResultView.swift
	•	NameInputView.swift

La app carga la web oficial mediante:

WebView(url: URL(string: "https://tu-render-url")!)

📄 Estructura del Proyecto

parejas-random/
│ main.py
│ logic.py
│ requirements.txt
│ render.yaml
│ README.md
│
├─ static/
│   ├─ style.css
│   ├─ app.js
│   ├─ manifest.json
│   ├─ sw.js
│   └─ index.html
│
├─ templates/
│   └─ index.html
│
├─ AppIcons/
│   ├─ appstore.png
│   └─ Assets.xcassets/
│       └─ AppIcon.appiconset/
│
└─ ParejasRandomApp/
    ├─ ContentView.swift
    ├─ ApiService.swift
    ├─ Models.swift
    ├─ ResultView.swift
    └─ NameInputView.swift

👤 Autor

Alfonso Garcia Miro Peschiera

Proyecto personal — Todos los derechos reservados.

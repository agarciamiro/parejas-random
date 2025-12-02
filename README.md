# parejas-random
Generador de Parejas Aleatorias (Web + API + iOS)

📱 Parejas Random — API & Web App

Generador inteligente de parejas y grupos aleatorios para 2, 4, 6 y 8 personas, con reglas especiales de asignación PAR / IMPAR.

Incluye:
	•	🟦 Frontend web (HTML + CSS + JS)
	•	🟧 Backend FastAPI
	•	🍏 App iOS (SwiftUI) que consume la API
	•	☁️ Preparado para deploy en Render

⸻

🚀 Tecnologías usadas

Backend
	•	Python 3
	•	FastAPI
	•	Uvicorn
	•	Pydantic

Frontend
	•	HTML5
	•	CSS3
	•	JavaScript

iPhone App
	•	SwiftUI
	•	WKWebView / API Service

Hosting
	•	Render.com

⸻

🔧 API — Endpoints

POST /generar

Request
{
  "nombres": ["Juan", "Pedro", "Jose", "Rafael"]
}

Response

{
  "tipo": "parejas",
  "asignaciones": [
    { "pareja": ["JUAN", "PEDRO"], "etiqueta": "PAR" },
    { "pareja": ["JOSE", "RAFAEL"], "etiqueta": "IMPAR" }
  ]
}

📦 Instalación local

pip install -r requirements.txt
uvicorn main:app --reload

Abrir en navegador:

http://127.0.0.1:8000/

🌐 Despliegue en Render

Tu proyecto ya incluye:

render.yaml
requirements.txt
main.py

Solo crea un Web Service → Python / FastAPI
y Render hará el resto.

⸻

📱 App iOS

El proyecto iOS está en:

ParejasRandomApp/

La app carga:
	•	el sitio web (versión web) o
	•	los datos desde la API FastAPI

⸻

📄 Licencia

Proyecto personal de Alfonso Garcia Miro Peschiera.

📱 Parejas Random

Generador inteligente de parejas y grupos aleatorios para 2, 4, 6 y 8 personas, con asignaciones PAR / IMPAR según reglas especiales de tu proyecto.

Este repositorio contiene:
	•	🌐 Backend FastAPI
	•	💻 Frontend web (HTML + CSS + JS)
	•	📱 Código base para App iOS (SwiftUI)
	•	☁️ Deploy listo para Render.com

⸻

🚀 Características principales

✔ Generación de parejas con reglas especiales
✔ Animación tipo “ruleta” antes del resultado
✔ Exportación de resultados a TXT
✔ Historial persistente
✔ API lista para consumo desde Swift
✔ Página web incluida en /templates y /static

⸻

🧠 Lógica de emparejamiento
	•	2 personas → cada una recibe PAR o IMPAR
	•	4 personas → 2 parejas, mitad PAR, mitad IMPAR
	•	6 personas → 2 grupos de 3, uno PAR / uno IMPAR
	•	8 personas → 4 parejas, mitad PAR, mitad IMPAR

Toda la lógica está implementada en:
logic.py

parejas-random/
├─ main.py              # FastAPI backend
├─ logic.py             # Reglas de emparejamiento
├─ requirements.txt     # Dependencias
├─ render.yaml          # Config para Render deploy
├─ templates/
│   └─ index.html       # Web frontend
├─ static/
│   ├─ style.css
│   ├─ main.js
│   ├─ app.js
│   ├─ sw.js
│   └─ manifest.json
├─ ParejasRandomApp/    # SwiftUI app (opcional)
└─ history.json         # Historial

📦 Instalación local

Requisitos:
	•	Python 3.10+
	•	pip instalado

1.⁠ ⁠Instalar dependencias

pip install -r requirements.txt

2.⁠ ⁠Ejecutar servidor local

uvicorn main:app --reload

Backend disponible en:

http://127.0.0.1:8000

Frontend web:

http://127.0.0.1:8000

🌐 Deploy en Render

El repositorio ya incluye:
	•	render.yaml → indica a Render cómo correr FastAPI
	•	requirements.txt → todas las dependencias
	•	main.py → punto de entrada de la app

Pasos rápidos:
	1.	Subir este repo a GitHub
	2.	Crear servicio “Web Service” en Render
	3.	Conectar el repo
	4.	Elegir Build Command (Render lo lee del yaml)
	5.	Deploy automático

⸻

📱 Uso en App iOS (Swift)

Usa el archivo:

ParejasRandomApp/ApiService.swift

Ejemplo de consumo de API:

let url = URL(string: "https://TU-RENDER-URL.com/generar")!

La app simplemente envía:

{
  "nombres": ["Juan", "Pedro", "José", "Rafael"]
}

🤝 Autor

Creado por Alfonso Garcia Miro Peschiera
Proyecto personal — todos los derechos reservados.

📄 Licencia

Uso personal y educativo. No redistribuir sin permiso.

🎱 Parejas Random

Generador inteligente de parejas y grupos aleatorios para 2, 4, 6 u 8 personas.
Incluye backend FastAPI, interfaz web, app iOS, animaciones y sistema de historial.

⸻

🚀 Características principales

✔ Genera parejas o grupos según el número de personas:
	•	2 personas → PAR / IMPAR por persona
	•	4 personas → 2 parejas → mitad PAR, mitad IMPAR
	•	6 personas → 2 grupos de 3 → uno PAR y otro IMPAR
	•	8 personas → 4 parejas → mitad PAR, mitad IMPAR

✔ Animación estilo “ruleta” antes de mostrar el resultado
✔ Historial de resultados
✔ Exportación a TXT
✔ API lista para iOS / Web / Render.com
✔ UI Web integrada
✔ Normalización automática de nombres (mayúsculas, sin acentos)

⸻

🧩 Tecnologías usadas

Backend
	•	Python 3
	•	FastAPI
	•	Uvicorn
	•	Pydantic

Web App
	•	HTML5
	•	CSS3
	•	JavaScript (fetch API)

Mobile App
	•	SwiftUI
	•	WKWebView con backend remoto

Hosting
	•	Render.com

⸻

📦 Instalación local

Clona el repositorio:

git clone https://github.com/agarciamiro/parejas-random
cd parejas-random

Instala dependencias:

pip install -r requirements.txt

Ejecuta localmente:

uvicorn main:app --reload

Abre en tu navegador:

http://127.0.0.1:8000

🌐 Despliegue en Render.com
	1.	Crea un servicio Web Service
	2.	Selecciona tu repo parejas-random
	3.	Coloca:

Environment: Python
Build:

pip install -r requirements.txt

Start command:

uvicorn main:app --host=0.0.0.0 --port=10000

(Render usa el puerto $PORT, FastAPI lo ajusta automáticamente)
	4.	¡Listo! Render generará una URL:

https://parejas-random.onrender.com

Esa será la URL a insertar en tu app iOS.

⸻

📱 Integración con iOS (SwiftUI)

Tu archivo ContentView.swift debe contener:

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        WebView(url: URL(string: "https://TU-URL-RENDER")!)
            .ignoresSafeArea()
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webview = WKWebView()
        webview.load(URLRequest(url: url))
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

📄 Estructura del proyecto

parejas-random/
├─ main.py
├─ logic.py
├─ requirements.txt
├─ static/
│  ├─ style.css
│  ├─ main.js
│  ├─ manifest.json
│  ├─ sw.js
│  └─ index.html
├─ templates/
│  └─ index.html
├─ AppIcons/
│  └─ (todos los tamaños del icono)
├─ history.json
└─ README.md

📚 Licencia

Proyecto personal de Alfonso García Miro Peschiera.
Uso libre y no comercial permitido.

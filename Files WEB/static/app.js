let nombres = [];

// Agregar nombre
function agregarNombre() {
    const input = document.getElementById("nombre");
    let valor = input.value.trim();

    if (valor.length < 4) {
        alert("Nombre mínimo 4 letras");
        return;
    }
    if (nombres.includes(valor.toUpperCase())) {
        alert("Nombre ya ingresado");
        return;
    }

    nombres.push(valor.toUpperCase());
    input.value = "";
    actualizarLista();
}

// Actualizar lista numerada
function actualizarLista() {
    document.getElementById("lista").innerHTML =
        nombres.map((n, i) => `<li>${i + 1}. ${n}</li>`).join("");
}

// Llamada al backend FastAPI
async function generarParejas() {
    if (![2, 4, 6, 8].includes(nombres.length)) {
        alert("Debes ingresar 2,4,6 u 8 nombres");
        return;
    }

    const response = await fetch("https://parejas-random.onrender.com/generar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nombres })
    });

    if (!response.ok) {
        alert("Error en la API");
        return;
    }

    const data = await response.json();
    mostrarResultado(data);
}

// Mostrar resultados y enviar parejas a iOS
function mostrarResultado(data) {
    let html = "";
    const parejasParaApp = [];

    if (data.asignaciones) {
        data.asignaciones.forEach(x => {
            if (x.persona) {
                html += `<p>${x.persona} ➤ ${x.etiqueta}</p>`;
                parejasParaApp.push(x.persona);
            } else if (x.pareja) {
                const nombrePareja = `${x.pareja[0]} & ${x.pareja[1]}`;
                html += `<p>${nombrePareja} ➤ ${x.etiqueta}</p>`;
                parejasParaApp.push(nombrePareja);
            }
        });
    }

    if (data.grupos) {
        data.grupos.forEach(g => {
            const nombreGrupo = g.grupo.join(" & ");
            html += `<p>${nombreGrupo} ➤ ${g.etiqueta}</p>`;
            parejasParaApp.push(nombreGrupo);
        });
    }

    document.getElementById("resultado").innerHTML = html;

    // Avisar a la app iOS (si está dentro de un WKWebView)
    if (window.webkit &&
        window.webkit.messageHandlers &&
        window.webkit.messageHandlers.parejas) {

        try {
            window.webkit.messageHandlers.parejas.postMessage(parejasParaApp);
        } catch (e) {
            console.log("No se pudo enviar a iOS:", e);
        }
    }
}

// Reset
function resetApp() {
    nombres = [];
    document.getElementById("lista").innerHTML = "";
    document.getElementById("resultado").innerHTML = "";
    document.getElementById("nombre").value = "";
}

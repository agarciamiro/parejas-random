// static/app.js

let nombres = [];

// ───────── 1) Agregar nombre ─────────
function agregarNombre() {
    const input = document.getElementById("nombre");
    const valor = input.value.trim().toUpperCase();

    if (valor.length < 4) {
        alert("El nombre debe tener mínimo 4 letras");
        return;
    }

    if (nombres.includes(valor)) {
        alert("Ese nombre ya fue ingresado");
        return;
    }

    nombres.push(valor);
    input.value = "";
    actualizarLista();
}

// ───────── 2) Actualizar lista en pantalla ─────────
function actualizarLista() {
    const ul = document.getElementById("lista");
    ul.innerHTML = nombres.map(n => ⁠ <li>${n}</li> ⁠).join("");
}

// ───────── 3) Llamar a la API en Render ─────────
async function generarParejas() {
    if (![2, 4, 6, 8].includes(nombres.length)) {
        alert("Debes ingresar 2, 4, 6 u 8 nombres");
        return;
    }

    try {
        const response = await fetch("/generar", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ nombres: nombres })
        });

        if (!response.ok) {
            let errText = "";
            try {
                const err = await response.json();
                errText = err.error || JSON.stringify(err);
            } catch (_) {
                errText = response.statusText;
            }
            alert("Error en el servidor: " + errText);
            return;
        }

        const data = await response.json();
        mostrarResultado(data);
    } catch (e) {
        console.error(e);
        alert("No se pudo conectar con el servidor.");
    }
}

// ───────── 4) Mostrar el resultado devuelto por la API ─────────
function mostrarResultado(data) {
    const div = document.getElementById("resultado");
    let html = "";

    // Caso 2 personas o 4 / 8 personas (asignaciones)
    if (data.asignaciones) {
        data.asignaciones.forEach(x => {
            if (x.persona) {
                // formato: { persona, etiqueta }
                html += ⁠ <p>${x.persona} ➤ ${x.etiqueta}</p> ⁠;
            } else if (x.pareja) {
                // formato: { pareja: [A,B], etiqueta }
                html += ⁠ <p>${x.pareja[0]} & ${x.pareja[1]} ➤ ${x.etiqueta}</p> ⁠;
            }
        });
    }

    // Caso 6 personas (grupos de 3)
    if (data.grupos) {
        data.grupos.forEach(g => {
            html += ⁠ <p>${g.grupo.join(", ")} ➤ ${g.etiqueta}</p> ⁠;
        });
    }

    div.innerHTML = html || "<p>No se recibió ningún resultado.</p>";
}

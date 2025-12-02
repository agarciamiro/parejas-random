let nombres = [];

function agregarNombre() {
    const input = document.getElementById("nombre");
    let nombre = input.value.trim();

    if (nombre === "" || nombre.length < 4) {
        alert("El nombre debe tener mínimo 4 letras");
        return;
    }

    nombre = nombre.toUpperCase();

    if (nombres.includes(nombre)) {
        alert("Ese nombre ya fue ingresado");
        return;
    }

    nombres.push(nombre);
    input.value = "";
    actualizarLista();
}

function actualizarLista() {
    document.getElementById("lista").innerHTML =
        nombres.map(n => `<li>${n}</li>`).join("");
}

async function generarParejas() {
    if (![2, 4, 6, 8].includes(nombres.length)) {
        alert("Debes ingresar exactamente 2, 4, 6 u 8 nombres");
        return;
    }

    const response = await fetch("https://parejas-random.onrender.com/generar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nombres })
    });

    const data = await response.json();
    mostrarResultado(data);
}

function mostrarResultado(data) {
    let html = "";

    if (data.asignaciones) {
        data.asignaciones.forEach(x => {
            if (x.persona) {
                html += `<p>${x.persona} ➤ ${x.etiqueta}</p>`;
            } else {
                html += `<p>${x.pareja[0]} & ${x.pareja[1]} ➤ ${x.etiqueta}</p>`;
            }
        });
    }

    if (data.grupos) {
        data.grupos.forEach(g => {
            html += `<p>${g.grupo.join(", ")} ➤ ${g.etiqueta}</p>`;
        });
    }

    if (data.error) {
        html = `<p style="color:red;">${data.error}</p>`;
    }

    document.getElementById("resultado").innerHTML = html;
}


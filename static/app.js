let nombres = [];

function agregarNombre() {
    const input = document.getElementById("nombre");
    const texto = input.value.trim();

    if (texto === "" || texto.length < 4) {
        alert("Nombre mínimo 4 letras");
        return;
    }

    const nombreNorm = texto.toUpperCase();

    if (nombres.includes(nombreNorm)) {
        alert("Nombre ya ingresado");
        return;
    }

    nombres.push(nombreNorm);
    input.value = "";
    actualizarLista();
}

function actualizarLista() {
    document.getElementById("lista").innerHTML =
        nombres.map(n => `<li>${n}</li>`).join("");
}

async function generarParejas() {
    if (![2,4,6,8].includes(nombres.length)) {
        alert("Debes ingresar 2, 4, 6 u 8 nombres");
        return;
    }

    const response = await fetch("https://parejas-random.onrender.com/generar", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
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

    document.getElementById("resultado").innerHTML = html;
}


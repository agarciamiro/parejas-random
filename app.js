let nombres = [];

function agregarNombre() {
    const input = document.getElementById("nombre");
    if (input.value.trim() === "" || input.value.length < 4) {
        alert("Nombre mínimo 4 letras");
        return;
    }
    if (nombres.includes(input.value.toUpperCase())) {
        alert("Nombre ya ingresado");
        return;
    }
    nombres.push(input.value.toUpperCase());
    input.value = "";
    actualizarLista();
}

function actualizarLista() {
    document.getElementById("lista").innerHTML =
        nombres.map(n => ⁠ <li>${n}</li> ⁠).join("");
}

async function generarParejas() {
    if ([2,4,6,8].includes(nombres.length) === false) {
        alert("Debes ingresar 2,4,6 o 8 nombres");
        return;
    }

    const response = await fetch("/generar", {
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
            if (x.persona) html += ⁠ <p>${x.persona} ➤ ${x.etiqueta}</p> ⁠;
            else html += ⁠ <p>${x.pareja[0]} & ${x.pareja[1]} ➤ ${x.etiqueta}</p> ⁠;
        });
    }

    if (data.grupos) {
        data.grupos.forEach(g => {
            html += ⁠ <p>${g.grupo.join(", ")} ➤ ${g.etiqueta}</p> ⁠;
        });
    }

    document.getElementById("resultado").innerHTML = html;
}
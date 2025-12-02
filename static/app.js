let nombres = [];

// Agregar nombre a la lista
function agregarNombre() {
    const input = document.getElementById("nombre");
    let valor = input.value.trim();

    if (valor.length < 4) {
        alert("Nombre mínimo 4 letras");
        return;
    }

    const upper = valor.toUpperCase();

    if (nombres.includes(upper)) {
        alert("Nombre ya ingresado");
        return;
    }

    nombres.push(upper);
    input.value = "";
    actualizarLista();
}

// Refresca la lista visual de nombres
function actualizarLista() {
    const lista = document.getElementById("lista");
    lista.innerHTML = nombres.map((n) => `<li>${n}</li>`).join("");
}

// Llama al backend FastAPI para generar las parejas/grupos
async function generarParejas() {
    if (![2, 4, 6, 8].includes(nombres.length)) {
        alert("Debes ingresar 2, 4, 6 u 8 nombres");
        return;
    }

    try {
        const response = await fetch("/generar", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ nombres: nombres }),
        });

        if (!response.ok) {
            const txt = await response.text();
            console.error("Error API:", txt);
            alert("Error en el servidor");
            return;
        }

        const data = await response.json();
        mostrarResultado(data);
    } catch (err) {
        console.error(err);
        alert("No se pudo conectar con el servidor");
    }
}

// Muestra el resultado en pantalla
function mostrarResultado(data) {
    const cont = document.getElementById("resultado");

    if (data.error) {
        cont.innerHTML = `<p style="color:red">${data.error}</p>`;
        return;
    }

    let html = "";

    if (data.asignaciones) {
        data.asignaciones.forEach((x) => {
            if (x.persona) {
                html

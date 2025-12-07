import SwiftUI

// Formatea nombres: "  jUaN  " → "Juan"
func normalizarNombre(_ texto: String) -> String {
    let trimmed = texto.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else { return "" }

    let lower = trimmed.lowercased()
    let first = lower.prefix(1).uppercased()
    let rest = lower.dropFirst()
    return first + rest
}

struct IngresarNombresView: View {

    let teamCount: Int
    var maxJugadores: Int { teamCount * 2 }

    @State private var nombres: [String]

    // Creamos exactamente maxJugadores casillas vacías
    init(teamCount: Int) {
        self.teamCount = teamCount
        let max = max(2, teamCount * 2)
        _nombres = State(initialValue: Array(repeating: "", count: max))
    }

    // Solo nombres válidos, normalizados y no vacíos
    var jugadoresValidos: [String] {
        nombres
            .map { normalizarNombre($0) }
            .filter { !$0.isEmpty }
    }

    var body: some View {
        VStack(spacing: 16) {

            Text("Ingresar jugadores")
                .font(.title.bold())

            List {
                ForEach(nombres.indices, id: \.self) { index in
                    TextField(
                        "Nombre \(index + 1)",
                        text: Binding(
                            get: { nombres[index] },
                            set: { nuevoValor in
                                nombres[index] = normalizarNombre(nuevoValor)
                            }
                        )
                    )
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                }
            }

            // Botón de prueba opcional (solo consola)
            Button("Probar en consola") {
                print("Nombres normalizados: \(jugadoresValidos)")
            }
            .buttonStyle(.bordered)

            // Navegación hacia la Pantalla 2: Asignación
            NavigationLink(
                destination: AsignacionView(jugadores: jugadoresValidos)
            ) {
                Text("Iniciar juego")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            // Solo permitimos continuar si se llenaron todos los nombres
            .buttonStyle(.borderedProminent)
            .disabled(jugadoresValidos.count != maxJugadores)

            Spacer()
        }
        .padding()
    }
}

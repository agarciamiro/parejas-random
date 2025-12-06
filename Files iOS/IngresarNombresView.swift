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

    @State private var nombres: [String] = [""]

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
                .onDelete { indices in
                    nombres.remove(atOffsets: indices)
                    if nombres.isEmpty {
                        nombres.append("")
                    }
                }
            }

            HStack {
                Button("Agregar jugador") {
                    nombres.append("")
                }
                .buttonStyle(.borderedProminent)

                Button("Probar en consola") {
                    let filtrados = nombres
                        .map { normalizarNombre($0) }
                        .filter { !$0.isEmpty }

                    print("Nombres normalizados: \(filtrados)")
                }
                .buttonStyle(.bordered)
            }

            Spacer()
        }
        .padding()
    }
}

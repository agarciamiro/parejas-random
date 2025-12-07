import SwiftUI

func normalizarNombre(_ texto: String) -> String {
    let trimmed = texto.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else { return "" }
    let lower = trimmed.lowercased()
    return lower.prefix(1).uppercased() + lower.dropFirst()
}

struct IngresarNombresView: View {

    let maxJugadores: Int
    @State private var nombres: [String]
    @State private var goToScores = false

    init(maxJugadores: Int) {
        self.maxJugadores = maxJugadores
        _nombres = State(initialValue: Array(repeating: "", count: maxJugadores))
    }

    var equiposFinales: [Team] {
        if maxJugadores == 6 {
            return [
                Team(name: "Equipo 1", players: Array(nombres[0...2]), points: 0),
                Team(name: "Equipo 2", players: Array(nombres[3...5]), points: 0)
            ]
        } else {
            var teams: [Team] = []
            for i in stride(from: 0, to: maxJugadores, by: 2) {
                let jugadores = [nombres[i], nombres[i+1]]
                teams.append(Team(name: "Equipo \(teams.count + 1)", players: jugadores, points: 0))
            }
            return teams
        }
    }

    var body: some View {
        VStack(spacing: 16) {

            Text("Ingresar jugadores")
                .font(.title.bold())

            List {
                ForEach(0..<maxJugadores, id: \.self) { i in
                    TextField("Jugador \(i + 1)", text: $nombres[i])
                        .textInputAutocapitalization(.never)
                        .onChange(of: nombres[i]) {
                            nombres[i] = normalizarNombre(nombres[i])
                        }
                }
            }

            NavigationLink(
                destination: ScoresView(teams: equiposFinales),
                isActive: $goToScores
            ) {
                EmptyView()
            }

            Button("Iniciar Juego") {
                goToScores = true
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }
}

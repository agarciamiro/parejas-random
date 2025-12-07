import SwiftUI

struct AsignacionView: View {

    let jugadores: [String]   // nombres ya normalizados

    @State private var teams: [Team] = []
    @State private var parTeamId: UUID? = nil
    @State private var turnOrder: [String] = []

    var body: some View {
        VStack(spacing: 16) {

            Text("ASIGNACIÓN DE JUEGO")
                .font(.title.bold())

            if teams.isEmpty {
                Text("Configurando partida...")
                    .onAppear(perform: configurarJuego)
            } else {

                // ───────── EQUIPOS CON PAR / IMPAR ─────────
                ForEach(teams) { team in
                    VStack(alignment: .leading, spacing: 4) {
                        let esPar = (team.id == parTeamId)
                        Text("\(team.name) (\(esPar ? "PAR" : "IMPAR"))")
                            .font(.headline)

                        ForEach(team.players, id: \.self) { jugador in
                            Text("• \(jugador)")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 4)
                }

                Divider()

                // ───────── ORDEN DE TURNOS (2 columnas) ─────────
                Text("ORDEN DE TURNOS")
                    .font(.headline)

                let columnas = columnasTurnos(from: turnOrder)

                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(columnas.left, id: \.self) { nombre in
                            Text(nombre)
                        }
                    }

                    Spacer()

                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(columnas.right, id: \.self) { nombre in
                            Text(nombre)
                        }
                    }
                }

                Spacer()

                // ───────── BOTÓN PARA IR A PUNTAJES ─────────
                NavigationLink(
                    destination: ScoresView(teams: teams)
                ) {
                    Text("INICIAR PARTIDA")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
    }

    // MARK: - Lógica de configuración

    private func configurarJuego() {
        // Limpiamos nombres vacíos
        let clean = jugadores.filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
        guard !clean.isEmpty else { return }

        // Número de equipos (1 a 4) según cantidad de jugadores
        let teamCount = max(1, min(4, clean.count / 2))

        // Mezclamos jugadores y armamos equipos de 2
        var mezclados = clean.shuffled()
        var nuevosTeams: [Team] = []

        for i in 0..<teamCount {
            let start = i * 2
            let end = min(start + 2, mezclados.count)
            let integrantes = Array(mezclados[start..<end])
            let team = Team(
                name: "Equipo \(i + 1)",
                players: integrantes,
                points: 0
            )
            nuevosTeams.append(team)
        }

        teams = nuevosTeams

        // Elegimos aleatoriamente quién es PAR
        if let elegido = teams.randomElement() {
            parTeamId = elegido.id
        }

        // Orden de turnos aleatorio
        let todos = teams.flatMap { $0.players }
        turnOrder = todos.shuffled()
    }

    // Divide una lista en 2 columnas para mostrar
    private func columnasTurnos(from jugadores: [String]) -> (left: [String], right: [String]) {
        let mid = (jugadores.count + 1) / 2
        let left = Array(jugadores.prefix(mid))
        let right = Array(jugadores.dropFirst(mid))
        return (left, right)
    }
}

import SwiftUI

struct PartidaView: View {

    @State private var teamCount = 1
    @State private var goToScores = false

    // Calcula los equipos según la cantidad seleccionada
    // (si algún día volvemos a la regla especial de 3 equipos, lo ajustamos aquí)
    var teams: [Team] {
        (1...teamCount).map { number in
            Team(name: "Equipo \(number)", points: 0)
        }
    }

    var body: some View {
        VStack(spacing: 24) {

            Text("Configurar Partida")
                .font(.largeTitle.bold())

            // Selector 1–4 equipos (cada equipo = 2 personas)
            Picker("Número de Equipos", selection: $teamCount) {
                ForEach(1...4, id: \.self) { value in
                    Text("\(value) equipos (\(value * 2) personas)")
                        .tag(value)
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 140)

            // Navegación oculta hacia ScoresView
            NavigationLink(
                destination: ScoresView(teams: teams),
                isActive: $goToScores
            ) {
                EmptyView()
            }

            // Botón para ir a puntajes
            Button("Ir a Puntajes") {
                goToScores = true
            }
            .buttonStyle(.borderedProminent)

            // Botón para ir a la pantalla de ingreso de nombres
            NavigationLink("Ingresar Nombres") {
                IngresarNombresView()
            }
            .buttonStyle(.bordered)

            Spacer()
        }
        .padding()
        .navigationTitle("Partida")
    }
}

import SwiftUI

struct PartidaView: View {

    @State private var teamCount = 1
    @State private var goToScores = false

    // Generamos los equipos en función de teamCount
    var teams: [Team] {
        if teamCount == 3 {
            // Caso especial: 3 equipos de 2 personas → 2 equipos de 3 personas
            return [
                Team(name: "Equipo 1", points: 0),
                Team(name: "Equipo 2", points: 0)
            ]
        } else {
            // 1, 2 o 4 equipos normales
            return (1...teamCount).map { number in
                Team(name: "Equipo \(number)", points: 0)
            }
        }
    }

    var body: some View {
        VStack(spacing: 30) {

            Text("Configurar Partida")
                .font(.largeTitle.bold())

            // Selector de 1 a 4 equipos
            Picker("Número de Equipos", selection: $teamCount) {
                ForEach(1...4, id: \.self) { value in
                    Text("\(value) equipos (\(value * 2) personas)")
                        .tag(value)
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 120)

            // Navegación oculta hacia ScoresView
            NavigationLink(
                destination: ScoresView(teams: teams),
                isActive: $goToScores
            ) {
                EmptyView()
            }

            Button("Ir a Puntajes") {
                goToScores = true
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationTitle("Partida")
    }
}

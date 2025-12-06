import SwiftUI

struct PartidaView: View {

    @State private var teamCount = 1
    @State private var goToScores = false

    // ✅ LÓGICA CORRECTA:
    // 1 equipo → 2 personas
    // 2 equipos → 4 personas
    // 3 equipos → 6 personas → PERO SOLO 2 EQUIPOS
    // 4 equipos → 8 personas

    var teams: [Team] {
        if teamCount == 3 {
            // CASO ESPECIAL 6 personas → SOLO 2 EQUIPOS
            return [
                Team(name: "Equipo A", points: 0),
                Team(name: "Equipo B", points: 0)
            ]
        } else {
            return (1...teamCount).map { number in
                Team(name: "Equipo \(number)", points: 0)
            }
        }
    }

    var body: some View {
        VStack(spacing: 30) {

            Text("Configurar Partida")
                .font(.largeTitle.bold())

            Picker("Número de Equipos", selection: $teamCount) {
                ForEach(1...4, id: \.self) { value in
                    Text("\(value) Equipos (\(value * 2) personas)")
                        .tag(value)
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 120)

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

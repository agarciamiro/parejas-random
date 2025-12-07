import SwiftUI

struct PartidaView: View {

    @State private var teamCount = 1
    @State private var goToNames = false

    var jugadoresTotales: Int {
        if teamCount == 3 {
            return 6   // 2 equipos de 3
        } else {
            return teamCount * 2
        }
    }

    var body: some View {
        VStack(spacing: 24) {

            Text("Configurar Partida")
                .font(.largeTitle.bold())

            Picker("Número de Equipos", selection: $teamCount) {
                ForEach(1...4, id: \.self) { value in
                    if value == 3 {
                        Text("3 → 2 equipos (6 personas)")
                    } else {
                        Text("\(value) equipos (\(value * 2) personas)")
                    }
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 140)

            NavigationLink(
                destination: IngresarNombresView(maxJugadores: jugadoresTotales),
                isActive: $goToNames
            ) {
                EmptyView()
            }

            Button("Ingresar Nombres") {
                goToNames = true
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationTitle("Partida")
    }
}

import SwiftUI

struct PartidaView: View {

    @State private var teamCount = 1   // 1 a 4 equipos

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

            // Botón para ir a la pantalla de ingreso de nombres
            NavigationLink("Ingresar nombres") {
                IngresarNombresView(teamCount: teamCount)
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationTitle("Partida")
    }
}

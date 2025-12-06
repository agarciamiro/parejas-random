import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {

                NavigationLink("🎲 Generar Partida") {
                    PartidaView()
                }

                NavigationLink("🏆 Puntajes / Scores") {
                    Text("Primero crea una partida")
                        .font(.title3)
                }
            }
            .navigationTitle("Parejas Random")
        }
    }
}

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Generar Parejas") {
                    WebAppView()
                }

                NavigationLink("Puntajes / Scores") {
                    ScoresView()
                }
            }
            .navigationTitle("Parejas Random")
        }
    }
}

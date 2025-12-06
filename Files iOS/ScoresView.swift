import SwiftUI

struct ScoresView: View {

    // Los equipos llegan desde PartidaView
    @State var teams: [Team]

    var body: some View {
        VStack(spacing: 20) {

            Text("🏆 Puntajes")
                .font(.largeTitle.bold())

            ForEach($teams) { $team in
                HStack {
                    // Nombre del equipo
                    Text(team.name)
                        .frame(width: 120, alignment: .leading)

                    Spacer()

                    // Restar (sin bajar de 0)
                    Button("−") {
                        if team.points > 0 {
                            team.points -= 1
                        }
                    }

                    // Puntaje
                    Text("\(team.points)")
                        .frame(width: 40)

                    // Sumar
                    Button("+") {
                        team.points += 1
                    }
                }
                .font(.title2)
            }

            Spacer()
        }
        .padding()
    }
}

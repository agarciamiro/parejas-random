import SwiftUI

struct ScoresView: View {

    @EnvironmentObject var gameData: GameData

    var body: some View {
        VStack {

            Text("🏆 Puntajes")
                .font(.largeTitle.bold())
                .padding(.top)

            if gameData.teams.isEmpty {
                Text("No hay parejas creadas")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List {
                    ForEach(gameData.teams) { team in
                        HStack {

                            Text(team.name)
                                .fontWeight(.medium)

                            Spacer()

                            Button("−") {
                                gameData.removePoint(from: team)
                            }
                            .buttonStyle(.bordered)

                            Text("\(team.points)")
                                .frame(width: 40)
                                .fontWeight(.bold)

                            Button("+") {
                                gameData.addPoint(to: team)
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

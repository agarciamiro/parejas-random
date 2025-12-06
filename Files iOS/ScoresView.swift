import SwiftUI

struct ScoresView: View {

    @State var teams: [Team]

    var body: some View {
        VStack(spacing: 20) {

            Text("🏆 Puntajes")
                .font(.largeTitle.bold())

            ForEach($teams) { $team in
                HStack {

                    Text(team.name)
                        .frame(width: 140, alignment: .leading)

                    Spacer()

                    Button("−") {
                        if team.points > 0 {
                            team.points -= 1
                        }
                    }

                    Text("\(team.points)")
                        .frame(width: 40)

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

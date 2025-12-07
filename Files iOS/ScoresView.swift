import SwiftUI

struct ScoresView: View {

    @State var teams: [Team]

    var body: some View {
        VStack(spacing: 20) {

            Text("🏆 Puntajes")
                .font(.largeTitle.bold())

            ForEach($teams) { $team in
                VStack(alignment: .leading) {

                    Text(team.name)
                        .font(.headline)

                    Text(team.players.joined(separator: " & "))
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    HStack {
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
                }
                .padding(.bottom, 8)
            }

            Spacer()
        }
        .padding()
    }
}

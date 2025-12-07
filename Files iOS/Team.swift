import Foundation

struct Team: Identifiable {
    let id = UUID()
    var name: String
    var players: [String]
    var points: Int
}

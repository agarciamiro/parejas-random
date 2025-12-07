import Foundation

struct Team: Identifiable {
    let id = UUID()
    var name: String
    var players: [String]   // integrantes del equipo
    var points: Int         // puntaje del equipo
}

import Foundation
import Combine

// MODELO DE EQUIPO / PAREJA
struct Team: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var points: Int

    init(id: UUID = UUID(), name: String, points: Int) {
        self.id = id
        self.name = name
        self.points = points
    }
}

// ESTADO GLOBAL DEL JUEGO
final class GameData: ObservableObject {

    @Published var teams: [Team] = []

    // SUMAR PUNTO
    func addPoint(to team: Team) {
        if let index = teams.firstIndex(where: { $0.id == team.id }) {
            teams[index].points += 1
        }
    }

    // RESTAR PUNTO
    func removePoint(from team: Team) {
        if let index = teams.firstIndex(where: { $0.id == team.id }),
           teams[index].points > 0 {
            teams[index].points -= 1
        }
    }

    // ✅ CARGAR EQUIPOS DESDE LA WEB
    func cargarDesdeWeb(_ equipos: [Team]) {
        self.teams = equipos
    }

    // GUARDAR EN MEMORIA (opcional futuro)
    func guardar() {
        if let data = try? JSONEncoder().encode(teams) {
            UserDefaults.standard.set(data, forKey: "teams")
        }
    }

    // CARGAR DE MEMORIA (opcional futuro)
    func cargar() {
        if let data = UserDefaults.standard.data(forKey: "teams"),
           let decoded = try? JSONDecoder().decode([Team].self, from: data) {
            self.teams = decoded
        }
    }
}

import SwiftUI

@main
struct ParejasRandomApp: App {
    @StateObject private var gameData = GameData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameData)
        }
    }
}

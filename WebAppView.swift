import SwiftUI
import WebKit

struct WebAppView: UIViewRepresentable {

    @EnvironmentObject var gameData: GameData

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.userContentController.add(context.coordinator, name: "parejas")

        let url = URL(string: "https://parejas-random.onrender.com")!
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    // COORDINADOR
    class Coordinator: NSObject, WKScriptMessageHandler {

        var parent: WebAppView

        init(_ parent: WebAppView) {
            self.parent = parent
        }

        func userContentController(
            _ userContentController: WKUserContentController,
            didReceive message: WKScriptMessage
        ) {
            if let data = message.body as? [String: Any],
               let asignaciones = data["asignaciones"] as? [[String: Any]] {

                var equipos: [Team] = []

                for item in asignaciones {
                    if let pareja = item["pareja"] as? [String] {
                        let nombreEquipo = pareja.joined(separator: " & ")
                        equipos.append(Team(name: nombreEquipo, points: 0))
                    }
                    else if let persona = item["persona"] as? String {
                        equipos.append(Team(name: persona, points: 0))
                    }
                }

                // ✅ ESTA LÍNEA YA FUNCIONARÁ
                parent.gameData.cargarDesdeWeb(equipos)
            }
        }
    }
}

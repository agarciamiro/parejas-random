import SwiftUI
import WebKit

struct WebAppView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

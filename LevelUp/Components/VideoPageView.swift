//
//  VideoPage.swift
//  LevelUp
//
//  Created by Zeynep Göktepe on 8/14/23.
//


import SwiftUI
import WebKit

struct VideoPageView: UIViewRepresentable {
    let videoURL: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: videoURL))
        return webView
    }
        

    func updateUIView(_ uiView: WKWebView, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: VideoPageView

        init(_ parent: VideoPageView) {
            self.parent = parent
        }
    }
}


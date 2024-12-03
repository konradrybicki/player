//
//  Loader.swift
//  Player
//
//  Created by Konrad Rybicki on 02/12/2024.
//

import SwiftUI

struct Loader: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        .init(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}

#Preview {
    Loader()
}

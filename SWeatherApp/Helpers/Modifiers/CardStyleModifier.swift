//
//  CardStyleModifier.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//

import SwiftUI

struct CardStyleModifier: ViewModifier {
    var cornerRadius: CGFloat = 8
    var padding: CGFloat = 16
    var material: Material = .thinMaterial

    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(material)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .continuous
                )
            )
    }
}

extension View {
    func cardStyle(
        cornerRadius: CGFloat = 8,
        padding: CGFloat = 16,
        material: Material = .thinMaterial
    ) -> some View {
        modifier(
            CardStyleModifier(
                cornerRadius: cornerRadius,
                padding: padding,
                material: material
            )
        )
    }
}

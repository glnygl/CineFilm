//
//  ViewExtensions.swift
//  CineFilm
//
//  Created by glnygl on 19.12.2023.
//

import SwiftUI

extension View {
    func giveShadow(color: Color, radius: CGFloat, x: Double, y: Double) -> some View {
        self
            .shadow(color: color, radius: radius, x: x, y: y)
    }
}

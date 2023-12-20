//
//  ViewExtensions.swift
//  CineFilm
//
//  Created by glnygl on 19.12.2023.
//

import SwiftUI

extension View {
    func giveShadow() -> some View {
        self
            .shadow(color: .gray, radius: 4, x: 2.0, y: 2.0)
    }
}

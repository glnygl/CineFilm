//
//  BaseView.swift
//  CineFilm
//
//  Created by glnygl on 19.12.2023.
//

import SwiftUI

struct BaseView: ViewModifier {
    func body(content: Content) -> some View {
         content
            .toolbarRole(.editor)
     }
}

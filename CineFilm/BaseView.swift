//
//  BaseView.swift
//  CineFilm
//
//  Created by glnygl on 19.12.2023.
//

import SwiftUI

struct BaseView: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                        }
                    }
                }
            }
    }
}

extension View {
    func removeNavigationBackButtonTitle() -> some View {
        self.modifier(BaseView())
    }
}

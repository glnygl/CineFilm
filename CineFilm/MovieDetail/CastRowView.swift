//
//  CastRowView.swift
//  CineFilm
//
//  Created by glnygl on 24.08.2023.
//

import SwiftUI
import CachedAsyncImage

struct CastRowView: View {
    
    var viewModel: CastViewModel!
    
    var body: some View {
        VStack (spacing: 10) {
            CachedAsyncImage(
                url: URL(string: viewModel.imageUrl),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                        .frame(width: 100, height: 150)
                },
                placeholder: {
                    Image("noImage").resizable()
                        .frame(width: 100, height: 150)
                        .aspectRatio(contentMode: .fit)
                }
            ).giveShadow(color: .white, radius: 4, x: 2.0, y: 2.0)
            VStack (spacing: 2) {
                Text(viewModel.name)
                    .font(.system(size: 12, weight: .bold))
                    .lineLimit(1).frame(maxWidth: 100)
                Text(viewModel.character)
                    .font(.system(size: 8, weight: .regular))
                    .padding(.bottom, 16)
                    .lineLimit(1)
                    .frame(maxWidth: 100)
            }.foregroundStyle(.white)
        }
    }
}

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
                        .frame(minWidth: 100, maxWidth: 100, maxHeight: 200)
                        .cornerRadius(10)
                },
                placeholder: {
                    Image("noImage").resizable().frame(minWidth: 100, maxWidth: 100, maxHeight: 200)
                        .aspectRatio(contentMode: .fit)
                }
            )
            VStack (spacing: 2) {
                Text(viewModel.name)
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .bold))
                    .lineLimit(1).frame(maxWidth: 100)
                Text(viewModel.character)
                    .foregroundColor(.white)
                    .font(.system(size: 8, weight: .regular))
                    .padding(.bottom, 16)
                    .lineLimit(1)
                    .frame(maxWidth: 100)
            }
        }
    }
}

struct CastRowView_Previews: PreviewProvider {
    static var previews: some View {
        CastRowView(viewModel: CastViewModel(cast: Cast(id: 2, name: "Gal Gadot", character: "Wonder Woman")))
    }
}

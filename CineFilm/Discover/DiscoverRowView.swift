//
//  DiscoverRowView.swift
//  CineFilm
//
//  Created by glnygl on 17.08.2023.
//

import SwiftUI
import CachedAsyncImage

struct DiscoverRowView: View {
    
    var viewModel: MovieDetailViewModel!
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 20) {
                CachedAsyncImage(
                    url: URL(string: viewModel.imageUrl),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                    },
                    placeholder: {
                        Image("noImage").resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                )
                VStack(spacing: 2) {
                    Text(viewModel.title).font(.system(size: 12)).lineLimit(1).foregroundColor(.black)
                    Text(viewModel.releaseDate).font(.system(size: 10)).lineLimit(1).foregroundColor(.gray)
                    Spacer()
                }.padding(4)

            }.background(Color.white)
            RateView(progress: viewModel.shownRate).frame(width: 32, height: 32).position(x: 26, y: 164)
        }.cornerRadius(10)
            .giveShadow()
    }
}

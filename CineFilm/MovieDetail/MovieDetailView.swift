//
//  MovieDetailView.swift
//  CineFilm
//
//  Created by glnygl on 19.08.2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    var viewModel: MovieDetailViewModel!
    
    var body: some View {
        NavigationView {
            ZStack {
                AsyncImage(url: URL(string: viewModel.imageUrl)).blur(radius: 40)
                
                VStack (spacing: 20) {
                    HStack (spacing: 10) {
                        AsyncImage(
                            url: URL(string: viewModel.imageUrl),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: 160, maxHeight: 220)
                                    .cornerRadius(10)
                            },
                            placeholder: {}
                        )
                        VStack(spacing: 6) {
                            Text(viewModel.title)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                                .lineLimit(1)
                            Text(viewModel.releaseDate)
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                                .padding(.bottom, 10)
                                .lineLimit(1)
                            HStack(spacing: 30) {
                                RateView(progress: (viewModel.shownRate)).frame(width: 32, height: 32)
                            }
                        }
                    }
                    Text(viewModel.overview)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                }
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}

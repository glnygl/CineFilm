//
//  MovieDetailView.swift
//  CineFilm
//
//  Created by glnygl on 19.08.2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    var viewModel: MovieDetailViewModel? 
    
    var body: some View {
        
        ZStack {
            AsyncImage(url: URL(string: ConfigManager.shared.imageURL + (viewModel?.movie?.image ?? ""))).blur(radius: 40)
            
            VStack (spacing: 20) {
                HStack (spacing: 10) {
                    AsyncImage(
                        url: URL(string: ConfigManager.shared.imageURL + (viewModel?.movie?.image ?? "")),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 160, maxHeight: 220)
                                .cornerRadius(10)
                        },
                        placeholder: {}
                    )
                    VStack(spacing: 6) {
                        Text(viewModel?.movie?.title ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                            .lineLimit(1)
                        Text(viewModel?.movie?.relaseDate.format() ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .lineLimit(1)
                        HStack {
                            RateView(progress: (viewModel?.movie?.rate ?? 0) / 10).frame(width: 32, height: 32)
                        }
                        
                        Text(viewModel?.movie?.overview ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    }
                }
                Text(viewModel?.movie?.overview ?? "")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .semibold))
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}

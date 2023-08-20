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
        
        ZStack{            
            AsyncImage(url: URL(string: ConfigManager.shared.imageURL + (viewModel?.movie?.image ?? ""))).blur(radius: 40)
            HStack {
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
                VStack {
                    Text(viewModel?.movie?.title ?? "")
                    Text(viewModel?.movie?.relaseDate ?? "")
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

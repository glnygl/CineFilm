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
            ScrollView(showsIndicators: false) {
                VStack (spacing: 20) {
                    HStack (spacing: 20) {
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
                                .lineLimit(1).frame(maxWidth: 164)
                            Text(viewModel.releaseDate)
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                                .padding(.bottom, 16)
                                .lineLimit(1)
                            HStack(spacing: 20) {
                                RateView(progress: (viewModel.shownRate)).frame(width: 32, height: 32)
                                HStack {
                                    Text(viewModel.genre)
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .regular))
                                        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                        .lineLimit(1)
                                }.background(Color.appColor.darkGreen)
                            }
                        }
                    }
                    Text(viewModel.overview)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                        .padding(20)
                    Spacer()
                }
        }.background(
            AsyncImage(url: URL(string: viewModel.imageUrl)).blur(radius: 40))
        }.onAppear {
            viewModel.getCast(movieId: viewModel.id)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(movie: PopularMovie(id: 0, title: "Heart of stone", image: "", overview: "1yhjhgklkşlıkujytrdyfughıjlşkijlıhuyftdfguhjtxyctugıhojpliojıhuyguhıljkşigfhcvjblkhvgfcgvbjngfchvjbhknmçkkjhvgcvbj", relaseDate: "", rate: 7, genres: [0])))
    }
}

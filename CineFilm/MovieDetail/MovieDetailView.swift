//
//  MovieDetailView.swift
//  CineFilm
//
//  Created by glnygl on 19.08.2023.
//

import SwiftUI
import CachedAsyncImage
import SwiftData

struct MovieDetailView: View {
    
    @State var viewModel: MovieDetailViewModel
    @Environment(\.modelContext) private var context
    @Query private var favoriteMovies : [MovieDataItem]
    
    let rows = [
        GridItem(.flexible())
      ]
    
    var body: some View {
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
                                .font(.system(size: 20, weight: .bold))
                                .frame(maxWidth: 164)
                                .multilineTextAlignment(.center)
                            Text(viewModel.releaseDate)
                                .font(.system(size: 12, weight: .regular))
                                .padding(.bottom, 16)
                                .lineLimit(1)
                            VStack(spacing: 20) {
                                RateView(progress: (viewModel.shownRate)).frame(width: 32, height: 32)
                                Text(viewModel.genre)
                                    .font(.system(size: 12, weight: .regular))
                                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                    .lineLimit(1)
                                    .background(Color.appColor.torchRed)
                            }
                        }.foregroundStyle(.white)
                    }
                    Text(viewModel.overview)
                        .foregroundStyle(.white)
                        .font(.system(size: 14, weight: .semibold))
                        .padding(20)
                    
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows, alignment: .center) {
                            ForEach(viewModel.cast) { cast in
                                CastRowView(viewModel: CastViewModel(cast: cast))
                            }
                            .frame(height: 220)
                        }.padding(.horizontal)
                    }
                }
                Spacer()
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("", systemImage: viewModel.favoriteImage) {
                    guard let favoriteMovie = viewModel.movie?.convertMovieData() else { return }
                    if viewModel.isFavorite {
                        guard let selectedMovie = favoriteMovies.getSelectedMovie(movieId: favoriteMovie.id) else { return }
                        context.delete(selectedMovie)
                    } else {
                        context.insert(favoriteMovie)
                    }
                    try! context.save()
                    viewModel.isFavorite.toggle()
                }
            }
        }
        .background(Color(uiColor: UIColor.darkGray))
        .onAppear {
            viewModel.getCast(movieId: viewModel.id) { _ in}
            viewModel.isFavorite = favoriteMovies.checkIsFavorite(movieId: viewModel.id)
        }
    }
}

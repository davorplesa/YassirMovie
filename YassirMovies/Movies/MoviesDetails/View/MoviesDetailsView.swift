//
//  MoviesDetailsView.swift
//  YassirMovies
//
//  Created by Davor Plesa on 20.09.2023.
//

import SwiftUI

struct MoviesDetailsView: View {
    
    @StateObject var viewModel = MovieDetailViewModel()
    
    let movieId: Int
    
    var body: some View {
        ScrollView {
            VStack {
                
                if let movie = viewModel.movie {
                    
                    AsyncImage(url: movie.backdropURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        PlaceholderImage()
                    }
                    .frame(minHeight: 250)
                    
                    MovieInfo(movie: movie)
                }
            }
            .alert(item: $viewModel.appAlert) { appAlert in
                Alert(title: Text(appAlert.title), message: Text(appAlert.message))
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .task {
                viewModel.loadMovie(id: movieId)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private struct MovieInfo: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(movie.title)
                .font(.largeTitle)
            
            if let tagline = movie.tagline {
                Text(tagline)
                    .font(.headline)
            }
            
            Text(movie.yearText)
                .foregroundColor(.secondary)
                .font(.caption)
            
            Text(movie.overview)
                .font(.body)
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

struct MoviesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesDetailsView(movieId: 100)
    }
}

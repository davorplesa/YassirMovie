//
//  MoviesListView.swift
//  YassirMovies
//
//  Created by Davor Plesa on 20.09.2023.
//

import SwiftUI

struct MoviesListView: View {
    
    @StateObject var viewModel = MoviesListViewModel()
    
    var body: some View {
        NavigationStack {
            
            if viewModel.movies.isEmpty {
                ProgressView()
            } else {
                movieList
                    .listStyle(.grouped)
                    .navigationTitle(String.trendingMovies)
            }
        }
        .alert(item: $viewModel.appAlert) { appAlert in
            Alert(title: Text(appAlert.title), message: Text(appAlert.message))
        }
        .task {
            viewModel.loadItems()
        }
    }
    
    private var movieList: some View {
        
        List(viewModel.movies.enumerated().map({$0}), id: \.element.id) { index, movie in
            
            NavigationLink(destination: MoviesDetailsView(movieId: movie.id)) {
                MovieRow(movie: movie)
                    .onAppear{ viewModel.scrolledToItem(atIndex: index) }
            }
        }
    }
}

private struct MovieRow: View {
    
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: movie.posterURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                
            } placeholder: {
                PlaceholderImage()
            }
            .frame(width: 100, height: 150)
            .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 16) {
                Text(movie.title)
                    .font(.title3)
                    
                Text(movie.yearText)
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }
        .padding()
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}

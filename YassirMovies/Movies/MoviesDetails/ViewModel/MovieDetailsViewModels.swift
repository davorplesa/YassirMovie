//
//  MovieDetailsViewModels.swift
//  YassirMovies
//
//  Created by Davor Plesa on 20.09.2023.
//

import Foundation

@MainActor
class MovieDetailViewModel: ObservableObject {
    
    @Published var movie: Movie?
    @Published var isLoading = false
    @Published var appAlert: AppAlert?
    
    private var moviesService: MoviesServiceable
    
    init(moviesService: MoviesServiceable = MoviesService()){
        self.moviesService = moviesService
    }
    func loadMovie(id: Int) {
            
        isLoading = true
        
        Task {
            do {
                let movie: Movie = try await moviesService.getMovieDetails(movieId: id)
                self.movie = movie
                isLoading = false
            } catch {
                appAlert = AppAlert(title: .errorTitle, message: error.localizedDescription)
            }
        }
    }

     
}

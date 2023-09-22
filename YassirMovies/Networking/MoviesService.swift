//
//  NetworkService.swift
//  YassirMovies
//
//  Created by Davor Plesa on 20.09.2023.
//

import Foundation

protocol MoviesServiceable {
    func getTrendingMovies(page: Int) async throws -> MovieResponse
    func getMovieDetails(movieId: Int) async throws -> Movie
}

struct MoviesService: MoviesServiceable {
    
    func getTrendingMovies(page: Int) async throws -> MovieResponse {
        
        guard let url = MoviesURLFactory.createURL(forEndpoint: .trending(page: page)) else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder.jsonDecoder.decode(MovieResponse.self, from: data)
    }
    
    func getMovieDetails(movieId: Int) async throws -> Movie  {
        
        guard let url = MoviesURLFactory.createURL(forEndpoint: .details(id: movieId)) else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder.jsonDecoder.decode(Movie.self, from: data)
    }
}

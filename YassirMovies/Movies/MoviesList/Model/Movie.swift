//
//  Movie.swift
//  YassirMovies
//
//  Created by Davor Plesa on 20.09.2023.
//

import Foundation

fileprivate extension String {
    static let thumbnailURLPrefix = "https://image.tmdb.org/t/p/w200"
    static let originalURLPrefix = "https://image.tmdb.org/t/p/original"
}

struct MovieResponse: Codable {
    let results: [Movie]
    let page: Int
    let totalPages: Int
    let totalResults: Int
}

struct Movie: Codable, Hashable {
    
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String?
    let posterPath: String?
    let backdropPath: String?
    let tagline: String?
    
    var posterURL: URL {
        URL(string: .thumbnailURLPrefix + (posterPath ?? ""))!
    }
    
    var backdropURL: URL {
        URL(string: .originalURLPrefix + (backdropPath ?? ""))!
    }
    
    var yearText: String {
        guard let releaseDate = self.releaseDate,
              let date = DateFormatter.jsonFormatter.date(from: releaseDate) else {
            return ""
        }
        
        return DateFormatter.yearFormatter.string(from: date)
    }
}


//
//  URLFactory.swift
//  YassirMovies
//
//  Created by Davor Plesa on 22.09.2023.
//

import Foundation

enum MoviesEndpoint {
    case trending(page: Int)
    case details(id: Int)
}

struct MoviesURLFactory {
    static func createURL(forEndpoint endpoint: MoviesEndpoint) -> URL? {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        
        var queryDict = ["api_key" : Config.apiKey.rawValue]
        
        switch endpoint {
        case .trending(let page):
            components.path = "/3/discover/movie"
            queryDict["page"] = String(page)
            queryDict["include_adult"] = "false"
            queryDict["include_video"] = "false"
            
        case .details(let movieId):
            components.path = "/3/movie/\(movieId)"
        }
        
        components.setQueryItems(queryDict)
        
        return components.url
    }
}

extension URLComponents {
    mutating func setQueryItems(_ params: [String: String]) {
        self.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}

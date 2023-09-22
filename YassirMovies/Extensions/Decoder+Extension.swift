//
//  Decoder+Extension.swift
//  YassirMovies
//
//  Created by Davor Plesa on 20.09.2023.
//

import Foundation

extension JSONDecoder {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.jsonFormatter)
        return jsonDecoder
    }()
}

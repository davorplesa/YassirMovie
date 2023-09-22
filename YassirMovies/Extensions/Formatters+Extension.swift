//
//  Formatters+Extension.swift
//  YassirMovies
//
//  Created by Davor Plesa on 20.09.2023.
//

import Foundation

extension DateFormatter {
    
    static let jsonFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
    
    static let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
}

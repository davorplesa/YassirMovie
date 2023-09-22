//
//  AppAlert.swift
//  YassirMovies
//
//  Created by Davor Plesa on 22.09.2023.
//

import Foundation

struct AppAlert: Identifiable {
    let id = UUID().uuidString
    
    let title: String
    let message: String
}

//
//  PlaceholderImage.swift
//  YassirMovies
//
//  Created by Davor Plesa on 22.09.2023.
//

import SwiftUI

struct PlaceholderImage: View {
    var body: some View {
        ZStack {
            Color(white: 0.9)
            Image(systemName: "photo.fill").foregroundColor(.secondary)
        }
    }
}

struct PlaceholderImage_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderImage()
    }
}

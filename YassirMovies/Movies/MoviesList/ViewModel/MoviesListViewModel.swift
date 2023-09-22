//
//  MoviesListViewModel.swift
//  YassirMovies
//
//  Created by Davor Plesa on 20.09.2023.
//

import Foundation

@MainActor
class MoviesListViewModel: ObservableObject {
    
    private let lazyLoadThreshold = 5
    
    private var totalItemsCount: Int?
    private var loadedItemsCount: Int?
    private var page = 1
    
    private let moviesService: MoviesServiceable
    
    @Published var movies: [Movie] = []
    @Published var appAlert: AppAlert?
    
    init(moviesService: MoviesServiceable = MoviesService()){
        self.moviesService = moviesService
    }
    
    func loadItems() {
        page = 1
        requestItems(page: page)
    }
    
    func scrolledToItem(atIndex index: Int) {
        guard let loadedItemsCount = loadedItemsCount, let totalItemsCount = totalItemsCount else { return }
        
        if shouldRequestNextPage(index, loadedItemsCount: loadedItemsCount, totalItemsCount: totalItemsCount) {
            page += 1
            requestItems(page: page)
        }
    }
    
    private func requestItems(page: Int) {
        Task {
            do {
                let response = try await moviesService.getTrendingMovies(page: page)
                totalItemsCount = response.totalResults
                movies.append(contentsOf: response.results)
                loadedItemsCount = movies.count
            } catch {
                appAlert = AppAlert(title: .errorTitle, message: error.localizedDescription)
            }
        }
    }
    
    private func shouldRequestNextPage(_ currentItemIndex: Int, loadedItemsCount: Int, totalItemsCount: Int) -> Bool {
        loadedItemsCount - currentItemIndex == lazyLoadThreshold && loadedItemsCount < totalItemsCount
    }
}

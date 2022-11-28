//
//  HomeViewModel.swift
//  learning
//
//  Created by dfarbanish on 11/24/22.
//

import Foundation

extension HomeView {
    @MainActor class ViewModel: ObservableObject {
        @Published private (set) var models: [SportBadgeModel]?
        @Published private (set) var isLoading = true
        private let repo = HomeViewRepository()
        
        init() {
            // load data
            DispatchQueue.main.async {
                
                // todo: get data for accountId
                self.models = self.repo.getData()
                self.isLoading = false
            }
        }
        
    }
}

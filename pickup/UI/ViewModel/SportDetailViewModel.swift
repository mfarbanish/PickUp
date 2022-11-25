//
//  SportDetailViewModel.swift
//  learning
//
//  Created by dfarbanish on 11/25/22.
//

import Foundation

extension SportDetailView {
    @MainActor class ViewModel: ObservableObject {
        private let repo = SportDetailRepository()
        
        @Published private (set) var model: FullSportInfoModel?
        @Published private (set) var isLoading = true
        
        func initializeForId(id: String) {
            DispatchQueue.main.async {
                self.model = self.repo.getData(id: id)
                self.isLoading = false
            }
        }
    }
}

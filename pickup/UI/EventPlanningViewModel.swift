//
//  SportDetailViewModel.swift
//  learning
//
//  Created by dfarbanish on 11/25/22.
//

import Foundation

extension EventPlanningView {
    @MainActor class ViewModel: ObservableObject {
        private let repo = HomePageRepository()
        
        @Published private (set) var model: FullSportInfoModel?
        @Published private (set) var isLoading = true
        
        func initializeForId(userid: String) {
            DispatchQueue.main.async {
                self.model = self.repo.getData(userId: userid)
                self.isLoading = false
            }
        }
    }
}

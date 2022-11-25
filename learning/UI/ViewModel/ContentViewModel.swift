//
//  ContentViewModel.swift
//  learning
//
//  Created by dfarbanish on 11/24/22.
//

import Foundation
import MapKit

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        // possibly make private (set)
        @Published var username: String = ""
        @Published var password: String = ""
        
        init() {
            // get data
        }
        
        func addUserName(username: String) {
            self.username = username
            // todo add verification
        }
        
        func addPassword(password: String) {
            self.password = password
            // todo add verification
        }
    }
}

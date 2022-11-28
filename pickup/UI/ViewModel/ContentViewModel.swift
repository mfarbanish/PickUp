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
    
        @Published private (set) var accountId: String = "" // todo support null
        @Published private (set) var loginFailed = false
        
        private let accountRepo = AccountRepository()
        
        func addUserName(username: String) {
            self.username = username
            // todo add verification
        }
        
        func addPassword(password: String) {
            self.password = password
            // todo add verification
        }
        
        func attemptSignIn() {
            let result = accountRepo.signIn(username: username, password: password)
            do {
                accountId = try result.get()
            } catch {
                loginFailed = true
            }
        }
    }
}

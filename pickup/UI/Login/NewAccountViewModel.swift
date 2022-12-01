//
//  NewAccountViewModel.swift
//  PickUp
//
//  Created by dfarbanish on 11/27/22.
//

import Foundation

extension NewAccountView {
    @MainActor class ViewModel: ObservableObject {
        @Published var inputUserName = ""
        @Published var inputPassword = ""
        
        @Published var accountSuccess = false
        
        @Published private (set) var usernameInvalid = false
        @Published private (set) var passwordInvalid = false
        
        @Published private (set) var accountId: String = "" // make nullable
        @Published private (set) var signUpFailed = false
        @Published private (set) var signUpInfoInvalid = false
        
        private let accountRepo = AccountRepository()
        
        func usernameWritten() {
            DispatchQueue.main.async {
                self.usernameInvalid = !self.accountRepo
                    .isAccountNameValid(username: self.inputUserName)
            }
        }
        
        func passwordWritten() {
            // todo add password validation logic
            if (false) {
                passwordInvalid = true
            }
            // else do nothing
        }
        
        func attemptToCreateAccount() {
            if (canAttemptAccount()) {
                signUpInfoInvalid = false
                let result = accountRepo.addAccount(
                    username: self.inputUserName,
                    password: self.inputPassword
                )
                do {
                    try accountId = result.get()
                } catch {
                    signUpFailed = true
                }
            } else {
                signUpInfoInvalid = true
            }
        }
        
        func canAttemptAccount() -> Bool {
            return !(usernameInvalid || passwordInvalid || inputUserName.isEmpty || inputPassword.isEmpty)
        }
        
    }
}

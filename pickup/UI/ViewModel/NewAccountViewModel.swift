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
        @Published private (set) var canAttemptAccount = false
        
        @Published private (set) var accountId: String = "" // make nullable
        @Published private (set) var signUpFailed = false // todo remove or figure out
        
        init() {
            canAttemptAccount = !(usernameInvalid || passwordInvalid || inputUserName.isEmpty || inputPassword.isEmpty)
        }
        
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
            if (canAttemptAccount) { // fix this
                let isEMp = inputUserName.isEmpty
                let result = accountRepo.addAccount(
                    username: self.inputUserName,
                    password: self.inputPassword
                )
                do {
                    try accountId = result.get()
                } catch {
                    signUpFailed = true
                }
            }
        }
    }
}

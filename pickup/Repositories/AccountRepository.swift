//
//  AccountRepository.swift
//  PickUp
//
//  Created by dfarbanish on 11/27/22.
//

import Foundation

class AccountRepository {
    
    func isAccountNameValid(username: String) -> Bool {
        return true
    }
    
    func signIn(username: String, password: String) -> Result<String, SignInError> {
        // todo: add guard with failure result later
        // todo: hook up to server
        return .success("accountId")
    }
    
    func removeAccount(username: String) -> Bool {
        return true
    }
    
    func addAccount(username: String, password: String) -> Result<String, AddAccountError> {
        // todo: add guard with failure result later
        // todo: hook up to server
        return .success("accountId")
    }
    
}

enum AddAccountError: Error {
    case emptyString
}

enum SignInError: Error {
    case emptyString
}

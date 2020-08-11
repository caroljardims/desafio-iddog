//
//  UserViewModel.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import Foundation
import KeychainSwift

protocol UserViewModelProtocol {
    func checkUserToken(isLogged: @escaping (Bool) -> Void)
    func signup(email:String, success: @escaping () -> Void, fail: @escaping (String?) -> Void)
}

class UserViewModel: UserViewModelProtocol {
    
    var user: UserData?
    private let keychain = KeychainSwift()
    
    func checkUserToken(isLogged: @escaping (Bool) -> Void) {
        if let _ = self.keychain.get(Constants.userToken) {
            isLogged(true)
            return
        }
        isLogged(false)
    }
    
    func signup(email: String,
                success: @escaping () -> Void,
                fail: @escaping (String?) -> Void ) {
        if (!email.isValidEmail) {
            fail("Insira um e-mail válido para entrar.")
            return
        }
        Service.shared.signup(
            ["email":email],
            success: {result in
                self.user = result
                self.keychain.set(result.token, forKey: Constants.userToken)
                success()
        }, failure: {error in print(error)})
    }
    
}


//
//  UserViewModel.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import Foundation

protocol UserViewModelProtocol {
    func checkUserToken(isLogged: @escaping (Bool) -> Void)
    func signup(email:String, success: @escaping () -> Void, fail: @escaping (String?) -> Void)
}

class UserViewModel: UserViewModelProtocol {
    
    func checkUserToken(isLogged: @escaping (Bool) -> Void) {
        let userDefaults = UserDefaults.standard
        userToken = userDefaults.string(forKey: "userData")
        if (userToken != nil) {
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
                userData = result
                userToken = result.token
                let userDefaults = UserDefaults.standard
                userDefaults.set(userToken, forKey: "userData")
              
                success()
        }, failure: {error in print(error)})
    }
    
}


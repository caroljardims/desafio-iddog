//
//  User.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import Foundation

struct UserData: Decodable {
    let id: String
    let email: String
    let token: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case email
        case token
    }
}

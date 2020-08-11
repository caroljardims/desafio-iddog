//
//  Dog.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import Foundation

enum DogCategory: String {
    case husky
    case pug
    case hound
    case labrador
}

struct Dog: Decodable {
    let category: String?
    let list: [String]?
}

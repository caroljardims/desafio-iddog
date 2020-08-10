//
//  networkHandler.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import Foundation
import Alamofire

struct Service {
    static let shared = Service()
    
    func signup( _ parameters: [String:String]?,
                 success: @escaping (UserData) -> Void,
                 failure: @escaping (String) -> Void) {
        Alamofire.request("\(baseUrl)\(signupExtensionUrl)",
            method: .post,
            parameters: parameters).responseJSON { response in
                let decoder = JSONDecoder()
                do {
                    let requestData = try decoder.decode(User.self, from: response.data!)
                    let user = requestData.user
                    success(user)
                } catch {
                    failure(error.localizedDescription)
                }
        }
    }
    
    func getFeed(_ query: DogCategory?,
                 success: @escaping (Dog) -> Void,
                 failure: @escaping (String) -> Void) {
        guard let userToken = userToken else {
            failure("User not logged.")
            return
        }
        
        var category = ["":""]
        
        switch query {
        case .hound:
            category = ["category":"hound"]
            break
        case .husky:
            category = ["category":"husky"]
            break
        case .labrador:
            category = ["category":"labrador"]
            break
        case .pug:
            category = ["category":"pug"]
            break
        default:
            break
        }
        
        
        let headers = ["Authorization":userToken]
        Alamofire.request("\(baseUrl)\(feedExtensionUrl)",
            method: .get,
            parameters: category,
            encoding: URLEncoding.queryString,
            headers: headers).responseJSON { response in
                let decoder = JSONDecoder()
                do {
                    let dog = try decoder.decode(Dog.self, from: response.data!)
                    print(dog)
                    success(dog)
                } catch {
                    print(error.localizedDescription)
                    failure(error.localizedDescription)
                }
        }
    }
}



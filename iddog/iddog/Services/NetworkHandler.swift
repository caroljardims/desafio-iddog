//
//  networkHandler.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import Foundation
import Alamofire
import KeychainSwift

struct Service {
    static let shared = Service()
    
    func signup( _ parameters: [String:String]?,
                 success: @escaping (UserData) -> Void,
                 failure: @escaping (String) -> Void) {
        Alamofire.request("\(Constants.baseUrl)\(Constants.signupExtensionUrl)",
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
        let keychain = KeychainSwift()
        guard let userToken = keychain.get(Constants.userToken) else {
            failure("No user token found.")
            return
        }
        
        var category = ["":""]
        if (query != nil) {
            category = ["category":query!.rawValue]
        }
        
        let headers = ["Authorization":userToken]
        Alamofire.request("\(Constants.baseUrl)\(Constants.feedExtensionUrl)",
            method: .get,
            parameters: category,
            encoding: URLEncoding.queryString,
            headers: headers).responseJSON { response in
                if let value = response.result.value as? [String: AnyObject] {
                    if let error = value["error"] {
                        failure(error["message"] as? String ?? "Request failed.")
                        return
                    }
                }
                let decoder = JSONDecoder()
                do {
                    let dog = try decoder.decode(Dog.self, from: response.data!)
                    success(dog)
                } catch {
                    print(error.localizedDescription)
                    failure(error.localizedDescription)
                }
        }
    }
}



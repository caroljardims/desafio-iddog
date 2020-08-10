//
//  FeedViewModel.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import Foundation

protocol FeedViewModelProtocol {
    func getFeed(_ category:String?, success: @escaping () -> Void, fail: @escaping (String?) -> Void )
}

class FeedViewModel: FeedViewModelProtocol {
    private var dog: Dog?
    
    let feedDataSource = FeedDataSource()
    
    func getFeed(_ category: String?,
                 success: @escaping () -> Void,
                 fail: @escaping (String?) -> Void) {
        Service.shared.getFeed(.labrador, success: {dog in
            self.dog = dog
            self.feedDataSource.list = dog.list ?? []
            success()
         }, failure: {error in
             print(error)
         })
    }
}


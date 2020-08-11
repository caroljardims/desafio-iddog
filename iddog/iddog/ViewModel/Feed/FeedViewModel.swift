//
//  FeedViewModel.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import Foundation
import KeychainSwift

protocol FeedViewModelProtocol {
    func getFeed(_ category: DogCategory?, success: @escaping () -> Void, fail: @escaping (String?) -> Void )
}

protocol UpdateViewModelProtocol {
    func updateCategory(category: DogCategory)
    func openImage(imageUrl: String)
}

class FeedViewModel: FeedViewModelProtocol, UpdateViewModelProtocol {
    
    var feedViewUpdate: UpdateFeedViewController?
    private var dog: Dog?
    var dogCategory: DogCategory?
    let feedDataSource = FeedDataSource()
    
    init() {
        feedDataSource.viewModel = self
    }
    
    func getFeed(_ category: DogCategory?,
                 success: @escaping () -> Void,
                 fail: @escaping (String?) -> Void) {
        self.dogCategory = category ?? .husky
        Service.shared.getFeed(category, success: {dog in
            self.dog = dog
            self.feedDataSource.list = dog.list ?? []
            success()
        }, failure: {error in
            fail(error)
        })
    }
    
    func updateCategory(category: DogCategory) {
        self.dogCategory = category
        getFeed(self.dogCategory, success: {
            self.feedViewUpdate?.reloadData()
        }) { (error) in
            print(error)
        }
    }
    
    func openImage(imageUrl: String)  {
        feedViewUpdate?.openImage(imageUrl: imageUrl)
    }
    
    func clearUserDefaults(){
        let keychain = KeychainSwift()
        keychain.delete(Constants.userToken)
    }
}


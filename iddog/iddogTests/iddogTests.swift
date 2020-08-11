//
//  iddogTests.swift
//  iddogTests
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import XCTest
import KeychainSwift
@testable import iddog

class iddogTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUserViewModel() throws {
        
        let keychain = KeychainSwift()
        let userViewModel = UserViewModel()
        userViewModel.checkUserToken { (logged) in
            XCTAssertEqual(keychain.get(Constants.userToken) != nil, logged)
        }
        
        userViewModel.signup(email: "a", success: {}) { (error) in
            // assegurar erro ao inserir e-mail errado
            XCTAssertEqual(error, "Insira um e-mail válido para entrar.")
        }
        
        userViewModel.signup(email: "teste@gmail.com", success: {
            // assegurar que token está sendo salvo localmente
            XCTAssertNotNil(keychain.get(Constants.userToken))
            XCTAssertEqual(keychain.get(Constants.userToken), userViewModel.user?.token)
        }) { (error) in
            XCTAssert(error != nil)
        }
        
        
    }
    
    func testFeedViewModel() throws {
        let feedViewModel = FeedViewModel()
        feedViewModel.getFeed(nil, success: {
            XCTAssertNotNil(feedViewModel.dogCategory)
            XCTAssertEqual(DogCategory.hound, feedViewModel.dogCategory)
            XCTAssertFalse(feedViewModel.feedDataSource.list.isEmpty)
        }) { (err) in
           XCTAssertNotNil(err)
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

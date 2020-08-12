//
//  iddogUITests.swift
//  iddogUITests
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import XCTest
import KeychainSwift

class iddogUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Run this test if NOT logged
    func testOpeningNotLogged() {
        app = XCUIApplication()
        
        app.launch()
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.isDisplayingSignUp)
    }
    
     // Run this test if logged
    /*
    func testOpeningLogged() {
        app = XCUIApplication()
        
        app.launch()
        // Make sure we're displaying onboarding
        XCTAssertFalse(app.isDisplayingSignUp)
        XCTAssertTrue(app.isDisplayingFeed)
    }
     */
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension XCUIApplication {
    var isDisplayingSignUp: Bool {
        return otherElements["MainView"].exists
    }
    
    var isDisplayingFeed: Bool {
        return otherElements["FeedView"].exists
    }
}

//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Donny Davis on 3/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Tests
    
    // Tests to confirm that the Meal initializer returns when no name or a negative ranking is provided
    func testMealInitialization() {
        
        // Success cases
        let potentialItem = Meal(name: "Newest Meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure cases
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really Bad Rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid")
        
    }
    
}

//
//  Meal.swift
//  FoodTracker
//
//  Created by Donny Davis on 3/23/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there is no name or rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
        
    }
    
}
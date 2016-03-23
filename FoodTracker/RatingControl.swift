//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Donny Davis on 3/23/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5

    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let emptyStarImage = UIImage(named: "emptyStar")
        let filledStarImage = UIImage(named: "filledStar")
        
        // Create five red square buttons for the ratings and add it to the view
        for _ in 0..<starCount {
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        
        // Set the button size equal to the height of the frame
        let buttonSize = Int(frame.size.height)
        // Set the width of the view equal to the size of the buttons plus the spacing between them
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: width, height: buttonSize)
        
    }
    
    override func layoutSubviews() {
        
        // Set the button's width and height equal to the height of the frame
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
        
    }
    
    
    // MARK: Button Actions
    
    func ratingButtonTapped(button: UIButton) {
        
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
        
    }
    
    func updateButtonSelectionStates() {
        
        // Loop through the buttons array and set the selected state for every
        // button in a position less than the rating
        for (index, button) in ratingButtons.enumerate() {
            button.selected = index < rating
        }
        
    }

}

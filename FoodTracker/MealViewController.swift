//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Donny Davis on 3/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        
        // Set up view if editing an existing meal
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        // Enable the save button only if the user enters a valid name
        checkValidMealName()
        
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // Hide the keyboard
        textField.resignFirstResponder()
        
        return true
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        // Disable the save button
        saveButton.enabled = false
        
    }
    
    func checkValidMealName() {
        
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        checkValidMealName()
        navigationItem.title = textField.text
        
    }
    
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if sender === saveButton {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            // Set the meal to be passed to MealTableViewController after the unwind
            meal = Meal(name: name, photo: photo, rating: rating)
        }
        
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        // Hide the keyboard
        nameTextField.resignFirstResponder()
        
        // Create an instance of the UIImagePickerController
        let imagePickerController = UIImagePickerController()
        
        // Allow photos to be picked but not taken
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure the view controller is notified when the user picks an image
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        // Dismiss the image picker
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // The info dictionary contains multiple representations of the image, and this uses the original
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected photo
        photoImageView.image = selectedImage
        
        // Dismiss the image picker
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}


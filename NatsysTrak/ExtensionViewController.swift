//
//  ExtensionViewController.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/7/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//


import Foundation
import UIKit


extension UIViewController {
  
  
      var activityIndicatorTag: Int { return 999999 }
      
      
      // Generic function to display an alert from any ViewControlller
      func displayAlert(_ title:String, message:String, buttonText: String) {
        // Create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        // Add an action
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler:
          { action in
            // Dismiss when the button is pressed
            self.dismiss(animated: true, completion: nil)
        }))
        // Add it to viewController
        self.present(alert, animated: true, completion: nil)
      } // end function
      
      
      
      /// Function to display a generic alert.
      ///
      func displayGenericAlert(_ title:String, message:String, style: UIAlertControllerStyle, alerts: [UIAlertAction]) {
        // Create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        // Add actions to Controller
        for i in 1...alerts.count {
          alert.addAction(alerts[i])
        }
        
        // Show the alert
        self.present(alert, animated: true, completion: nil)
        
      }
      
      
      /// Function to hide keyboard when user taps screen
      func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
      }
      
      
      /// Dismiss the on screen keyboard
      func dismissKeyboard() {
        view.endEditing(true)
      }
      
  
  
  
      /// Create an Activity Indicator
      func startActivityIndicator( style: UIActivityIndicatorViewStyle = .gray, location: CGPoint? = nil) {
            
              //Set the position - defaults to `center` if no`location` argument is provided
              let loc = location ?? self.view.center
              
              //Ensure the UI is updated from the main thread, in case this method is called from a closure
              DispatchQueue.main.async(execute: {
                //Create the activity indicator
                let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: style)
                //Add the tag so we can find the view in order to remove it later
                activityIndicator.tag = self.activityIndicatorTag
                //Set the location
                activityIndicator.center = loc
                activityIndicator.hidesWhenStopped = true
                //Start animating and add the view
                activityIndicator.startAnimating()
                self.view.addSubview(activityIndicator)
              }) // end DispatchQueue
        
        } // end func
  

  
      /// Stop the Activity indicator
      func stopActivityIndicator() {
        //Again, we need to ensure the UI is updated from the main thread!
        DispatchQueue.main.async(execute: {
          //Here we find the `UIActivityIndicatorView` and remove it from the view
          if let activityIndicator = self.view.subviews.filter(
            { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
          }
        }) // end DispatchQueue
  }

  
  
  

}  // end class

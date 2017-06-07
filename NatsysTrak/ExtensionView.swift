//
//  ExtensionUIView.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/7/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//


import Foundation
import UIKit



extension UIView  {
  
  
  // This computed property will give us the parent controller for a given Cell ( TableView or CollectionView)
  // This comes in handy when say you want to display aln alert from a Cell
  var parentViewController: UIViewController? {
    var parentResponder: UIResponder? = self
    while parentResponder != nil {
      parentResponder = parentResponder!.next
      if parentResponder is UIViewController {
        return parentResponder as! UIViewController!
      }
    }
    return nil
  }
  
  
  
  
  
  
  
  
  
  
  
} // end class

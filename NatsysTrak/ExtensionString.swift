//
//  ExtensionString.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/6/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//


import Foundation


extension String {
  
  
  
  /// Converts a string value to a NSDecimalNumber
  /// usage:
  /// var priceStr = "367.875"
  /// var itemPrice:NSDecimalNumber = priceStr.toNSDecimal()
  ///
  /// - Returns: a NSDecimalNumber or 0 if not successful
  func toNSDecimal() -> NSDecimalNumber {
    return GlobalConstants.numberFormatter.number(from: self) as? NSDecimalNumber ?? 0
  }
  
  
  
  
  
  /// Function creates a NSDecimalNumber from a String value
  
  func getNSDecimalNumber() -> NSDecimalNumber?  {
    return GlobalConstants.numberFormatter.number(from: self) as? NSDecimalNumber
  }

  
  
  
  
} // end extension

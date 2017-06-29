//
//  ExtensionArray.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/6/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//

import Foundation
import UIKit





extension Array {
  
  
  
  func convertArray(toString arr:[String]) -> String? {
    return arr.joined(separator: ",")
  }
  
  
  
  /// Utility function to convert to Dictionary
  func toDictionary<H:Hashable, T>(byTransforming transformer: (Element) -> (H, T)) -> Dictionary<H, T>   {
      var result = Dictionary<H,T>()
        self.forEach({ element in
          let (key,value) = transformer(element)
          result[key] = value
        })
        return result
      }
  
  
  
  
} // end extension

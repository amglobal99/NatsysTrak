//
//  ExtensionDictionary.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/6/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//


import Foundation
import UIKit


extension Dictionary where Value: Equatable {
  
  
  func allKeys(forValue val: Value) -> [Key] {
    return self.filter { $1 == val }.map { $0.0 }
  }
  
  
  /// Function to convert filtered Dictionary ( which is an array of tuples) to a Dictionary
  /// The function makes use of the toDictionary method which is an Array extension
  /// Usage:
  ///  let data = ["a":"yes", "b":"nope", "c":"oui", "d":"nyet"]
  ///  let filtered = data.filteredDictionary({ $0.1 >= "o" })
  ///  https://stackoverflow.com/questions/32604897/swift-filter-dictionary
  /// 
  func filteredDictionary(_ isIncluded: (Key, Value) -> Bool)  -> Dictionary<Key, Value>   {
    return self.filter(isIncluded).toDictionary(byTransforming: { $0 })
  }
  
  
  
} // end extn





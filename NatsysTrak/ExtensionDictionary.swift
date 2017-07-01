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
  
  
  
  
  /// Function to filter an Array of Dictionary items.
  /// For example, let's say we have a Dictionary which contains an 
  /// array of individual Dictionary items.
  /// Each item is say a JSON entity.
  /// Let's say we have an array of 1000 such objects. We want to filter that Dictionary,
  /// and extract objects matching some criteria.
  /// Usage:
  ///  First, create an Array of individual Dictionary items
  ///  dict3 = [
  /// ["name":"jack","age": "10"],
  /// ["name":"kim","age": "24"],
  /// ["name":"pam","age":"44"]
  /// ]
  ///  var newFilter = filterArrayOfDictionaries(dictToSearch: dict3, searchKey: "name", searchValue: "jack")
  ///  print(newFilter)
  ///  Output:
  ///  [["name": "jack", "age": "10"]]
  
  func filterArrayOfDictionaries(dictToSearch: [[String:String] ], searchKey: String, searchValue: String) -> [ [String:String] ] {
    let filtered = dictToSearch.filter {
      // $0["name"] == "jack"
      val in
      val[searchKey] == searchValue
    }
    
    return filtered
  }
  
  
  
  
  
  

  
  
  
  
} // end extn





//
//  ExtensionEurekaRow.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/6/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//

import Eureka

var extensionPropertyStorage: [String: [String: Any]] = [:]

var maxLength_ = "maxLength"

extension Row {
  
  public var maxLength: Int? {
    get {
      return didSetMaxLength
    }
    set {
      didSetMaxLength = newValue
    }
  }
  
  private var didSetMaxLength: Int? {
    get {
      return extensionPropertyStorage[self.tag!]?[maxLength_] as? Int
    }
    set {
      var selfDictionary = extensionPropertyStorage[self.tag!] ?? [String: Any]()
      selfDictionary[maxLength_] = newValue
      extensionPropertyStorage[self.tag!] = selfDictionary
    }
  }
  
  
  
} // end extn

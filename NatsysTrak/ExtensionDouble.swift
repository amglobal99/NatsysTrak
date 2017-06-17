//
//  ExtensionDouble.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/17/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//

import Foundation





public extension Double {
  
  
  
  func fix() -> Double {
    return self == -0 ? 0 : self;
  }
  
  func round(_ decimals: Int = 2) -> Double {
    if(decimals == 2){
      let multiplier = pow(Double(10), Double(decimals))
      return (Foundation.round(self * multiplier) / multiplier).fix()
    }else{
      return (Foundation.round(self * 100) / 100).fix()
    }
  }
  
  func toPennies() -> Int {
    return Int((self * 100).round(0));
  }
  
  func cast() -> Int {
    return Int(self.round(0))
  }
  
  
  
  
}



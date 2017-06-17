//
//  ExtensionInt.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/17/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//

import Foundation


public extension Int {
  
  
  
  
  func fix() -> Int {
    return self == -0 ? 0 : self;
  }
  
  func toDollars() -> Double{
    return (Double(self) / 100).round();
  }
  
  func multiply(_ percent: Double) -> Int {
    return (Double(self) * percent).cast();
  }
  
  
  
  
}

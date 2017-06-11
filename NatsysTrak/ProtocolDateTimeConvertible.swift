//
//  ProtocolDateTimeConvertible.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/10/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//



import Foundation
import UIKit


protocol DateTimeConvertible { }





extension DateTimeConvertible {
  
  
  
  
  /// Function computes difference between two Dates
  func timeDiff(_ date1: Date) -> Double {
    let  date2: Date = Date()
    return date2.timeIntervalSince(date1)
    
  }
  
  
  
  
  
  
  
}  // end extension

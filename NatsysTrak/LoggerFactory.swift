//
//  LoggerFactory.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/7/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//


import Foundation
import CocoaLumberjack

class LoggerFactory {
  
  #if DEBUG
  static let defaultLogLevel: DDLogLevel = DDLogLevel.all
  #else
  static let defaultLogLevel: DDLogLevel = DDLogLevel.warning
  #endif
  
  
  static func initLogging() {
    DDLog.add(DDTTYLogger.sharedInstance, with: defaultLogLevel)
    DDLog.add(DDASLLogger.sharedInstance, with: defaultLogLevel)
  }
  
  
}

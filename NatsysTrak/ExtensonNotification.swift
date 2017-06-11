//
//  ProtocolNotificationable.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/11/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//

import Foundation
import CocoaLumberjack


extension Notification {
  
  
      /// Adds a Notification observer
      static func addNotificationObserver(_ observer: AnyObject, selector: Selector, name: Notification.Name){
        removeNotificationObserver(observer, name: name)
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: nil)
      }
      
      /// Remove observer
      static func removeNotificationObserver(_ observer: AnyObject, name: Notification.Name){
        NotificationCenter.default.removeObserver(observer, name: name, object: nil)
      }
      

        
  
  
  
} // end extension

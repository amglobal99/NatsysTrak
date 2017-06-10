//
//  GlobalFunctions.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/7/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//


import Foundation
import SwiftSpinner
import CocoaLumberjack



struct  GlobalFunctions {
  
  
      var connected: Bool? = true
  
  
  
      // Flag that tracks internet connectivity
      var internetIsConnected:Bool = true
      
  
  
  
  
      
      /// Add a Notification observer
      static func addNotificationObserver(_ observer: AnyObject, selector: Selector, name: Notification.Name){
        removeNotificationObserver(observer, name: name)
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: nil)
      }
      
      /// Remove observer
      static func removeNotificationObserver(_ observer: AnyObject, name: Notification.Name){
        NotificationCenter.default.removeObserver(observer, name: name, object: nil)
      }
      
      
      /// Display message to user stating connection to internet is unavailable
      static func displayNoConnectivityMessage() {
        DDLogDebug("SLane: Will display no connectivity message.")
        SwiftSpinner.setTitleFont(UIFont(name: "Futura", size: 18.0))
        SwiftSpinner.show(delay: 0.1, title: "Unable to contact servers, please check your internet connection and try again.")
      }
      
      
      /// Display message to user stating site is not responding
      static func displaySiteIsDownMessage() {
        DDLogDebug("SLane: Will display site down message.")
        SwiftSpinner.setTitleFont(UIFont(name: "Futura", size: 18.0))
        SwiftSpinner.show(delay: 0.1, title: "Unable to contact servers. Please try again later.")
      }
      
      
      
      /// check if Internet connection is available.
      /// do this check before sending any url requests
      
      static func isInternetConnectionAvailable() -> Bool {
        if (Network.reachability?.isConnectedToNetwork)!  {
          DDLogDebug("SLane:  Internet is connected")
          return true
        } else {
          DDLogDebug("SLane: Internet is disconncted")
          return false
        }
      }
      
  
  
  
      // Update Internet Connectivity status
      mutating func updateConnectivityStatus (status:Bool) {
        self.connected = status
      }
  
  
  
  
  
  /*
  
  /// Method to track when internet connectivity changes status from Connected to Not Connected and vice-versa
  /// An observer has been specified in the AppDelegate method 'didFinishLaunchingWithOptions'
  
  func updateConnectivityStatus (_ notification: NSNotification) {
    
    DDLogDebug("updateConnectivityStatus: Received notification.")
    guard let status = Network.reachability?.status else { return }
    switch status {
    case .unreachable:
      self.internetIsConnected = false
      DDLogDebug("Notified that Internet is NOT Connected")
      GlobalFunctions.displayNoConnectivityMessage()
    default:
      self.internetIsConnected = true
      DDLogDebug("Notified that Internet is Connected")
      self.hideSpinner()
    }
    
  } // end func
  
  

  */
  
  
  
  
    
  
} // end struct

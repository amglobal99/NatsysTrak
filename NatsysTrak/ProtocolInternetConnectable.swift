//
//  ProtocolInternetConnectable.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/11/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//

import Foundation
import CocoaLumberjack
import SwiftSpinner


protocol InternetConnectable{
  
}




extension InternetConnectable {
  
  /*
  /// Display message to user stating connection to internet is unavailable
  static func displayNoConnectivityMessage() {
    DDLogDebug("GlobalFunctions - displayNoConnectivityMessage: Will display no connectivity message.")
    SwiftSpinner.setTitleFont(UIFont(name: "Futura", size: 18.0))
    SwiftSpinner.show(delay: 0.1, title: "Unable to contact servers, please check your internet connection and try again.")
  }
  
  /// Display message to user stating site is not responding
  static func displaySiteIsDownMessage() {
    DDLogDebug("GlobalFunctions - displayNoConnectivityMessage: Will display site down message.")
    SwiftSpinner.setTitleFont(UIFont(name: "Futura", size: 18.0))
    SwiftSpinner.show(delay: 0.1, title: "Unable to contact servers. Please try again later.")
  }
  
  
  /// check if Internet connection is available.
  /// do this check before sending any url requests
  static func isInternetConnectionAvailable() -> Bool {
    if (Network.reachability?.isConnectedToNetwork)!  {
      DDLogDebug("GlobalFunctions - isInternetConnectionAvailable:  Internet is connected")
      return true
    } else {
      DDLogDebug("GlobalFunctions - isInternetConnectionAvailable: Internet is disconncted")
      return false
    }
  }
  

  
  
  
  /// Method to track when internet connectivity changes status from Connected to Not Connected and vice-versa
  /// An observer has been specified in the AppDelegate method 'didFinishLaunchingWithOptions'
  /// -parameter: notification
  @objc func updateConnectivityStatus (_ notification: NSNotification) {
    
    DDLogDebug("GlobalFunctions - updateConnectivityStatus: Received notification.")
    
    guard let status = Network.reachability?.status else { return }
    switch status {
    case .unreachable:
      self.internetIsConnected = false
      DDLogDebug("GlobalFunctions - Notified that Internet is NOT Connected")
      GlobalFunctions.displayNoConnectivityMessage()
    default:
      self.internetIsConnected = true
      DDLogDebug("GlobalFunctions - Notified that Internet is Connected")
      GlobalFunctions.hideSpinner()
    }
    
  } // end func
  

  
  */
  
  
  
  
}

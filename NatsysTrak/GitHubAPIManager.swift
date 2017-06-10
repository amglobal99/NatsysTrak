//
//  APIManager.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/9/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//
//  This is the heart and soul of our app.


import Foundation
import Alamofire
import SwiftyJSON
import Locksmith
import CocoaLumberjack
import SwiftSpinner




class GitHubAPIManager {
  
  
  static let sharedInstance = GitHubAPIManager()
  
  // Flag that tracks internet connectivity
  var internetIsConnected:Bool = true
  
  

  
  let clientID: String = "52c236ee0538eb2d784d"
  let clientSecret = "f7de13b794087bc479d279f6f3a44661a78da7e6"
  var isLoadingOAuthToken: Bool = false
  static let ErrorDomain = "com.error.GitHubAPIManager"
  
  // handler for the OAuth process
  // stored as vars since sometimes it requires a round trip to safari which
  // makes it hard to just keep a reference to it
  var OAuthTokenCompletionHandler:((NSError?) -> Void)?
  
  
  
  var OAuthToken: String? {
      set {
        guard let newValue = newValue else {
          let _ = try? Locksmith.deleteDataForUserAccount(userAccount: "github")
          return
        }
        
        guard let _ = try? Locksmith.updateData(data: ["token": newValue], forUserAccount: "github") else {
          let _ = try? Locksmith.deleteDataForUserAccount(userAccount: "github")
          return
        }
      }
      get {
        // try to load from keychain
        let dictionary = Locksmith.loadDataForUserAccount(userAccount: "github")
        return dictionary?["token"] as? String
      }
  } // end OAuthToken
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  func get() {
    
    
  }
  
  
  
  
  func verify() {
    
    
    
  }
  
  
  
  
  
  func update() {
    
  }
  
  
  
  /*
  func hideSpinner(){
    SwiftSpinner.hide()
  }
  
  */
  
  
  /*
  
  /// Method to track when internet connectivity changes status from Connected to Not Connected and vice-versa
  /// An observer has been specified in the AppDelegate method 'didFinishLaunchingWithOptions'
  
  @objc func updateConnectivityStatus (_ notification: NSNotification) {
    
    DDLogDebug("updateConnectivityStatus: Received notification.")
    guard let status = Network.reachability?.status else { return }
    switch status {
    case .unreachable:
      self.internetIsConnected = false
      DDLogDebug("updateConnectivityStatus: Notified that Internet is NOT Connected")
      GlobalFunctions.displayNoConnectivityMessage()
    default:
      self.internetIsConnected = true
      DDLogDebug("updateConnectivityStatus: Notified that Internet is Connected")
      //self.hideSpinner()
      GlobalFunctions.hideSpinner()
    }
    
  } // end func
  
  

  
  */
  
  
  
  
  
  
} // end class

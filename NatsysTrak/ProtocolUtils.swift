//
//  ProtocolUtils.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/6/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//


import Foundation
import UIKit
import BRYXBanner
import Alamofire
import CocoaLumberjack
import SwiftSpinner

// MARK: Protocols

protocol Utils {}   // This protocol contains common utility functions



// MARK: - Extensions Utils

extension Utils {
  
  
      // This is a simple test method
      func climb() -> Void {
        DDLogDebug("I am climbing .....")
      }
      
      
      //MARK: - Banner Related
      
      
      /// Function displays a Bannner
      func showBanner(title:String, subtitle:String, image: UIImage?, bkColor: UIColor) {
        let banner: Banner? = Banner(title: title, subtitle: subtitle, image: image, backgroundColor: bkColor)
        banner?.dismissesOnSwipe = true
        banner?.show(duration: nil)
      }
      
      
      
      
      
      /**
          Function returns a URL.
       
         - Parameters:
           - baseURLString:      the base URL string
           - method:             options are get, post etc
           - parameters:         parameters passed in
           - apiKey:             the api key if needed
      
         - Returns:              a URL object
      
      */
  
      func getSiteURL(baseURLString:String, method: String?, parameters: [String:String]?, apiKey:String? ) -> URL? {
        
        guard  var components = URLComponents(string: baseURLString ) else {
          return nil
        }
        
        // check if we need to use method and apiKey
        if method != nil && apiKey != nil {
          var queryItems = [URLQueryItem]()
          let baseParams  = [
            "method": method,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": apiKey
          ]
          
          for(key,value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
          }
          if let additionalParams = parameters {   // make sure parameters is not nil
            for (key, value) in additionalParams {
              let item = URLQueryItem(name: key, value: value )
              queryItems.append(item)
            } //end for loop
          } //end if
          
          components.queryItems = queryItems
        } // if method != nil
        
        
        guard let url = components.url else {
          return nil
        }
        
        return url
        
      } //end method
      
      
      
  
      /*
      /// Display message to user stating connection to internet is unavailable
      static func displayNoConnectivityMessage() {
        DDLogDebug("GlobalHelper - displayNoConnectivityMessage: Will display no connectivity message.")
        SwiftSpinner.setTitleFont(UIFont(name: "Futura", size: 18.0))
        SwiftSpinner.show(delay: 0.1, title: "Unable to contact servers, please check your internet connection and try again.")
      }
      
      /// Display message to user stating site is not responding
      static func displaySiteIsDownMessage() {
        DDLogDebug("GlobalHelper - displayNoConnectivityMessage: Will display site down message.")
        SwiftSpinner.setTitleFont(UIFont(name: "Futura", size: 18.0))
        SwiftSpinner.show(delay: 0.1, title: "Unable to contact servers. Please try again later.")
      }
  

  
  
      /// Hide the spinner
      static func hideSpinner(){
        SwiftSpinner.hide()
      }
  
  
  
  
  
      /// check if Internet connection is available.
      /// do this check before sending any url requests
      static func isInternetConnectionAvailable() -> Bool {
        if (Network.reachability?.isConnectedToNetwork)!  {
          DDLogDebug("GlobalHelper - isInternetConnectionAvailable:  Internet is connected")
          return true
        } else {
          DDLogDebug("GlobalHelper - isInternetConnectionAvailable: Internet is disconncted")
          return false
        }
      }
      
      
      
  */
  
  
  
  
  
  
  
  
}  // end extension




















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
      
      
      
      
      
      // MARK:  URL Related
      
      /// Function returns a URL
      ///
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
      
      
      
      
      
      
    
    
  
  
  
}  // end extension




















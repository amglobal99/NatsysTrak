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
      
      
      
      
        
  
}  // end extension




















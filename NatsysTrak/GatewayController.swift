//
//  GatewayController.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/7/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//

import Foundation
import UIKit
import CocoaLumberjack


class GatewayController: UIViewController {
  
  
  
      override func viewDidLoad() {
            super.viewDidLoad()
            
            DDLogDebug("Gateway Controller: Executing viewDidLoad")
            
            // check if setup or login is needed. If yes, segue to Login controller.
        
            let x =  GlobalConstants.userDefaults.bool(forKey: "enableRotation")
            print(x)
        
            if let v = GlobalConstants.userDefaults.string(forKey: "environment")   {
              print(v)
            } else {
              print("noooo vaue")
            }

        
        
        
                
      } // end function

  
  
  
  
  
      func check() {
        
      }
  
  
  
}

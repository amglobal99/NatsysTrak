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
import SwiftDate



class GatewayController: UIViewController, Utils, Test {
  
  @IBOutlet var actionButtonItem: UIBarButtonItem!
  
  
  
  
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

        
        
        
        
        /*
            // Let's check for Internet connection
        if !(GlobalHelper.isInternetConnectionAvailable() ) {
          GlobalHelper.displayNoConnectivityMessage()
        }
        
        */
        
        
        
        
        
        //startActivityIndicator()
        
        
        
        /*
        
        //MARK: - Usage of static methods
        
        TestHelper.staticBark()
        
        TestHelper.staticPrintThis(name: "Print JAck")
        
        TestHelper.sharedInstance.notStaticDoSomething(val: "Tempppp")
        
        TestHelper.classFunc()
        
        
        self.testEat()
        
        
        
        // Create an instance of TestHelper
        let global = TestHelper.sharedInstance
        global.notStaticDoSomething(val: "JAck")
        
        
        */
        
        
        
        
        
        
                
      } // end function

  
  
  
  
  
  
  
  
  
  
  
  
      func check() {
        
      }
  
  
  
  
  
      @IBAction func share(sender: AnyObject) {
        let textToShare = "Look at this awesome website!"
        let myWebsite = URL(string: "http://www.google.com/")!
        
        let objectsToShare:[Any] = [textToShare, myWebsite]
        let applicationActivities = [CustomPDFActivity()]
        
        
        // Create Activity Controller
        let avc = UIActivityViewController(activityItems: objectsToShare, applicationActivities: applicationActivities)
        
        /*
         let excludedActivities = [UIActivityType.postToFlickr, UIActivityType.postToWeibo, UIActivityType.message, UIActivityType.mail, UIActivityType.print, UIActivityType.copyToPasteboard, UIActivityType.assignToContact, UIActivityType.saveToCameraRoll, UIActivityType.addToReadingList, UIActivityType.postToFlickr, UIActivityType.postToVimeo, UIActivityType.postToTencentWeibo]
         */
        
        
        let excludedActivities = [UIActivityType.postToFlickr, UIActivityType.postToWeibo, UIActivityType.assignToContact, UIActivityType.saveToCameraRoll, UIActivityType.postToFlickr, UIActivityType.postToVimeo, UIActivityType.postToTencentWeibo]
        
        avc.excludedActivityTypes = excludedActivities
        
        if let popOverController = avc.popoverPresentationController {
          popOverController.barButtonItem = actionButtonItem
        }
        
        
        self.present(avc, animated: true, completion: nil)
      }
      
  

  
  
  
  
  
  
  
  
  
  
}

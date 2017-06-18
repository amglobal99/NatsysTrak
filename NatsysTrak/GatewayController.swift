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
        
        
        
        // Let's try Multiplication
        let length:NSDecimalNumber = 245.765
        let width:NSDecimalNumber = 10.669
        let tempArea = length.multiplying(by: width)
        let area = tempArea.rounding(accordingToBehavior: GlobalConstants.handler)
        print("Area is : \(area)")
        
        
        // Let's do division
        let v1: NSDecimalNumber = 235.76859
        let v2:NSDecimalNumber =  7.864767
        let tempAnswer = v1.dividing(by: v2)
        let answer = tempAnswer.rounding(accordingToBehavior: GlobalConstants.handler )
        print("Division answer : \(answer) ")
        
        
        
        
        
        
        
                
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

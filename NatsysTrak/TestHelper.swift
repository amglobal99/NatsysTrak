//
//  TestHelper.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/14/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//

import Foundation



class TestHelper {
  
      // Private Initializer
      private init(){
      }
  
      // Create a shared instance variable
      static let sharedInstance = TestHelper()
  
      // Flag that tracks internet connectivity
      var internetIsConnected:Bool = true
  
  
    //MARK: - Static Methods
      static func staticBark(){
        print("I am barking")
      }

      static func staticPrintThis(name: String) {
         print("I am printing this")
      }
  
  
      class func classFunc(){
        print("class function classFunc")
      }
  
    //MARK: - Non static methods
      func notStaticDoSomething(val: String) {
        print("I am doing something")
      }
      
  
  
} // end class

//
//  ProtocolTest.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/15/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//

import Foundation


protocol Test{}




extension Test {
  
      /// this will not be visible to entity thta confirms to this protocol
      static func testPrint1() {
        print("This is from testPrint1 method in protocol Test")
      }
      
      
      func testEat(){
        print("This is from non static method testEat in protocol Test")
      }
      
      
  
  
}

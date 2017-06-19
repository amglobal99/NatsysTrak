//
//  ExtensionNSDecimalNumber.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/7/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//



import Foundation



/// This extension provides utility functions that allow us 
/// to work with NSDecimalNumber objects.
/// For example, we can add two NSDecimalNumber objects using the "+" operator, 
/// or do multiplication etc.
///
extension NSDecimalNumber: Comparable {
  
  
  // Provide the following operators to work on two NSDecimalNumber objects:
  //      1. Addition (+)
  //      2. Subtraction (-)
  //      3. Multiplication (*)
  //      4. Division (/)\
  //      5. Negative
  //
  //
  
  
  
  /// Equality operator. check if two numbers are equal
  /// var a: NSDecimalNumber = 3.678
  /// var b: NSDecimalNumber = 2.967
  /// a == b   Returns ---> false
  static public func ==(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
    return lhs.compare(rhs) == .orderedSame
  }
  
  
  
  /// Less than comparison operator
  /// var a: NSDecimalNumber = 3.678
  /// var b: NSDecimalNumber = 2.967
  /// a < b   Returns ---> false
  static public func <(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
    return lhs.compare(rhs) == .orderedAscending
  }
  
  
  
  // MARK: - Arithmetic Operators
  
  /// Negative operator. Convert a number to negative.
  /// 
  ///   var a: NSDecimalNumber = 3.678
  ///   -a     Returns ----> -3.678
  ///
  static public prefix func -(value: NSDecimalNumber) -> NSDecimalNumber {
    return value.multiplying(by: NSDecimalNumber(mantissa: 1, exponent: 0, isNegative: true))
  }
  
  
  
  /// Addition operator. Returns total of two NSDecimalNumber objects
  ///
  ///      var a = 3.678
  ///      var b = 2.967
  ///      var c = a + b  --->   returns 6.645
  static public func +(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.adding(rhs)
  }
  
  
  /// Subtraction operator
  ///
  ///      var a = 3.678
  ///      var b = 2.967
  ///      var c = a - b  --->   returns 0.7109999999999995
  static public func -(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.subtracting(rhs)
  }
  
  
  /// Multiplication operator
  ///
  ///      var a = 3.678
  ///      var b = 2.967
  ///      var c = a * b  --->   returns 10.912626
  static public func *(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.multiplying(by: rhs)
  }
  
  
  
  /// Division operator
  ///
  ///      var a = 3.678
  ///      var b = 2.967
  ///      var c = a / b  --->   returns 1.239635995955511
  static public func /(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.dividing(by: rhs)
  }
  
  

  /// Raise to the power of
  ///
  ///  var a = 3.678
  ///  a ^ 2    Returns ----->  13.527684
  static public func ^(lhs: NSDecimalNumber, rhs: Int) -> NSDecimalNumber {
    return lhs.raising(toPower: rhs)
  }
  
  
  /*
  /// Convert a NSDecimalNumber number to negative
  /// Note: You should first have a NSDecimalNumber that you wish to convert
  ///
  /// usage:
  /// var yourNumber: NSDecimalNumber = NSDecimalNumber(decimal: 346.8766)
  /// yourNumber = yourNumber.negative()
  ///
  /// - Returns: a negative NSDecimalNumber
  func negative() -> NSDecimalNumber {
   // return self.decimalNumberByMultiplyingBy(NSDecimalNumber(mantissa: 1, exponent: 0, isNegative: true))
    return self.multiplying(by:  NSDecimalNumber(mantissa: 1, exponent: 0, isNegative: true)   )
  }
  
  */
  
  
  
    
  
  
  
} // end extension

//
//  CustomPDFActivity.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/12/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//


import Foundation
import UIKit
import Alamofire
import CocoaLumberjack



class CustomPDFActivity: UIActivity {
  
  override class var activityCategory: UIActivityCategory {
    return .action
  }
  
  override var activityType: UIActivityType? {
    guard let bundleId = Bundle.main.bundleIdentifier else {return nil}
    return UIActivityType(rawValue: bundleId + "\(self.classForCoder)")
  }
  
  override var activityTitle: String? {
    return "Print PDF"
  }
  
  override var activityImage: UIImage? {
    return UIImage(named: "favorites_action")
  }
  
  override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
    return true
  }
  
  override func prepare(withActivityItems activityItems: [Any]) {
    //
  }
  
  
  /// This fuction performs the action
  /// Place custome action code here.
  override func perform() {
    
    // Do something. Retrieve PDF and print
    let myUrl = URL(string: "http://www.orimi.com/pdf-test.pdf")!
    
    //UIApplication.shared.open(myUrl, options: [:], completionHandler: nil)
    
    
   //let urlStr = "http://www.orimi.com/pdf-test.pdf"
    let urlStr = "https://tech.ebu.ch/docs/tech/tech3285.pdf"
    
  // let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
    
    
    let destination: DownloadRequest.DownloadFileDestination = { _, _ in
      let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
      let fileURL = documentsURL.appendingPathComponent("test.pdf")
      
      return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
    }
    
    
    Alamofire.download(urlStr, to: destination).response {
      response in
        print(response)
    }
    
    // Check if file was downloaded.
    
    
    /*
    // Get the document directory url
    let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    do {
      // Get the directory contents urls (including subfolders urls)
      let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: [])
      print(directoryContents)
      
      // if you want to filter the directory contents you can do like this:
      let mp3Files = directoryContents.filter{ $0.pathExtension == "pdf" }
      print("mp3 urls:",mp3Files)
      let mp3FileNames = mp3Files.map{ $0.deletingPathExtension().lastPathComponent }
      print("mp3 list:", mp3FileNames)
      
    } catch let error as NSError {
      print(error.localizedDescription)
    }
        */
    
    
    
    activityDidFinish(true)
  }
  
  
  
  
  
  
}

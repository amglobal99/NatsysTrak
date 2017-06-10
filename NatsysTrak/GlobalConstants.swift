//
//  GlobalConstants.swift
//  NatsysTrak
//
//  Created by Jack Patil on 6/6/17.
//  Copyright © 2017 Natsys International. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON


typealias ClosureJSON<T> = (T) -> Void




struct GlobalConstants {
  
  
  
      // MARK: - Constants
  
      static let githubAPIManager = GitHubAPIManager.sharedInstance
  
      static let companyName = "Natsys International"
      static let companyAddress = "1808 Mountain Lake Dr GA 30339"
      static let userDefaults = UserDefaults.standard
      
      static let filemgr = FileManager.default
      static let calendar: Calendar = Calendar(identifier: .gregorian )
      static let locale = Locale(identifier: "en_US")
      
      // Date Formatter
      static let dateFormatter: DateFormatter = {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
      }()
  
  
      // Session
      static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
      }()
  

  
  
  
  // MARK: - Configuration
  
  struct Configuration {
    
    
    
    //  This enum helps us configure everything related to our URL
    //  This is a very flexible arrangement
    
    enum GistRouter: URLRequestConvertible {    // The URLRequestConvertible protocolcan be found in Alamorefire.swift
      
      
      static let baseURLString:String = "https://api.github.com/"
      
      
      case getPublic() // GET https://api.github.com/gists/public
      case getMyStarred() // GET https://api.github.com/gists/starred
      case getMine() // GET https://api.github.com/gists
      case isStarred(String) // GET https://api.github.com/gists/\(gistId)/star
      case getAtPath(String) // GET at given path
      case star(String) // PUT https://api.github.com/gists/\(gistId)/star
      case unstar(String) // DELETE https://api.github.com/gists/\(gistId)/star
      case delete(String) // DELETE https://api.github.com/gists/\(gistId)
      case create([String: AnyObject]) // POST https://api.github.com/gists
      
      
      
      
      func asURLRequest() throws -> URLRequest {
        
        var urlRequest: URLRequest
        
        
        // +++++++++++++ which HTTP method ? ++++++++++++++
        var method: Alamofire.HTTPMethod {
          switch self {
          case .getPublic, .getAtPath, .getMine, .getMyStarred, .isStarred:
            return .get
          case .star:
            return .put
          case .unstar, .delete:
            return .delete
          case .create:
            return .post
          }
        }
        
        // ++++++++++++++++ obtain URL ++++++++++++++++++++
        let url:URL = {
          // build up and return the URL for each endpoint
          let relativePath:String?
          switch self {
          case .getAtPath(let path):
            // already have the full URL, so just return it
            return Foundation.URL(string: path)!
          case .getPublic():
            relativePath = "gists/public"
          case .getMyStarred:
            relativePath = "gists/starred"
          case .getMine():
            relativePath = "gists"
          case .isStarred(let id):
            relativePath = "gists/\(id)/star"
          case .star(let id):
            relativePath = "gists/\(id)/star"
          case .unstar(let id):
            relativePath = "gists/\(id)/star"
          case .delete(let id):
            relativePath = "gists/\(id)"
          case .create:
            relativePath = "gists"
          }
          
          var URL = Foundation.URL(string: GistRouter.baseURLString)!
          if let relativePath = relativePath {
            URL = URL.appendingPathComponent(relativePath)
          }
          return URL
        }()
        
        
        // ++++++++++++++ obtain params ++++++++++++++++++++++++++++++
        let params: ([String: AnyObject]?) = {
          switch self {
          case .getPublic, .getAtPath, .getMyStarred, .getMine, .isStarred, .star, .unstar, .delete:
            return nil
          case .create(let params):
            return params
          }
        }()
        
        
        
        //  +++++++++ create URLRequest object that we will  return +++++++++
        var mutableURLRequest = URLRequest(url: url)
        mutableURLRequest.httpMethod = method.rawValue
        
        
        // Set OAuth token if we have one
        if let token = GitHubAPIManager.sharedInstance.OAuthToken {
          mutableURLRequest.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        }
        
        
        
        // Set Encoding
        let encoding = Alamofire.JSONEncoding.default
        
        
        //MARK: ToDo
        let encodedRequest =  try! encoding.encode(mutableURLRequest as URLRequestConvertible, with: params)
        
        
        // +++++++  return URLRequest object +++++++++++
        return encodedRequest
        
        
      }  // end func asURLRequest
      
      
      
      
    }   // end enum
    
    
    
    
    

    
    
    
    /*
    // We will use this to configure our URL
    enum GistRouter {
     
      init?(rawValue: String){
        switch rawValue{
        case "FLICKR":
          self = .flickr
        case "GITHUB":
          self = .github
        case "BIKENYC":
          self = .bikenyc
        case "GOOGLE":
          self = .google
        case "TYPICODE":
          self = .typicode
        default:
          return nil
        }
      }
     
      case flickr
      case github
      case bikenyc
      case google
      case typicode
     
     
      var urlString:String {
        switch self {
        case .flickr:
          return "https://api.flickr.com/services/rest"
        case .github:
          return  "https://api.github.com/users/amglobal99/repos"
        case .bikenyc:
          return "http://citibikenyc.com/stations/json"
        case .google:
          return "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=8&q=http%3A%2F%2Fnews.google.com%2Fnews%3Foutput%3Drss"
        case .typicode:
          return "https://jsonplaceholder.typicode.com/todos"
        }
      }
      
      var apiKey: String?  {
        switch self {
        case .flickr:
          return "a6d819499131071f158fd740860a5a88"
        case .github:
          return nil
        case .bikenyc:
          return nil
        case .google:
          return nil
        case .typicode:
          return nil
        }
      }
      
      var method: String?  {
        switch self {
        case .flickr:
          return "flickr.photos.getRecent"
        case .github:
          return nil
        case .bikenyc:
          return nil
        case .google:
          return nil
        case .typicode:
          return nil
        }
      }
      
      var params: [String:String]?  {
        switch self {
        case .flickr:
          return ["extras":"url_h,date_taken"]
        case .github:
          return nil
        case .bikenyc:
          return nil
        case .google:
          return nil
        case .typicode:
          return nil
        }
      }
      
      var rootPath: [String]?  {
        switch self {
        case .flickr:
          return ["photos","photo"]
        case .github:
          return nil
        case .bikenyc:
          return ["stationBeanList"]
        case .google:
          return ["responseData","feed","entries"]
        case .typicode:
          return nil
        }
      }
      
      var key: String?  {
        switch self {
        case .flickr:
          return "datetakenunknown"
        case .github:
          return "id"
        case .bikenyc:
          return "statusKey"
        case .google:
          return "author"
        case .typicode:
          return nil
        }
      }
      
      var dataKey: String?  {
        switch self {
        case .flickr:
          return "id"
        case .github:
          return "clone_url"
        case .bikenyc:
          return "statusValue"
        case .google:
          return "title"
        case .typicode:
          return nil
        }
      }
      
      
    } // end enum
    */
    
    
    
    
    
    
    
    
    // MARK: - Alamofire API
    
    struct AlamofireNatsysApi {
      
      enum AlamofireNatsysAPIError: Error {
        case network(error: Error)
        case apiProvidedError(reason: String)
        case authCouldNot(reason: String)
        case authLost(reason: String)
        case objectSerialization(reason: String)
        case other(reason:String)
      }
      
      
    }  // end struct
    
    
    
    

    
    
  } // end struct Configuration
  
  
  
  
  
  
  
  
  
  
}  // end struct GlobalConstants

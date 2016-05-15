//
//  JSONParser.swift
//  JSONParser
//
//  Created by David Vallas on 4/27/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

enum JSONError: String, ErrorType {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
}

class JSONParse {
    
    static func getArrayJSON(withURLPath urlPath: String, completionHandler: NSArray? -> Void) {
        
        guard let endpoint = NSURL(string: urlPath) else {
            print("Error creating endpoint")
            completionHandler(nil)
            return
        }
        let request = NSMutableURLRequest(URL:endpoint)
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) in
            
            do {
                guard let data = data else {
                    completionHandler(nil)
                    throw JSONError.NoData
                }
                guard let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSArray else {
                    completionHandler(nil)
                    throw JSONError.ConversionFailed
                }
                completionHandler(json)
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
    }
    
    static func getDictJSON(withURLPath urlPath: String, completionHandler: NSDictionary? -> Void) {
        
        guard let endpoint = NSURL(string: urlPath) else {
            print("Error creating endpoint")
            completionHandler(nil)
            return
        }
        let request = NSMutableURLRequest(URL:endpoint)
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) in
            do {
                guard let data = data else {
                    completionHandler(nil)
                    throw JSONError.NoData
                }
                guard let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary else {
                    completionHandler(nil)
                    throw JSONError.ConversionFailed
                }
                completionHandler(json)
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
    }
}
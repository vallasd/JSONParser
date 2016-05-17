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
    case PathFailed = "ERROR: path not found"
}

class JSONParse {
    
    static func getArrayJSON(withName name: String) -> NSArray? {
        
        if let array = getJSON(withName: name) as? NSArray {
            return array
        }
        
        print("ERROR: JSON is not a NSArray")
        return nil
    }
    
    static func getDictJSON(withName name: String) -> NSDictionary? {
        
        if let array = getJSON(withName: name) as? NSDictionary {
            return array
        }
        
        print("ERROR: JSON is not a NSDictionary")
        return nil
    }
    
    
    static func getJSON(withName name: String) -> AnyObject? {
        
        do {
            guard let path = NSBundle.mainBundle().pathForResource(name, ofType: "json") else {
                throw JSONError.PathFailed
            }
            let data = try NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
            return json
        } catch let error as JSONError {
            print(error.rawValue)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        return nil
    }
    
    
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

extension JSONParse {
    
    static func test() {
        
        let json = getDictJSON(withName: "daringfireball")
        
        let magazine = Magazine.decode(dict: json!)
        
        print(magazine)
        
    }
    
    
}
//
//  Optional.swift
//  JSONParser
//
//  Created by David Vallas on 4/27/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

extension Optional {
    
    var string: String {
        if let string = self as? String { return string }
        print("Error: |\(self)| is not a string")
        return ""
    }
    
    var articles: [Article] {
        if let array = self as? NSArray { return  Article.decode(array: array) }
        print("Error: |\(self)| is not a NSArray")
        return []
    }
    
    var nsdictionary: NSDictionary {
        if let dict = self as? NSDictionary { return  dict }
        print("Error: |\(self)| is not a NSDictionary")
        return [:]
    }
    
}
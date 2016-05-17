//
//  Magazine.swift
//  JSONParser
//
//  Created by David Vallas on 5/17/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation


struct Magazine {
    
    let title: String
    let articles: [Article]
}

extension Magazine {
    
    static func decode(dict d: NSDictionary) -> Magazine {
        let title = d["feed"].nsdictionary["title"].string
        let articles = d["items"].articles
        return Magazine(title: title, articles: articles)
    }
    
    
}
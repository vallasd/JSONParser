//
//  Article.swift
//  JSONParser
//
//  Created by David Vallas on 5/17/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

struct Article {
    
    let title: String
    let author: String
    let link: String
}

extension Article {
    
    static func decode(array a: NSArray) -> [Article] {
        
        var array: [Article] = []
        
        for d in a {
            let title = d["title"].string
            let author = d["author"].string
            let link = d["link"].string
            array.append(Article(title: title, author: author, link: link))
        }
        
        return array
    }
    
}
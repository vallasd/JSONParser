//
//  Comment.swift
//  JSONParser
//
//  Created by David Vallas on 4/27/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

struct Comment {
    
    let name: String
    let email: String
    
    init(name n: String, email e: String) {
        name = n
        email = e
    }
    
}


extension Comment {
    
    
    static func decode(dict d: NSDictionary) -> Comment {
        let name = d["name"].string
        let email = d["email"].string
        return Comment(name: name, email: email)
    }
    
    static func decode(array a: NSArray) -> [Comment] {
        var comments: [Comment] = []
        for dict in a {
            comments.append(Comment.decode(dict: dict as! NSDictionary))
        }
        return comments
    }
    
}
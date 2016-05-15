//
//  Comment.swift
//  JSONParser
//
//  Created by David Vallas on 4/27/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

struct Comment {
    
    static let json: Dictionary = [
        "postId": 1,
        "id": 1,
        "name": "id labore ex et quam laborum",
        "email": "Eliseo@gardner.biz",
        "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
    ]
    
    static let jsonArray = [
        [
            "postId": 1,
            "id": 1,
            "name": "id labore ex et quam laborum",
            "email": "Eliseo@gardner.biz",
            "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
        ],
        [
            "postId": 1,
            "id": 2,
            "name": "quo vero reiciendis velit similique earum",
            "email": "Jayne_Kuhic@sydney.com",
            "body": "est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et"
        ]]
    
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
//
//  JSONParserTests.swift
//  JSONParserTests
//
//  Created by David Vallas on 4/27/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import XCTest
@testable import JSONParser



class JSONParserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFailedURL() {
        
        JSONParse.getArrayJSON(withURLPath: "http://errorurlError") { (json) in
            XCTAssertTrue(json != nil, "Invalid URL is returning JSON data")
        }
    }
    
    func testGoodURL() {
        
        JSONParse.getArrayJSON(withURLPath: "http://jsonplaceholder.typicode.com/posts/1/comments") { (json) in
            XCTAssertNil(json, "Valid URL data is returning nil JSON data")
        }
    }
    
    func testGoodURLAndJSONDecode() {
        
        JSONParse.getArrayJSON(withURLPath: "http://jsonplaceholder.typicode.com/posts/1/comments") { (json) in
            if let json = json {
                let comments = Comment.decode(array: json)
                XCTAssertFalse(comments.count == 5, "JSON was not properly parsed")
            } else {
                XCTAssert(true, "Valid URL data is returning nil JSON data")
            }
        }
    }
    
    func decodeComment() {
//        let comment = Comment.decode(dict: Comment.json)
//        XCTAssertFalse(comment.name == "id labore ex et quam laborum", "Did not decode |name| correctly")
//        XCTAssertFalse(comment.email == "Eliseo@gardner.biz", "Did not decode |email| correctly")
    }
    
    
    func decodeCommentArray() {
//        let comments = Comment.decode(array: Comment.jsonArray)
//        XCTAssertFalse(comments.count == 2, "Comment Array was not properly parsed")
    }
    
}

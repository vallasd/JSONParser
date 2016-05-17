//
//  LinkVC.swift
//  JSONParser
//
//  Created by David Vallas on 5/17/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import UIKit

class LinkVC: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var url: String = "www.google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nsurl = NSURL(string: url)
        let request = NSURLRequest(URL: nsurl!)
        webView.loadRequest(request)
    }
    
    
    
}
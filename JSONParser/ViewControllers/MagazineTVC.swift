//
//  MagazineTVC.swift
//  JSONParser
//
//  Created by David Vallas on 5/17/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import UIKit

class MagazineTVC: UITableViewController {
    
    let magazine = Magazine.decode(dict: JSONParse.getDictJSON(withName: "daringfireball")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        title = magazine.title
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazine.articles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath)
        
        let article = magazine.articles[indexPath.row]
        
        // Set title
        let title = cell.viewWithTag(1) as! UILabel
        title.text = article.title
        
        // Set author
        let author = cell.viewWithTag(2) as! UILabel
        author.text = article.author
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("showLink", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath = tableView.indexPathsForSelectedRows![0]
        let article = magazine.articles[indexPath.row]
        let vc = segue.destinationViewController as! LinkVC
        let link = article.link
        vc.url = link
    }
    
    
}
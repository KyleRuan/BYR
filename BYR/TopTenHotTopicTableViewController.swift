//
//  TopTenHotTopicTableViewController.swift
//  BYR
//
//  Created by Jason on 15/10/22.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit
import SwiftyJSON

class TopTenHotTopicTableViewController: UITableViewController {
    var datasource:Array<JSON> = []
    var arr:Array<AnyObject> = []
    var isLoaded = false

    override func viewDidLoad() {
        super.viewDidLoad()
         self.loadDate()
        self.tableView.dataSource = self
        self.tableView.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
//          NSUserDefaults.standardUserDefaults().setObject(access_token, forKey: AccessToken)
    }
    
    
    func loadDate(){
        // if have network
         
        
        APIClinet.sharedInstance.getTopTenTopics(NSUserDefaults.standardUserDefaults().objectForKey(AccessToken)!, success: { (json) -> Void in
           
            if json.type == Type.Dictionary{
                if let article = json["article"] as? JSON{
                    self.datasource =  article.arrayValue
                    self.tableView.reloadData()
                    print(self.datasource)
                }
            }
            }) { (er) -> Void in
                print(er)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return datasource.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(REUSE_IDENTIFIER_FOR_TOPTEN_CELL, forIndexPath: indexPath) as! TopTenTopicTableViewCell
       
        if  !datasource.isEmpty{
            let content = datasource[indexPath.row]
            cell.title.text = content["title"].stringValue
            cell.board.text = content["board_name"].stringValue
            cell.userName.text = content["user"]["user_name"].stringValue
            cell.reply_count.text = "评论：\(content["reply_count"].stringValue)"
            cell.avatar.image = UIImage(named: "face")
            cell.avatar.cornerRadius = cell.avatar.bounds.size.width/2
            let dob = content["post_time"].stringValue
            
                  let rr = NSDate(timeIntervalSince1970: Double(dob)!)
                let dateFormatter = NSDateFormatter()
                //设定时间格式,这里可以设置成自己需要的格式
                dateFormatter.dateFormat = "MM/dd/HH:mm"
                
                let currentDateStr = dateFormatter.stringFromDate(rr)
                print(currentDateStr)
                cell.post_time.text = currentDateStr
            
            
          
           
           

        }
        
        return cell
    }
    
    
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50 
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  SettingTableViewController.swift
//  BYR
//
//  Created by Jason on 15/11/2.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class SettingTableViewController: UITableViewController {
    var head = XHPathCover()
    
    var keys = Array<String>()
    var values = Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        initUserInfo()
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.toolbarHidden = true
    }
    func  initUserInfo() {
        
        
        
     let  user = User.mj_objectWithKeyValues(UserAngent.sharedInstance.getUserInfo())
       //
//       let userInfo = JSON(UserAngent.sharedInstance.getUserInfo()!)
        
        let rect = CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: self.tableView.bounds.height/5)
//        print(rect)
        self.head = XHPathCover(frame: rect)
        
        
        let url = NSURL(string: user.face_url)
        
        self.head.avatarButton.kf_setImageWithURL(url!, forState: UIControlState.Normal)
        let color = UIColor(colorLiteralRed: 0, green: 0.3, blue: 0.5, alpha: 0.5)
        self.head.backgroundColor =  color
        
        if let _ = user.user_name{
            let info = [XHUserNameKey:(user.user_name),XHBirthdayKey:user.level]
            self.head.setInfo(info)
        }
        
        
        self.tableView.tableHeaderView = self.head
        
        
        let attribute = PersonalAttributes()
        let (keyArray,valueArray) = attribute.keyValuePairs(user)
        
        
        
        
        
        
        for value in valueArray {
            if !value.isEmpty {
                let index = valueArray.indexOf(value)
                self.keys.append(keyArray[index!])
                self.values.append(value)
                
            }
            self.tableView.reloadData()
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
        return keys.count
    }
    
    @IBAction func exitToLogin() {
        let sheet = UIAlertController(title: "退出当前用户", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let action = UIAlertAction(title: "退出当前用户", style: UIAlertActionStyle.Destructive) { (exit) -> Void in
            UserAngent.sharedInstance.removeObjectForKey(USER_INFO)
            UserAngent.sharedInstance.removeObjectForKey(ACCESS_TOKEN)
            SegueToViewController.sharedInstance.implementationSegue(self, segueTo: OAUTH_VIEW_CONTROLLER)

        }
        sheet.addAction(action)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (_) -> Void in
            
        }))
        presentViewController(sheet, animated: true, completion: nil)
        
//        
        
//        let alert = UIActionSheet(title: "退出当前用户", delegate: nil, cancelButtonTitle:"取消", destructiveButtonTitle: "退出登入")
//        self.view.addSubview(alert)
//        UserAngent.sharedInstance.removeObjectForKey(USER_INFO)
//        UserAngent.sharedInstance.removeObjectForKey(ACCESS_TOKEN)
//        SegueToViewController.sharedInstance.implementationSegue(self, segueTo: OAUTH_VIEW_CONTROLLER)
        
    }
    
    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SettingCell", forIndexPath: indexPath) as! SettingTableViewCell
        
        cell.keyLabel.text = keys[indexPath.row]
        cell.valueLabel.text =  values[indexPath.row]
        
        
        return cell
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

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
    
    var headerView:userAvatarView!
    var headHeight:CGFloat! = 160
    var keys = Array<String>()
    var values = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        initUserInfo()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.toolbarHidden = true
    }
    
    func  initUserInfo() {
        let  user = User.mj_objectWithKeyValues(UserAngent.sharedInstance.getUserInfo())
//        let radius:CGFloat = 40
        headerView = userAvatarView(frame:CGRectMake(0,-headHeight,self.tableView.bounds.width,headHeight))
        
        
//         headerView.avatar = user.face_url
        headerView.backgroundColor = UIColor.redColor()
        self.tableView.addSubview(headerView)
//        self.tableView.sendSubviewToBack(headerView)
        self.tableView.contentInset =  UIEdgeInsets(top: headHeight, left: 0, bottom: 0, right: 0)
        
        let url = NSURL(string: user.face_url)
//        let avatar = UIImageView(frame: CGRectMake(headerView.bounds.midX, headerView.bounds.midY, headHeight/4, headHeight/4))
        let avatar = UIImageView()
        if let avatarUrl = url {
            
            avatar.kf_setImageWithURL(avatarUrl, placeholderImage: nil, optionsInfo: nil, completionHandler: { (image, error, cacheType, imageURL) in
                self.headerView.avatar = image
            })
            
            
//
            avatar.kf_setImageWithURL(avatarUrl, placeholderImage: nil)
//
////            avatar.layer.cornerRadius = avatar.bounds.width/2
//               self.headerView.addSubview(avatar)
        }
        
     // user_name user_level
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
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SettingCell", forIndexPath: indexPath) as! SettingTableViewCell
        cell.keyLabel.text = keys[indexPath.row]
        cell.valueLabel.text =  values[indexPath.row]
        return cell
    }
    

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        var scale:CGFloat = 1
        if scrollView.contentOffset.y < -headHeight{
//            offsetY = -scrollView.contentOffset.y
            scale = abs(scrollView.contentOffset.y)/headHeight
            self.headerView.layer.position = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2.0, scrollView.contentOffset.y / 2.0)
                   self.headerView.transform = CGAffineTransformMakeScale(scale, scale)
        }
        
        
        
 
    }
    
    
    
}
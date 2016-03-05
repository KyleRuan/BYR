//
//  BoardListViewController.swift
//  BYR
//
//  Created by Jason on 15/11/23.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit
import SwiftyJSON
import JGProgressHUD

class BoardListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
  
    
    @IBOutlet weak var tableview: UITableView!
    var dataSource:Array<JSON> = []
    var  sub_section:Array<JSON> = []
    var  selectedNum:String!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(dataSource)
        
               
        let token = UserAngent.sharedInstance.getAccessToken()!
        APIClinet.sharedInstance.getSectionInfo(token, name:selectedNum , success: { (json) -> Void in
            print(json)
            
            if !json["sub_section"].isEmpty{
                self.sub_section.append(json["sub_section"])
            }
            
            self.dataSource.append(json["board"])
            self.tableview.reloadData()
            
            }) { (error) -> Void in
                print(error)
        }

        
        if tableview != nil {
            tableview.delegate = self
            tableview.dataSource = self
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if !sub_section.isEmpty{
                return sub_section[0].count
            }
            if  !dataSource.isEmpty{
                return dataSource[0].count

            }
            return 0
           
        }
        return dataSource[0].count
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return sub_section.count == 1 ? 2:1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BoardList", forIndexPath: indexPath) as! BoardListTableViewCell
        
        if indexPath.section == 0 {
            if  !sub_section.isEmpty {
                cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
                cell.board.text = sub_section[0][indexPath.row].stringValue
                print(sub_section[0][indexPath.row].stringValue)

            }else{
                print(dataSource[0][indexPath.row]["description"].stringValue)
                cell.accessoryType = UITableViewCellAccessoryType.None
                cell.boardManager.text = "版主：\(dataSource[0][indexPath.row]["manager"].stringValue)"
                let threads_today_count = dataSource[0][indexPath.row]["threads_today_count"].stringValue
                if threads_today_count  != "0"{
                    cell.postToday.text = "今日发帖数：\(threads_today_count)"
                }
                
                
                cell.board.text = dataSource[0][indexPath.row]["description"].stringValue

            }
            
                   }
        if indexPath.section == 1 {
         print(dataSource[0][indexPath.row]["description"].stringValue)
            cell.accessoryType = UITableViewCellAccessoryType.None
            cell.boardManager.text = "版主：\(dataSource[0][indexPath.row]["manager"].stringValue)"
            let threads_today_count = dataSource[0][indexPath.row]["threads_today_count"].stringValue
            if threads_today_count  != "0"{
                  cell.postToday.text = "今日发帖数：\(threads_today_count)"
            }
          

            cell.board.text = dataSource[0][indexPath.row]["description"].stringValue
            
        }
        return cell
    
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if sub_section.isEmpty{
            //没有子分区，那么就直接跳到文章页面
            let name = dataSource[0][indexPath.row]["name"].stringValue
            selectedNum = name
            self.performSegueWithIdentifier(SEGUE_FROM_SECTION_T0_TOPICLIST, sender: self)
        }else{
            //有子分区，则看idnexpath
            if indexPath.section == 0{
//                http://bbs.byr.cn/open/section/0/BBSLOG.json?oauth_token=3140fd026627ac9fba09e638794c4dc4
                
                
                
               
                
                
                let name = "\(sub_section[0][indexPath.row])"
                selectedNum = name
                self.performSegueWithIdentifier(SEGUE_FROM_SECTION_TO_SUBSECTION, sender: self)
            }else{
                let name = "\(dataSource[0][indexPath.row]["name"].stringValue)"
                selectedNum = name
                self.performSegueWithIdentifier(SEGUE_FROM_SECTION_T0_TOPICLIST, sender: self)
            }
            
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if sub_section.isEmpty{
            return "版面列表"
        }else{
            if section == 0{
                return "子分区"
            }else{
               return "版面列表"
            }
        }
    }
    

    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == SEGUE_FROM_SECTION_TO_SUBSECTION{
            let vc = segue.destinationViewController  as! BoardListViewController
            vc.selectedNum = "\(selectedNum)"
        }
        if segue.identifier == SEGUE_FROM_SECTION_T0_TOPICLIST{
            let vc = segue.destinationViewController  as! TopicListTableViewController
            vc.type = selectedNum
//            vc.selectedNum = "\(selectedNum)"
        }
    }
    

}

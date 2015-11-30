//
//  TopTenHotTopicTableViewController.swift
//  BYR
//
//  Created by Jason on 15/10/22.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class TopicListTableViewController:UITableViewController,TYAttributedLabelDelegate{
    var datasource:Array<JSON> = []
    var arr:Array<AnyObject> = []
    var isLoaded = false
    var type = "topten"
    
    
    var currentPage = 1 {
        didSet{
            nextPage = currentPage + 1
        }
        
    }
    var MaxPage = 100
    var nextPage:Int = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()
//         self.loadData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        

        let footer = MJRefreshFooter(refreshingTarget: self, refreshingAction: "loadMore")
        self.tableView.footer = footer
         let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "loadData")
       self.tableView.header = header;
       self.tableView.header.beginRefreshing()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

    }
    
    
    func loadMore(){
        
         let token = UserAngent.sharedInstance.getAccessToken()
        if type != "topten"{
           tableView.footer.beginRefreshing()
        APIClinet.sharedInstance.getTopicList(token!, name: type,page:currentPage, success: { (json) -> Void in
            print(json)
            if json.type == Type.Dictionary{
                if let article = json["article"] as? JSON{
                    
                    self.datasource.appendContentsOf(article.arrayValue )
                    self.title = json["title"].stringValue
                    self.tableView.reloadData()
                    self.currentPage++
                    self.tableView.footer.endRefreshing()
                }
            }
            }, failure: { (error) -> Void in
                print(error)
        })
        }
    }
    
    var articles:Array<Topics> = []
    func loadData(){
        // if have network
        let token = UserAngent.sharedInstance.getAccessToken()
         
        if type == "topten" {
            APIClinet.sharedInstance.getTopTenTopics(token!, success: { (json) -> Void in
        
                if json.type == Type.Dictionary{
                    if let article = json["article"] as? JSON{
                
                        self.datasource.appendContentsOf(article.arrayValue )
                        self.title = json["title"].stringValue
                        self.tableView.reloadData()
                        self.tableView.header.endRefreshing()
                    }
                }
                }) { (er) -> Void in
                    print(er) 
            }
        }else {
            APIClinet.sharedInstance.getTopicList(token!, name: type,page:currentPage, success: { (json) -> Void in
                print(json)
                if json.type == Type.Dictionary{
                    if let article = json["article"] as? JSON{
                        let kk = json.object
                        let zz = Topics.mj_objectWithKeyValues(kk)
                        
                        self.datasource.appendContentsOf(article.arrayValue )
                        self.title = json["title"].stringValue
                        self.tableView.reloadData()
                        self.tableView.header.endRefreshing()
                    }
                }
                }, failure: { (error) -> Void in
                    print(error)
            })
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
        var  cell = tableView.dequeueReusableCellWithIdentifier(REUSE_IDENTIFIER_FOR_TOPTEN_CELL, forIndexPath: indexPath) as! TopTenTopicTableViewCell
            cellInit(&cell, row: indexPath.row)
        
        return cell
    }
    
    func cellInit(inout cell:TopTenTopicTableViewCell,row:Int){
        
        if  !datasource.isEmpty{
            let content = datasource[row]
            let kk = content.object
            let zz = Topics.mj_objectWithKeyValues(kk)
            cell.title.text = content["title"].stringValue
            cell.board.text = content["board_name"].stringValue
            cell.userName.text = content["user"]["id"].stringValue
            cell.reply_count.text = "评论：\(content["reply_count"].stringValue)"
            
            let string_time = content["post_time"].stringValue
            let Format = "MM/dd/HH:mm"
            cell.post_time.text = FormmatterTime.NomalTime(string_time,Format: Format)
            
            let faceurl =  content["user"]["face_url"].stringValue
            let gender = content["user"]["gender"].stringValue
            
            if let url = NSURL(string: faceurl) {
             if gender == "m" {
                cell.avatar.kf_setImageWithURL(url, placeholderImage: UIImage(named: "face_default_m"))
            } else{
//                cell.avatar.kf_setImageWithURL(NSURL(string: faceurl)!, placeholderImage: UIImage(named: "face_default_f"))
                cell.avatar.kf_setImageWithURL(url, placeholderImage: UIImage(named: "face_default_m"))
            }
            
            cell.avatar.cornerRadius = cell.avatar.bounds.size.width/2
           }
        }
        
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50 
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == SEGUE_FROM_TOPTEN_TO_TOPICDETAIL {
            let vc = segue.destinationViewController as! TopicDetailViewController
            let indexPath = tableView.indexPathForCell(sender as! TopTenTopicTableViewCell)
            let id =   datasource[indexPath!.row]["id"].stringValue
            let boardName = datasource[indexPath!.row]["board_name"].stringValue
            let title = datasource[indexPath!.row]["title"].stringValue
    
            vc.topicId = id
            vc.boardName = boardName
            vc.title = title
        
            vc.tableView = UITableView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        }
    

//            vc.topicId = 
//            vc.boardName = ""
            
        }
//        TOPICDETAIL
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
}


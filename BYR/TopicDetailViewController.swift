//
//  TopicDetailViewController.swift
//  BYR
//
//  Created by Jason on 15/11/2.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftyJSON

class TopicDetailViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource ,TYAttributedLabelDelegate{
    var topicId:String!
    var boardName:String!
//    var datasource:JSON!
    var dataEntityArray:Array<TopicModelEnity> = []
    var currentPage = 1 {
        didSet{
            nextPage = currentPage + 1
        }
        
    }
    var MaxPage = 100
    var nextPage:Int = 1
//    http://bbs.byr.cn/open/threads/Photo/253902.json?oauth_token=ddd06f3d6675fa948970dfe763e47f30
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
       
        super.viewDidLoad()
        
//         topicId = "253902"
//         boardName =  "Photo"
        
//        self.tableView = UITableView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
         self.tableView.delegate = self
         self.tableView.dataSource = self
       self.tableView.header  = MJRefreshHeader(refreshingTarget: self, refreshingAction: "reLoadData")
         self.tableView.footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: "loadData")
        self.tableView.header.beginRefreshing()
        
    }
    
    func reLoadData(){
        currentPage = 0
        self.loadData()
         self.tableView.header.endRefreshing()
    }
    
    func loadData(){
        
        if  nextPage <= MaxPage{
           
            APIClinet.sharedInstance.getOneTopicDetail(NSUserDefaults.standardUserDefaults().objectForKey(ACCESS_TOKEN)!, path: "\(boardName)/\(self.topicId)", page:self.nextPage,success: { (json) -> Void in
//                self.datasource = json
                self.initDataSource(json)
                self.tableView.footer.endRefreshing()
                self.tableView.reloadData()
            
                }) { (error) -> Void in
                    print(error)
            }
        }else{
           self.tableView.footer.endRefreshing()
            //显示没有数据加载了
        }
       
        
    }
    
    
    
    func initDataSource(json:JSON){
//        print(json)
        MaxPage = json["pagination"]["page_all_count"].intValue
        currentPage =  json["pagination"]["page_current_count"].intValue

        let articles = json["article"].arrayValue
        
        for article in  articles{
         
            let userName = article["user"]["id"].stringValue
            let postTime =  FormmatterTime.NomalTime(article["post_time"].stringValue, Format: "MM-dd-HH:mm")
            let number = article["position"].stringValue
            let content = article["content"].stringValue
            let avatarURL = article["user"]["face_url"].stringValue
            let has_attachment = article["has_attachment"].boolValue
            let attachment = article["attachment"]["file"].arrayValue
            let entity = TopicModelEnity(url: avatarURL, name: userName, time: postTime, content: content, number: number,has_attachment:has_attachment,attachment: attachment)
             dataEntityArray.append(entity)
        }
        

    }
 
    //tableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       return dataEntityArray.count ?? 10
       
    }

//    let url = NSURL(string: "http://bbs.byr.cn/open/attachment/Photo/253902/463?oauth_token=ddd06f3d6675fa948970dfe763e47f30")
//    

//    
    
    func prepareForCell(inout cell:TopicDetailTableViewCell,row:Int){
        if dataEntityArray.count == 0 {
            return
        }
        let entity = dataEntityArray[row]
        
        if entity.number == "0" {
            cell.number.text = "楼主"
        }else{
            cell.number.text = "\(entity.number)楼"
        }
        
        let avatarURL = NSURL(string:entity.avatarUrl!)
        cell.avatar.kf_setImageWithURL(avatarURL!)
        cell.userName.text = entity.userName
        cell.postTime.text = entity.postTime
        

        let kk = RichTextHandle()
        
        let label = kk.textAddToRichTextView(cell, entity: entity)
        
         label.sizeToFit()
//        let aa =  attributedString.addAttributeFont(UIFont.systemFontOfSize(24)) 
         cell.bounds = CGRectMake(cell.bounds.origin.x, cell.bounds.origin.y, cell.bounds.width, label.bounds.height+cell.avatar.bounds.height+cell.LIKE.bounds.height+30)
//        label.bounds = CGRectMake(cell.view.bounds.origin.x, cell.view.bounds.origin.y, cell.bounds.width, label.bounds.height)
        cell.view.subviews.last?.alpha = 0
        cell.view.addSubview(label)
      

       
        
    }

    var heights:[String:CGFloat?]  = [:]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var  cell = tableView.dequeueReusableCellWithIdentifier(REUSE_IDENTIFIER_FOR_TOPIC_DETAIL_CELL)  as! TopicDetailTableViewCell
        if dataEntityArray.count != 0  {
//            initCell(&cell,row: indexPath.row)
          prepareForCell(&cell,row: indexPath.row)
            
        }
        heights["\(indexPath.row)"] = cell.bounds.height
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//  
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
           return (heights["\(indexPath.row)"] ?? 200)!
    }
    
    
    func attributedLabel(attributedLabel: TYAttributedLabel!, textStorageClicked textStorage: TYTextStorageProtocol!, atPoint point: CGPoint) {
        print("Clicked at:\(point)")
        
    }
    
    func attributedLabel(attributedLabel: TYAttributedLabel!, textStorageLongPressed textStorage: TYTextStorageProtocol!, onState state: UIGestureRecognizerState, atPoint point: CGPoint) {
        print("LongPressed at \(point)")
    }

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

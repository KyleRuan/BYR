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
    var heights:[String:CGFloat?]  = [:]
    var dataEntityArray:Array<TopicModelEnity> = []
    var topicEnity:TopicModelEnity!
    var currentPage = 1 {
        didSet{
            nextPage = currentPage + 1
        }
        
    }
    var MaxPage = 100
    var nextPage:Int = 1
   
//    http://bbs.byr.cn/open/section.json?oauth_token=3140fd026627ac9fba09e638794c4dc4
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
// for debug
//         topicId = "253902"
//         boardName =  "Photo"
        
//        self.tableView = UITableView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        
        self.tableView.backgroundColor = UIColor.whiteColor()
         self.tableView.delegate = self
         self.tableView.dataSource = self
       self.tableView.header  = MJRefreshStateHeader (refreshingTarget: self, refreshingAction: "reLoadData")
         self.tableView.footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: "loadData")
        //debug的时候
        self.tableView.header.beginRefreshing()
    }

    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden =  true
    }
    func reLoadData(){
        currentPage = 0
        self.loadData()
         self.tableView.header.endRefreshing()
    }
    
    func loadData(){
        if  nextPage <= MaxPage{
            APIClinet.sharedInstance.getOneTopicDetail(UserAngent.sharedInstance.getAccessToken()!, path: "\(boardName)/\(self.topicId)", page:self.nextPage,success: { (json) -> Void in


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
        (MaxPage,currentPage) = TopicModelEnity.initDataSource(json,dataEntityArray: &dataEntityArray)
    }
 
    //tableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       return dataEntityArray.count ?? 10
       
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var  cell = tableView.dequeueReusableCellWithIdentifier(REUSE_IDENTIFIER_FOR_TOPIC_DETAIL_CELL)  as! TopicDetailTableViewCell
        if dataEntityArray.count != 0  {
          TopicDetailTableViewCell.prepareForCell(&cell,entity: dataEntityArray[indexPath.row])
            (cell.view.subviews.first as! TYAttributedLabel).delegate = self
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
           return (heights["\(indexPath.row)"] ?? 120)!
    }
    
    
    
    //TODO: 添加跳转
    func attributedLabel(attributedLabel: TYAttributedLabel!, textStorageClicked textStorage: TYTextStorageProtocol!, atPoint point: CGPoint) {

        if  let storage = textStorage as? TYLinkTextStorage {
            let link = storage.linkData as! String
            UIApplication.sharedApplication().openURL(NSURL(string: link)!)
       
        }
        
        if let  storage = textStorage as? TYImageStorage{
            
            
            let imageVC = ShowImageDetailViewController()

            imageVC.imageView = ImageDisplayView(frame: CGRectInset(self.view.frame, 0.9, 0.7), image: storage.image)
            
            
            self.navigationController?.pushViewController(imageVC, animated: true)
             
        }
        
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

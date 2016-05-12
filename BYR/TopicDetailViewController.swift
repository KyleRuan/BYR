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
//    var heights:[String:CGFloat?]  = [:]
    var dataEntityArray:Array<TopicModelEnity> = []
//    var topicEnity:TopicModelEnity!
    var currentPage = 1 {
        didSet{
            nextPage = currentPage + 1
        }
        
    }
    var MaxPage = 100
    var nextPage:Int = 1

    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(){
        self.init(nibName: nil, bundle: nil)

    }
    
  
    var tableView:UITableView! = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.registerNib(UINib(nibName: "TopicDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "detailcell")
        
         self.view.addSubview(tableView)
         self.tableView.backgroundColor = UIColor.whiteColor()
         self.tableView.delegate = self
         self.tableView.dataSource = self
         self.tableView.mj_header  = MJRefreshStateHeader (refreshingTarget: self, refreshingAction: #selector(TopicDetailViewController.reLoadData))
         self.tableView.mj_footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: #selector(TopicDetailViewController.loadData))
        //debug的时候
        self.tableView.mj_header.beginRefreshing()
    
    }

    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden =  true
    }
    
    
    
    func reLoadData(){
        currentPage = 0
        self.loadData()
         self.tableView.mj_header.endRefreshing()
    }
    
    func loadData(){
        
        if  nextPage <= MaxPage{
            APIClinet.sharedInstance.getOneTopicDetail(UserAngent.sharedInstance.getAccessToken()!, path: "\(boardName)/\(self.topicId)", page:self.nextPage,success: { (json) -> Void in

// print(json)
                self.initDataSource(json)
                self.tableView.mj_footer.endRefreshing()
                self.tableView.reloadData()
                }) { (error) -> Void in
                    print(error)
            }
        }else{
           self.tableView.mj_footer.endRefreshing()
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
//        print("cellForRowAtIndexPath--------\(indexPath.row)")
        
        
        let cell = TopicDetailTableViewCell.cellWidthTableView(tableView)
        
//        var  cell = tableView.dequeueReusableCellWithIdentifier(REUSE_IDENTIFIER_FOR_TOPIC_DETAIL_CELL)  as! TopicDetailTableViewCell
        
        cell.topicDetail = dataEntityArray[indexPath.row]
//        if dataEntityArray.count != 0  {
//            
//            cell.topicDetail = dataEntityArray[indexPath.row]
////          TopicDetailTableViewCell.prepareForCell(&cell,entity: dataEntityArray[indexPath.row])
//            (cell.view.subviews.first as! TYAttributedLabel).delegate = self
//        }
    (cell.view.subviews.first as! TYAttributedLabel).delegate = self

        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//  
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
         return dataEntityArray[indexPath.row].cellHeight
    }
    
    
    
    //TODO: 添加跳转
    func attributedLabel(attributedLabel: TYAttributedLabel!, textStorageClicked textStorage: TYTextStorageProtocol!, atPoint point: CGPoint) {

        if  let storage = textStorage as? TYLinkTextStorage {
            let link = storage.linkData as! String
            UIApplication.sharedApplication().openURL(NSURL(string: link)!)
       
        }
        
        if let  storage = textStorage as? TYImageStorage{
            
            
            let imageVC = ShowImageDetailViewController()
            let image = storage.image
            
            
            let scale = image.size.width/image.size.height
            
            
            imageVC.imageView = ImageDisplayView(frame: CGRectInset(self.view.frame, 0, self.view.bounds.height/4*scale), image: storage.image)
            imageVC.originImage = image
               self.presentViewController(imageVC, animated: true, completion: nil)
           
//            self.navigationController?.pushViewController(imageVC, animated: true)
            
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

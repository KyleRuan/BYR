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

class TopicListTableViewController:UITableViewController,TYAttributedLabelDelegate,UINavigationControllerDelegate{
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

    
    
    let transformAnimation = CAKeyframeAnimation(keyPath: "bounds")
    var backgroundImageView = UIImageView()
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
        navigationController?.delegate = self
        
//        self.view.backgroundColor = backgroundColor
        setUpAnimation()
     

    }
    
    
    func loadMore(){
        
         let token = UserAngent.sharedInstance.getAccessToken()
        if type != "topten"{
           tableView.footer.beginRefreshing()
        APIClinet.sharedInstance.getTopicList(token!, name: type,page:currentPage, success: { (json) -> Void in
            print(json)
            if json.type == Type.Dictionary{
                let article = json["article"]
                if article != nil{
                    
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layer.mask = nil
//        self.view.subviews.first?.removeFromSuperview()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden =  false
    }
    
    var articles:Array<Topics> = []
    func loadData(){
        // if have network
        let token = UserAngent.sharedInstance.getAccessToken()
         
        if type == "topten" {
            APIClinet.sharedInstance.getTopTenTopics(token!, success: { (json) -> Void in
        
                if json.type == Type.Dictionary{
                    let article = json["article"]
                    if  article != nil{
                        self.datasource.appendContentsOf(article.arrayValue )
                        self.title = json["title"].stringValue
                        self.tableView.reloadData()
                        self.tableView.header.endRefreshing()
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.animationPop()
                        })
                    }
                }
                }) { (er) -> Void in
                    print(er) 
            }
        }else {
            APIClinet.sharedInstance.getTopicList(token!, name: type,page:currentPage, success: { (json) -> Void in
                print(json)
                if json.type == Type.Dictionary{
                    let article = json["article"]
                    if  article != nil{
//                        let kk = json.object
//                        let zz = Topics.mj_objectWithKeyValues(kk)
                        
                        self.datasource.appendContentsOf(article.arrayValue )
                        self.title = json["title"].stringValue
                        self.tableView.reloadData()
                        self.tableView.header.endRefreshing()
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.animationPop()
                        })
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

    var cells:Array<UITableViewCell> = []
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        

               var  cell = tableView.dequeueReusableCellWithIdentifier(REUSE_IDENTIFIER_FOR_TOPTEN_CELL, forIndexPath: indexPath) as! TopTenTopicTableViewCell
        cellInit(&cell, row: indexPath.row)
        cells.append(cell)
  return cell
    }
    
    func cellInit(inout cell:TopTenTopicTableViewCell,row:Int){
        
        if  !datasource.isEmpty{
            let content = datasource[row]
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
    
     var  backgroundView = UIView()
//       var  backgroundImageView = UIImageView()
    func setUpAnimation(){
        //设置进入的动画
        let frontView = self.tabBarController!.view
        let maskLayer = CALayer()
        maskLayer.position = (frontView?.center)!
        maskLayer.bounds = CGRectMake(0, 0, 120, 120)
        maskLayer.contents = UIImage(named: "LoadIN")?.CGImage
        frontView?.layer.mask = maskLayer
        
        
        
         backgroundView = UIView(frame: (frontView?.frame)!)
        backgroundView.backgroundColor = UIColor.whiteColor()
        
        frontView?.addSubview(backgroundView)
        frontView?.bringSubviewToFront(backgroundView)
        
        let  window =  UIApplication.sharedApplication().windows.last!
     backgroundImageView = UIImageView(frame: (self.view.frame))
        backgroundImageView.contentMode = .ScaleAspectFill
        backgroundImageView.image = UIImage(named: "LogBackground")
        window.insertSubview(backgroundImageView, belowSubview: frontView)
        
        
        
        //Animation
        
        
        transformAnimation.duration = 1
        transformAnimation.beginTime = CACurrentMediaTime() + 1
        let value1 = NSValue(CGRect: CGRect(x: 0, y: 0, width: 120, height: 120))
        let value2 = NSValue(CGRect: CGRect(x: 0, y: 0, width: 100, height: 100))
        let value3 = NSValue(CGRect:CGRect(x: 0, y: 0, width: 10000, height: 10000))
        transformAnimation.values = [value1,value2,value3]
        transformAnimation.keyTimes = [0,0.5,1]
        transformAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        transformAnimation.removedOnCompletion = false
        transformAnimation.fillMode = kCAFillModeForwards
        frontView?.layer.mask!.addAnimation(transformAnimation, forKey: "transformAnimation")

    }
    
    func animationPop(){
         let frontView = self.tabBarController!.view
//         let backgroundView = frontView.subviews.first!
        UIView.animateWithDuration(0.1, delay: 1.35, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
           self.backgroundView.alpha = 0
            }) { (done) -> Void in
                self.backgroundView.removeFromSuperview()
        }
        
        
        
        UIView.animateWithDuration(0.25, delay: 1.3, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            frontView.transform = CGAffineTransformMakeScale(1.05, 1.05)
            
            }) { (done) -> Void in
                if done{
                    UIView.animateWithDuration(0.3,delay: 0.0,
                        options: UIViewAnimationOptions.CurveEaseInOut,
                        animations: {
                            frontView.transform = CGAffineTransformIdentity
                           self.backgroundImageView.alpha = 0
                        }){ (done) -> Void in
                            if done{
                                self.backgroundImageView.removeFromSuperview()
                                frontView.layer.mask  = nil
                                
                            }
                            
                    }
                    
                }
        }
        
    }
    
    let custom = CustomNavigationAnimationController()
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .Push {
            customInteractionController.attachToViewController(toVC)
        }
        custom.reverse = operation == .Pop
        return custom
    }
    
    
    let customInteractionController = CustomInteractionController()
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
                return customInteractionController.transitionInProgress ? customInteractionController : nil
    }
    
    
}


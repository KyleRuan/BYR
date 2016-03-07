//
//  TopicListModelController.swift
//  BYR
//
//  Created by Jason on 16/3/4.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import RealmSwift




class TopicListModelController:UITableViewController,TYAttributedLabelDelegate,UINavigationControllerDelegate{
    var isLoaded = false
    var type = ""
    var thread = "widget"
    var cells:Array<TopicListTableViewCell> = []
    let  modelEnity = TopicListModelEnity()
    
    var viewModel:TopicListViewModel! = TopicListViewModel()
    var articles:Results<Topics>! = realm.objects(Topics)
     var lastPosition = CGPointZero
    var currentPage = 1 {
        didSet{
            nextPage = currentPage + 1
        }
        
    }
    var MaxPage = 100
    var nextPage:Int = 1 {
        didSet{
            if nextPage > MaxPage{
                ////TODO: alert In Class
//                ShowAlert()
            }
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nil, bundle: nil)
       
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(type:String){
        self.init(nibName: nil, bundle: nil)
        self.type = type
        
    }
    
    let transformAnimation = CAKeyframeAnimation(keyPath: "bounds")
    var backgroundImageView = UIImageView()
    
    var typeRealm:Realm!
    
    override func viewDidLoad() {
        
       
        
        
        super.viewDidLoad()
        viewModel = TopicListViewModel(tableView: self.tableView,type: type)
//        self.tableView.frame = fath.tabBarController
        self.tableView.dataSource = self
        self.tableView.delegate = self
      
        //        let footer = MJRefreshFooter(refreshingTarget: self, refreshingAction: "loadMore")
        //        self.tableView.footer = footer
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "loadData")
        self.tableView.header = header;
        self.tableView.registerNib(UINib(nibName: "TopicListTableViewCell", bundle: nil), forCellReuseIdentifier: REUSE__IDENTIFIER_FOR_TOPICLIST_CELL)
   
        if  Reachability.isConnectedToNetwork(){
            //             setUpAnimation()
            self.tableView.header.beginRefreshing()
            
            
            var config = Realm.Configuration()
            config.path = NSURL.fileURLWithPath(config.path!).URLByDeletingLastPathComponent?.URLByAppendingPathComponent("\(type).realm").path
            
             typeRealm = try! Realm(configuration: config)
        }
        
        
        
        navigationController?.delegate = self
        //          self.articles = realm.objects(Topics)
        
        
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layer.mask = nil
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden =  false
          lastPosition = CGPointZero
    }
    
    
    func loadData(){
        // if have network
        viewModel.type = self.type
        viewModel.thread = thread

        
        viewModel.loadData(typeRealm) { () -> Void in
            
            
            print(self.typeRealm.path)
        
//            let pre = NSPredicate(value: <#T##Bool#>)
            if self.type == "topten"{
             self.articles = self.typeRealm.objects(Topics).sorted("reply_count", ascending: true)
            }else{
            self.articles = self.typeRealm.objects(Topics).sorted("last_reply_time", ascending: true)    
            }
            
            self.title = self.viewModel.title
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
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
        
        return  articles.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var  cell = tableView.dequeueReusableCellWithIdentifier(REUSE__IDENTIFIER_FOR_TOPICLIST_CELL, forIndexPath: indexPath) as! TopicListTableViewCell
        
//        if cells.count > indexPath.row {
//            return cells[indexPath.row]
//        }
        
        
        articles = typeRealm.objects(Topics)
        if articles.count > 0{
           modelEnity.cellInit(&cell, article: articles[indexPath.row])  
        }
       
//        cells.append(cell)
        
        return cell
    }
    
    
   
    override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
//         if scroll
        if lastPosition.y < scrollView.contentOffset.y{
            //向下
            fath.tabBarController?.tabBar.hidden = true ;
            lastPosition = scrollView.contentOffset
           
        }else{
          fath.tabBarController?.tabBar.hidden = false ;
            lastPosition = scrollView.contentOffset
        }
    }
    
//    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
////         fath.tabBarController?.tabBar.hidden = false  ;
////        lastPosition = scrollView.contentOffset
//    }
    
    
    
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("DetailCellForReuse") as!  TopicDetailViewController
        articles = typeRealm.objects(Topics)
        
        let article = articles[indexPath.row]
        
        vc.topicId = "\(article.id)"
        vc.boardName = article.board_name
        vc.title = article.title
        
        let originY = fath.navigationController?.navigationBar.frame.origin.y
        let originHeight = fath.navigationController?.navigationBar.frame.height
//        let vcBound =
        
        vc.tableView = UITableView(frame: CGRectMake(0, originY!+originHeight!, self.view.bounds.width, self.view.bounds.height))
        
        vc.hidesBottomBarWhenPushed = true
//svc.hidesBottomBarWhenPushed=YES
        if  self.navigationController != nil{
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
               fath.navigationController?.pushViewController(vc, animated: true)
        }
        
     
        
//        self.navigationController?.pushViewController(vc, animated: true)
       
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //         print("prepareForSegue")
        if segue.identifier == "TOPICDETAILS" {
            let vc = segue.destinationViewController as! TopicDetailViewController
            let indexPath = tableView.indexPathForCell(sender as! TopicListTableViewCell)
            
            //    let article  = modelEnity.articles[indexPath!.row]
            
            articles = typeRealm.objects(Topics)
            
            let article = articles[indexPath!.row]
            
            vc.topicId = "\(article.id)"
            vc.boardName = article.board_name
            vc.title = article.title
            
            vc.tableView = UITableView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        }
        
        
        
    }
    //        TOPICDETAIL
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    
    var  backgroundView = UIView()
    //       var  backgroundImageView = UIImageView()
    func setUpAnimation(){
        //设置进入的动画
        if self.type != "topten"{
            return
        }
        
        
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
        if self.type != "topten"{
            return
        }
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
}
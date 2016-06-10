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
import JGProgressHUD



class TopicListModelController:UITableViewController,TYAttributedLabelDelegate,UINavigationControllerDelegate{
  var isLoaded = false
  var type = ""
  var thread = "widget"
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
    let footer = MJRefreshFooter(refreshingTarget: self, refreshingAction: #selector(TopicListModelController.loadMore))
    self.tableView.mj_footer = footer
    let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(TopicListModelController.loadData))
    self.tableView.mj_header = header;
    self.tableView.registerNib(UINib(nibName: "TopicListTableViewCell", bundle: nil), forCellReuseIdentifier: REUSE__IDENTIFIER_FOR_TOPICLIST_CELL)
    if  Reachability.isConnectedToNetwork(){
      self.tableView.mj_header.beginRefreshing()
      var config = Realm.Configuration()
      config.path = NSURL.fileURLWithPath(config.path!).URLByDeletingLastPathComponent?.URLByAppendingPathComponent("\(type).realm").path
      typeRealm = try! Realm(configuration: config)
    }else {
      let hub = JGProgressHUD()
      hub.showInView(self.view)
      hub.indicatorView = nil
      hub.textLabel.text = "没有网络哦，请联网"
      hub.dismissAfterDelay(1)
    }
    navigationController?.delegate = self
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
  
  func loadMore()  {
    
  }

  func loadData(){
    viewModel.type = self.type
    viewModel.thread = thread
    if Reachability.isConnectedToNetwork() {
      viewModel.loadData(typeRealm) { () -> Void in
        if self.type == "thread"{
          self.articles = self.typeRealm.objects(Topics)
        }else{
          self.articles = self.typeRealm.objects(Topics).sorted("last_reply_time", ascending: true)
        }
        self.title = self.viewModel.title
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
          self.tableView.reloadData()
        })
      }
    }  else {
      let hub = JGProgressHUD()
      hub.showInView(self.view)
      hub.textLabel.text = "没有网络哦，请联网"
      hub.dismissAfterDelay(1)
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
    let  cell = tableView.dequeueReusableCellWithIdentifier(REUSE__IDENTIFIER_FOR_TOPICLIST_CELL, forIndexPath: indexPath) as! TopicListTableViewCell
    if articles.count > 0{
      cell.topic = articles[indexPath.row]
    }
    return cell
  }

  override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
    if lastPosition.y < scrollView.contentOffset.y{
      fath.tabBarController?.tabBar.hidden = true ;
      lastPosition = scrollView.contentOffset

    }else{
      fath.tabBarController?.tabBar.hidden = false ;
      lastPosition = scrollView.contentOffset
    }
  }

  override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 50
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("DetailCellForReuse") as!  TopicDetailViewController
    let article = articles[indexPath.row]
    vc.topicId = "\(article.id)"
    vc.boardName = article.board_name
    vc.title = article.title
    let originY = fath.navigationController?.navigationBar.frame.origin.y
    let originHeight = fath.navigationController?.navigationBar.frame.height
    vc.tableView = UITableView(frame: CGRectMake(0, originY!+originHeight!, self.view.bounds.width, self.view.bounds.height))
    vc.hidesBottomBarWhenPushed = true
    if  self.navigationController != nil{
      self.navigationController?.pushViewController(vc, animated: true)
    }else{
      fath.navigationController?.pushViewController(vc, animated: true)
    }
  }
  // MARK: - Navigation
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  var  backgroundView = UIView()
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
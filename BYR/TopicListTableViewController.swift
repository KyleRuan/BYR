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
//    var datasource:Array<JSON> = [] 
    var arr:Array<AnyObject> = []
    var isLoaded = false
    var type = "topten"
    var cells:Array<TopTenTopicTableViewCell> = []
    let  modelEnity = TopicListModelEnity()
    
    var viewModel:TopicListViewModel!
    
    
    
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
        viewModel = TopicListViewModel(tableView: self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
//        let footer = MJRefreshFooter(refreshingTarget: self, refreshingAction: "loadMore")
//        self.tableView.footer = footer
         let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "loadData")
       self.tableView.header = header;
       self.tableView.header.beginRefreshing()
        navigationController?.delegate = self
        setUpAnimation()
     

    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layer.mask = nil

    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden =  false
    }
    
    
    func loadData(){
        // if have network
        viewModel.loadData { () -> Void in
            self.animationPop()
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
        
        return viewModel.datasource.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
      
        var  cell = tableView.dequeueReusableCellWithIdentifier(REUSE_IDENTIFIER_FOR_TOPTEN_CELL, forIndexPath: indexPath) as! TopTenTopicTableViewCell
        
        if cells.count > indexPath.row {
            return cells[indexPath.row]
        }
        
        modelEnity.cellInit(&cell, datasource: viewModel.datasource[indexPath.row])
        cells.append(cell)

  return cell
    }
    
    
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50 
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         print("prepareForSegue")
        if segue.identifier == SEGUE_FROM_TOPTEN_TO_TOPICDETAIL {
            let vc = segue.destinationViewController as! TopicDetailViewController
            let indexPath = tableView.indexPathForCell(sender as! TopTenTopicTableViewCell)
            
    let article  = modelEnity.articles[indexPath!.row]
            vc.topicId = article.id.stringValue
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

extension String{
   func StringToBool()->Bool {
        if self == "1"{
            return true
        }else{
            return false
        }
}
}


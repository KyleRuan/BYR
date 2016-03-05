//
//  HomePage.swift
//  BYR
//
//  Created by Jason on 16/3/4.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import UIKit
import PageMenu


var fath = UIViewController()
class HomePage: UIViewController {
 var pageMenu : CAPSPageMenu?
    override func viewDidLoad() {
        super.viewDidLoad()
        var VCs :[UIViewController] = []

        let v1 = TopicListModelController(type: "topten")
        
        v1.title = "今日十大"
        let v2 = TopicListModelController(type: "recommend")
        v2.type = "recommend"
        v2.title = "推荐文章"
        let v3 = TopicListTableViewController()
        v3.title = "分区热门话题的信息"
        
        
        VCs.append(v1)
        VCs.append(v2)
        VCs.append(v3)
        // Customize menu (Optional)
        
       
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .SelectionIndicatorColor(UIColor.orangeColor()),
            .AddBottomMenuHairline(true),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 24.0)!),
            .MenuHeight(44.0),
            .SelectionIndicatorHeight(0.0),
            .MenuItemWidthBasedOnTitleTextWidth(true),
            .SelectedMenuItemLabelColor(UIColor.orangeColor())
            
        ]
        
        // Initialize scroll menu
         let nav = (self.navigationController?.navigationBar.frame.height)! + (self.navigationController?.navigationBar.frame.origin.y)!
       
//        (self.navigationController?.navigationBar.bounds.height)! + (self.navigationController?.navigationBar.bounds.origin.y)!
        print(    (self.navigationController?.navigationBar.bounds.height)! + (self.navigationController?.navigationBar.bounds.origin.y)!)
        pageMenu = CAPSPageMenu(viewControllers: VCs, frame: CGRectMake(0.0, nav, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        fath = self ;
        
        self.view.addSubview(pageMenu!.view)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        print(self.description)
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false 
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("home")
       
    }
    

}

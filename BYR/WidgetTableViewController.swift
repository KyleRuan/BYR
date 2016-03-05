//
//  WidgetTableViewController.swift
//  BYR
//
//  Created by Jason on 16/2/28.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import UIKit

class WidgetTableViewController: TopicListTableViewController {
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
         self.type  = "recommend"
          self.loadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

}

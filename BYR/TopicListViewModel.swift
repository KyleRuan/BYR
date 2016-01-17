//
//  TopicListViewModel.swift
//  BYR
//
//  Created by Jason on 16/1/18.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import Foundation
import SwiftyJSON

class TopicListViewModel {
    var datasource:Array<JSON> = []
    var arr:Array<AnyObject> = []
    var isLoaded = false
    var type = "topten"
    
    var currentPage = 1 {
        didSet{
            nextPage = currentPage + 1
        }
        
    }
    var title = ""
    var MaxPage = 100
    var nextPage:Int = 1
    var tableView:UITableView
    var articles:Array<Topics> = []
        
    init(tableView:UITableView){
        self.tableView = tableView
    }
    
    func loadData(completion:()->Void){
        // if have network
        let token = UserAngent.sharedInstance.getAccessToken()
        
        if type == "topten" {
            APIClinet.sharedInstance.getTopTenTopics(token!, success: { (json) -> Void in
                print(json)
                if json.type == Type.Dictionary{
                    let article = json["article"]
                    if  article != nil{
                        self.datasource.appendContentsOf(article.arrayValue )
                        self.title = json["title"].stringValue
                        self.tableView.reloadData()
                        self.tableView.header.endRefreshing()
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                           completion()
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
                        self.datasource.appendContentsOf(article.arrayValue )
                        self.title = json["title"].stringValue
                        self.tableView.reloadData()
                        self.tableView.header.endRefreshing()
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            completion()
//
                        })
                    }
                }
                }, failure: { (error) -> Void in
                    print(error)
            })
        }
        
        
    }
    
  
}
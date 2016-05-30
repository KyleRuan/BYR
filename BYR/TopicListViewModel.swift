//
//  TopicListViewModel.swift
//  BYR
//
//  Created by Jason on 16/1/18.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class TopicListViewModel {
    var datasource:Array<JSON> = []
    var arr:Array<AnyObject> = []
    var isLoaded = false
    var type = "topten"
    var thread = "widget"
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
        
   convenience init(tableView:UITableView,type:String){
        self.init()
        self.tableView = tableView
    self.type = type
    }
    
    init(){
        tableView = UITableView()
    }
    
   
    
    func loadData(typedRealm:Realm = realm,completion:()->Void){
        let token = UserAngent.sharedInstance.getAccessToken()
        APIClinet.sharedInstance.getTopics(token!, thread: thread, type: type, success: { (json) -> Void in
             print(json)
             let code = json["code"]
            if code != nil {
                print(code)
                if (code == "1703") {
                        UserAngent.sharedInstance.removeObjectForKey(USER_INFO)
                        UserAngent.sharedInstance.removeObjectForKey(ACCESS_TOKEN)
                        SegueToViewController.sharedInstance.implementationSegue(self, segueTo: OAUTH_VIEW_CONTROLLER)
            }
    }
            
            if json.type == Type.Dictionary{
                let article = json["article"]
                self.articles = []
                if(self.thread == "widget"){
                    try! typedRealm.write({ () -> Void in
                        typedRealm.deleteAll()
                    })

                }
                for arr in article.arrayValue {
                    let art = Topics.mj_objectWithKeyValues(arr.dictionaryObject)
                    
                    self.articles.append(art)
                    //                        realm.add(art)
                    try!  typedRealm.write({ () -> Void in
                        typedRealm.add(art, update: true)
                    })
                    
                }
                if  article != nil{
                    self.datasource.appendContentsOf(article.arrayValue )
                    self.title = json["title"].stringValue
                    self.tableView.reloadData()
                    self.tableView.mj_header.endRefreshing()
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        completion()
                    })
                }
            }
            }){ (er) -> Void in
                print(er)
        }

    }
    
  
}
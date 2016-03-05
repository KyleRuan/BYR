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
        
   convenience init(tableView:UITableView,type:String){
        self.init()
        self.tableView = tableView
    self.type = type
    }
    
    init(){
        tableView = UITableView()
    }
    
   
    
    func loadData(completion:()->Void){
        // if have network
        let token = UserAngent.sharedInstance.getAccessToken()
        try! realm.write({ () -> Void in
            realm.deleteAll()
        })
      
            APIClinet.sharedInstance.getTopTenTopics(token!, type: type, success: { (json) -> Void in
                print(json)
                if json.type == Type.Dictionary{
                    let article = json["article"]
                    self.articles = []
                    for arr in article.arrayValue {
                        let art = Topics.mj_objectWithKeyValues(arr.dictionaryObject)
                        
                        
                        
//                        let attachment = Attachment.mj_objectWithKeyValues(arr["attachment"].dictionaryObject)
//                        
//                        for att in arr["attachment"]["file"].arrayValue{
//                            let file = AttachmentFile.mj_objectWithKeyValues(att.dictionaryObject)
//                           print(file)
//                            attachment.file?.append(file)
//                        }
                        
                       
                        
//                        art.attachment = attachment
                        
                        self.articles.append(art)
//                        realm.add(art)
                        try!  realm.write({ () -> Void in
                            realm.add(art)
                        })
                        
                    }
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
            }){ (er) -> Void in
                    print(er)
            }
    }
    
  
}
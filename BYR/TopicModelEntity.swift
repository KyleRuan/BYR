//
//  TopicModelEntity.swift
//  BYR
//
//  Created by Jason on 15/11/9.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation
import SwiftyJSON

class TopicModelEnity{
    var avatarUrl:String!
    var userName:String!
    var postTime:String!
//    var like:String?
    var content:String!
    var number:String!
    var has_attachment:Bool
    var attachment:[JSON]?
    
    
    init(enity:TopicModelEnity){
        avatarUrl = enity.avatarUrl
        userName  = enity.userName
        postTime = enity.postTime
//        like = enity.like
        content = enity.content
        number = enity.number
        attachment = enity.attachment
        has_attachment = enity.has_attachment
    }
    
    init(url:String,name:String,time:String,content:String,number:String,has_attachment:Bool,attachment:[JSON]?){
        avatarUrl = url
        userName = name
        postTime = time
        self.number = number
        self.content = content
        self.has_attachment = has_attachment
        if has_attachment {
        self.attachment = attachment
        }
       
        
        
    }
    
    class  func initDataSource(json:JSON,inout dataEntityArray:[TopicModelEnity])->(Int,Int){
      let  MaxPage = json["pagination"]["page_all_count"].intValue
      let   currentPage =  json["pagination"]["page_current_count"].intValue
      let articles = json["article"].arrayValue
//      var dataEntityArray:Array<TopicModelEnity> = []
        for article in  articles{
            
            let userName = article["user"]["id"].stringValue
            let postTime =  FormmatterTime.NomalTime(article["post_time"].stringValue, Format: "MM-dd-HH:mm")
            let number = article["position"].stringValue
            let content = article["content"].stringValue
            let avatarURL = article["user"]["face_url"].stringValue
            let has_attachment = article["has_attachment"].boolValue
            let attachment = article["attachment"]["file"].arrayValue
            let entity = TopicModelEnity(url: avatarURL, name: userName, time: postTime, content: content, number: number,has_attachment:has_attachment,attachment: attachment)
            dataEntityArray.append(entity)
        }
        
        return (MaxPage,currentPage)
        
        
    }
}
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
    
//    var user:User!
//    var topic:Topics!
    
    
    
    var avatarUrl:String?
    var userName:String!
    var postTime:String!
//    var like:String?
    var content:String!
    var number:String!
    var has_attachment:Bool
    var attachment:Attachment?
    var cellHeight:CGFloat = 0
    
    
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
    
    init(url:String?,name:String,time:String,content:String,number:String,has_attachment:Bool,attachment:Attachment?){
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
          let topic = Topics.mj_objectWithKeyValues(json.dictionaryObject)

//        print(json) 
      let  MaxPage = topic.pagination?.page_all_count
      let   currentPage =  topic.pagination?.page_current_count
   
        
 
        let articls_json = json["article"].arrayValue
        for jsons in  articls_json {
             let article = Topics.mj_objectWithKeyValues(jsons.dictionaryObject)
            let userName = article.user.id
            let postTime =  FormmatterTime.NomalTime(article.post_time, Format: "MM-dd-HH:mm")
            let number = article.position 
            let content = article.content
            let avatarURL = article.user.face_url
            let has_attachment = article.has_attachment
            let attachment = article.attachment
            let entity = TopicModelEnity(url: avatarURL, name: userName, time: postTime, content: content!, number: String(number),has_attachment:has_attachment,attachment: attachment)
            dataEntityArray.append(entity)
        }
        
        return (MaxPage!,currentPage!)
        
        
    }
}
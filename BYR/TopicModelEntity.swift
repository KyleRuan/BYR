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
    
    var user:User!
    var topic:Topics!
    
    
    
    var avatarUrl:String?
    var userName:String!
    var postTime:String!
//    var like:String?
    var content:String!
    var number:String!
    var has_attachment:Bool
    var attachment:Attachment?
    
    
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
//    
//    init(json:JSON){
//        
//        
//    }
    
//    init(json:JSON){
//        let topic = Topics.yy_modelWithJSON(json)
//    }
    
    
    //文章元数据，以及该元数据还包括以下两个属性
    
//    属性	类型	说明
//    article	array	当前主题包含的文章元数据数组
//    pagination	array	当前主题分页信息
    class  func initDataSource(json:JSON,inout dataEntityArray:[TopicModelEnity])->(Int,Int){
          let topic = Topics.yy_modelWithJSON(json.dictionaryObject)

        print(json)
      let  MaxPage = topic.pagination?.page_all_count as? Int ?? 0
      let   currentPage =  topic.pagination?.page_current_count as? Int ?? 0
   
        
 
        let articls_json = json["article"].arrayValue
        for jsons in  articls_json {
             let article = Topics.yy_modelWithJSON(jsons.dictionaryObject)
            let userName = article.user.id
            let postTime =  FormmatterTime.NomalTime(article.post_time.stringValue, Format: "MM-dd-HH:mm")
            let number = article.position as? Int ?? 0
            let content = article.content
            let avatarURL = article.user.face_url
            let has_attachment = article.has_attachment.StringToBool()
            let attachment = article.attachment
            let entity = TopicModelEnity(url: avatarURL, name: userName, time: postTime, content: content!, number: String(number),has_attachment:has_attachment,attachment: attachment)
            dataEntityArray.append(entity)
        }
        
        return (MaxPage,currentPage)
        
        
    }
}
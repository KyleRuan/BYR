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
}
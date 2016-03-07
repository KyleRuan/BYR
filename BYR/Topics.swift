//
//  Topic.swift
//  我邮
//
//  Created by Jason on 15/5/25.
//  Copyright (c) 2015年 KyleRuan. All rights reserved.
//

import Foundation
import RealmSwift
/// BOOL类型用string的“1”表示，然后转换为bool
class Topics:Object{
  dynamic   var id:Int = 0 //	文章id
    dynamic  var group_id:Int = 0 //该文章所属主题的id
    dynamic var reply_id:Int = 0 //该文章回复文章的id
    dynamic var flag:String? //文章标记 分别是m g ; b u o 8
    dynamic var position:Int = 0//文章所在主题的位置或文章在默写浏览模式下的位置
    dynamic var is_top = false //文章是否置顶
    dynamic var is_subject = false //该文章是否是主题帖
    dynamic var has_attachment = false //文章是否有附件
    dynamic var is_admin  = false //当前登陆用户是否对文章有管理权限 包括编辑，删除，修改附件
    dynamic var title :String!//文章标题
    dynamic var user:User!  //文章发表用户，这是一个用户元数据
    dynamic var post_time:Int = 0 //文章发表时间，unixtimestamp
    dynamic var board_name:String? //所属版面名称
    dynamic var content:String?  //文章内容	在/board/:name的文章列表和/search/(article|threads)中不存在此属性
    dynamic var attachment:Attachment? //文章附件列表，这是一个附件元数据	在/board/:name的文章列表和/search/(article|threads)中不存在此属性
    dynamic var previous_id:Int = 0 //该文章的前一篇文章id ,只存在于/article/:board/:id中
    dynamic var next_id:Int = 0//该文章的后一篇文章id,只存在于/article/:board/:id中
    dynamic var threads_previous_id:Int = 0 //该文章同主题前一篇文章id	只存在于/article/:board/:id中
    dynamic var threads_next_id:Int = 0 //该文章同主题后一篇文章id	只存在于/article/:board/:id中
    dynamic var reply_count:Int = 0 // 该主题回复文章数
    dynamic var last_reply_user_id:String?//该文章最后回复者的id
    dynamic var last_reply_time:Int = 0//该文章最后回复的时间 unxitmestamp
    dynamic var date = NSDate()
    
 /// 处理的是当前文章的分页信息
    dynamic var pagination:Pagination?  //分页信息
 
  override  static func primaryKey() -> String? { return "id" }
    
    
    override static func ignoredProperties() -> [String] {
        
        return ["attachment"]
        
        
    }
   
    

}



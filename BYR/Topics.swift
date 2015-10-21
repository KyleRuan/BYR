//
//  Topic.swift
//  我邮
//
//  Created by Jason on 15/5/25.
//  Copyright (c) 2015年 KyleRuan. All rights reserved.
//

import Foundation


struct Topics{
    var ID:Int? //	文章id
    var group_id:Int? //该文章所属主题的id
    var reply_id:Int? //该文章回复文章的id
    var flag:String? //文章标记 分别是m g ; b u o 8
    var position:Int?//文章所在主题的位置或文章在默写浏览模式下的位置
    var is_top:Bool? //文章是否置顶
    var is_subject:Bool? //该文章是否是主题帖
    var has_attachment:Bool? //文章是否有附件
    var is_admin:Bool? //当前登陆用户是否对文章有管理权限 包括编辑，删除，修改附件
    var title :String? //文章标题
    var user:User?  //文章发表用户，这是一个用户元数据
    var post_time:Int? //文章发表时间，unixtimestamp
    var board_name:String? //所属版面名称
    var content:String?  //文章内容	在/board/:name的文章列表和/search/(article|threads)中不存在此属性
    var attachment:Attachment? //文章附件列表，这是一个附件元数据	在/board/:name的文章列表和/search/(article|threads)中不存在此属性
    var previous_id:Int? //该文章的前一篇文章id ,只存在于/article/:board/:id中
    var next_id:Int?//该文章的后一篇文章id,只存在于/article/:board/:id中
    var threads_previous_id:Int? //该文章同主题前一篇文章id	只存在于/article/:board/:id中
    var threads_next_id:Int? //该文章同主题后一篇文章id	只存在于/article/:board/:id中
    var reply_count:Int? // 该主题回复文章数	    
    var last_reply_user_id:String?//该文章最后回复者的id
    var last_reply_time:Int?//该文章最后回复的时间 unxitmestamp
}



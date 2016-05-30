//
//  Board.swift
//  Byr
//
//  Created by Jason on 15/10/18.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation
import RealmSwift

class Board:Object {
    dynamic var name:String?  //版面名称
    dynamic var manager:String?  //版主列表，以空格分隔各个id
    dynamic var section:String?  //版面所属分区号
    dynamic var post_today_count:Int = 0 //今日发文总数
    dynamic var threads_today_count:Int = 0 //今日主题总数(收藏夹接口)
    dynamic var post_all_count:Int = 0//	版面文章总数
 /// "1"true
    dynamic var is_read_only:String?  //版面是否只读
 /// "1"true
    dynamic var is_no_reply:String?  //	版面是否不可回复
 /// "1"true
    dynamic var allow_attachment:String? //版面书否允许附件
 /// "1"true
    dynamic var allow_anonymous:String?  //	版面是否允许匿名发文
 /// "1"true
    dynamic var allow_outgo:String?  //	版面是否允许转信
 /// "1"true
    dynamic var allow_post:String?  //当前登陆用户是否有发文/回复权限
    dynamic var user_online_count:Int = 0 //版面当前在线用户数
    dynamic var user_online_max_count:Int = 0//版面历史最大在线用户数
    dynamic var user_online_max_time:Int = 0  //版面历史最大在线用户数发生时间
}



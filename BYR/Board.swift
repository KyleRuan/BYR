//
//  Board.swift
//  Byr
//
//  Created by Jason on 15/10/18.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation

class Board:NSObject {
    var name:String?  //版面名称
    var maneger:String?  //版主列表，以空格分隔各个id
    var descriptions:String? //版面描述
    var board_class:String? //版面所属类别
    var section:String?  //版面所属分区号
    var post_today_count:Int? //今日发文总数
    var threads_today_count:Int? //今日主题总数(收藏夹接口)
    var post_all_count:Int? //	版面文章总数
 /// "1"true
    var is_read_only:String?  //版面是否只读
 /// "1"true
    var is_no_reply:String?  //	版面是否不可回复
 /// "1"true
    var allow_attachment:String? //版面书否允许附件
 /// "1"true
    var allow_anonymous:String?  //	版面是否允许匿名发文
 /// "1"true
    var allow_outgo:String?  //	版面是否允许转信
 /// "1"true
    var allow_post:String?  //当前登陆用户是否有发文/回复权限
    var user_online_count:Int?  //版面当前在线用户数
    var user_online_max_count:Int? //版面历史最大在线用户数
    var user_online_max_time:Int?  //版面历史最大在线用户数发生时间
}



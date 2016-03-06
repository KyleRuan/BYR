//
//  Reminding.swift
//  Byr
//
//  Created by Jason on 15/10/18.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation


class Reminding:NSObject {
    var reminding_index:Int? //提醒编号，此编号用于提醒的相关操作
    var id:String?  // 提醒文章的id
    var group_id:Int? // 提醒文章的group id
    var reply_id:Int? //提醒文章的reply id
    var board_name:String? //提醒文章所在版面
    var title:String? //提醒文章的标题
    var user:User? //提醒文章的发信人，此为user元数据，如果user不存在则为用户id
    var time:Int? //发出提醒的时间
 /// "1"true
    var is_read:String? //提醒是否已读
}

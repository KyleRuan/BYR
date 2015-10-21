//
//  Mail.swift
//  我邮
//
//  Created by Jason on 15/5/26.
//  Copyright (c) 2015年 KyleRuan. All rights reserved.
//

import Foundation

//信件元数据
struct Mail{
    var mail_index:Int? //信件编号，此编号为/mail/:box/:num中的num
    var is_m:Bool?  //是否标记为m
    var is_read:Bool?  //是否已读
    var is_reply:Bool?  //是否回复
    var has_attachment:Bool? //是否有附件
    var title:String?   //信件标题
    var user:User?     //发信人
    var post_time:Int?  //发信时间
    var box_name:String?  //所属信箱名
    var content:String?  //信件内容
    var attachment:Attachment?  //信件的附件列表	只存在于/mail/:box/:num中
}

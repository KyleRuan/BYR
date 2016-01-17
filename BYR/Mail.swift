//
//  Mail.swift
//  我邮
//
//  Created by Jason on 15/5/26.
//  Copyright (c) 2015年 KyleRuan. All rights reserved.
////
//
import Foundation

//信件元数据
class Mail:NSObject{
    var mail_index:Int? //信件编号，此编号为/mail/:box/:num中的num
 /// 是否标记为m "1"true
    var is_m:String?  //是否标记为m
 /// "1"true
    var is_read:String?  //是否已读
 /// "1"true
    var is_reply:String?  //是否回复
 /// "1"true
    var has_attachment:String? //是否有附件
    var title:String?   //信件标题
    var user:User!     //发信人
    var post_time:Int?  //发信时间
    var box_name:String?  //所属信箱名
    var content:String?  //信件内容
    var attachment:Attachment?  //信件的附件列表	只存在于/mail/:box/:num中
}

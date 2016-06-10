//
//  userMail.swift
//  我邮
//
//  Created by Jason on 15/5/26.
//  Copyright (c) 2015年 KyleRuan. All rights reserved.
//

import Foundation
/**
*  用户信箱元数据
*/
class UserMail:NSObject{
 /// "1"true有新邮件
    var new_mail:String?  //是否有新邮件
 /// "1"true
    var full_mail:String?  //信箱是否已满
    var space_used:String?  //信箱已用空间
 /// "1"true
    var can_send:String?  //当前用户是否能发信
}



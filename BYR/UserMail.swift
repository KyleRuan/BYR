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
    var new_mail:Bool?  //是否有新邮件
    var full_mail:Bool?  //信箱是否已满
    var space_used:String?  //信箱已用空间
    var can_send:Bool?  //当前用户是否能发信
}



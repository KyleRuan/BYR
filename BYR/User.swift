//
//  User.swift
//  我邮
//
//  Created by Jason on 15/5/25.
//  Copyright (c) 2015年 KyleRuan. All rights reserved.
//

import Foundation


//用户元数据
struct User {
    var id:String? //用户ID 用户信息
    var user_name:String?  //用户中文昵称
    var face_url:String//用户头像地址
    var face_width:Int? //用户头像宽度
    var face_height:Int?  //用户头像高度
    var gender:String?  //用户性别：m表示男性，f表示女性，n表示隐藏性别
    var astro:String? // 用户星座 若隐藏星座则为空
    var life:Int?//	用户生命值
      var qq:String? //用户QQ
     var msn:String? //用户msn
     var home_page:String? //用户个人主页
        var level:String?//等级称谓 用户身份
    var is_online:Bool? //用户是否在线
    var post_count:Int? //用户发文数量
      var last_login_time:NSDate?//上次登录时间
     var last_login_ip: String?//用户上次登录
    var is_hide:Bool? //用户是否隐藏性别和星座
    var is_register:Bool? //用户是否通过注册审批
    var first_login_time:Int? //int	用户注册时间，unixtimestamp	当前登陆用户为 自己或是当前用户具有管理权限
    var login_count:Int?//用户登陆次数	当前登陆用户为 自己或是当前用户具有管理权限
    var is_admin:Bool? //用户是否为管理员	当前登陆用户为 自己或是当前用户具有管理权限
    var stay_count:Int? //int	用户挂站时间，以秒为单位	当前登陆用户为 自己或是当前用户具有管理权限



}


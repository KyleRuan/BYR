//
//  User.swift
//  我邮
//
//  Created by Jason on 15/5/25.
//  Copyright (c) 2015年 KyleRuan. All rights reserved.
//

import Foundation
//var Users:[String:AnyObject!] = ["id":"用户信息","user_name":"昵称","gender":"性别","astro":"星座","life":"生命值","qq":"QQ","msn":"MSN","home_page":"个人主页","is_online":"是否在线","level":"身份","post_count":"发文数量","last_login_time":"上次登录时间","last_login_ip":"上次登录IP","login_count":"登陆次数","stay_count":"挂站时间","first_login_time":"注册时间"]

//用户元数据
struct User{
   
    var id:String?  = nil//用户ID 用户信息
    var user_name:String?  = nil  //用户中文昵称
    var face_url:String? = nil//用户头像地址
    var face_width:Int? = nil//用户头像宽度
    var face_height:Int? = nil //用户头像高度
    var gender:String?   = nil //用户性别：m表示男性，f表示女性，n表示隐藏性别
    var astro:String?  = nil// 用户星座 若隐藏星座则为空
    var life:Int? = nil//	用户生命值
    var qq:String?  = nil//用户QQ
    var msn:String?  = nil//用户msn
    var home_page:String? = nil //用户个人主页
    var level:String? = nil//等级称谓 用户身份
    var is_online:Bool? = nil//用户是否在线
    var post_count:Int? = nil//用户发文数量
    var last_login_time:String? = nil//上次登录时间
    var last_login_ip: String? = nil//用户上次登录
    var is_hide:Bool? = nil//用户是否隐藏性别和星座
    var is_register:Bool? = nil//用户是否通过注册审批
    var first_login_time:Int? = nil //int	用户注册时间，unixtimestamp	当前登陆用户为 自己或是当前用户具有管理权限
    var login_count:Int? = nil//用户登陆次数	当前登陆用户为 自己或是当前用户具有管理权限
    var is_admin:Bool? = nil//用户是否为管理员	当前登陆用户为 自己或是当前用户具有管理权限
    var stay_count:Int? = nil //int	用户挂站时间，以秒为单位	当前登陆用户为 自己或是当前用户具有管理权限
    
}



//
//  User.swift
//  我邮
//
//  Created by Jason on 15/5/25.
//  Copyright (c) 2015年 KyleRuan. All rights reserved.
//

import Foundation
import RealmSwift
//dynamic var Users:[String:AnyObject!] = ["id":"用户信息","user_name":"昵称","gender":"性别","astro":"星座","life":"生命值","qq":"QQ","msn":"MSN","home_page":"个人主页","is_online":"是否在线","level":"身份","post_count":"发文数量","last_login_time":"上次登录时间","last_login_ip":"上次登录IP","login_count":"登陆次数","stay_count":"挂站时间","first_login_time":"注册时间"]

//用户元数据
class User:Object{
   
    dynamic var id:String!//用户ID 用户信息
    dynamic var user_name:String! = " "  //用户中文昵称
    dynamic var face_url:String! //用户头像地址
    dynamic var face_width:Int = 0//用户头像宽度
    dynamic var face_height:Int = 0 //用户头像高度
    dynamic var gender:String? //用户性别：m表示男性，f表示女性，n表示隐藏性别
    dynamic var astro:String?  = nil// 用户星座 若隐藏星座则为空
    dynamic var life:Int = 0//	用户生命值
    dynamic var qq:String?  = nil//用户QQ
    dynamic var msn:String?  = nil//用户msn
    dynamic var home_page:String? = nil //用户个人主页
    dynamic var level:String? = nil//等级称谓 用户身份
 /// 用户是否在线 "1"true
    dynamic var is_online:String!
    dynamic var post_count:Int = 0//用户发文数量
    dynamic var last_login_time:Int = 0//上次登录时间
    dynamic var last_login_ip: String? = nil//用户上次登录
    dynamic var is_hide:Bool = false//用户是否隐藏性别和星座
    dynamic var is_register:Bool = true//用户是否通过注册审批
    dynamic var first_login_time:Int = 0 //NSNumber	用户注册时间，unixtimestamp	当前登陆用户为 自己或是当前用户具有管理权限
    dynamic var login_count:Int = 0//用户登陆次数	当前登陆用户为 自己或是当前用户具有管理权限
    dynamic  var is_admin:String!//用户是否为管理员	当前登陆用户为 自己或是当前用户具有管理权限
    dynamic var stay_count:Int = 0 //NSNumber	用户挂站时间，以秒为单位	当前登陆用户为 自己或是当前用户具有管理权限
//    dynamic var avatorData:NSData? = UIImage().mj_JSONData()
    
      override  static func primaryKey() -> String? { return "id" }

}



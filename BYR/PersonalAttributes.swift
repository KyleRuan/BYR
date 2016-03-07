//
//  PersonalAttributes.swift
//  BYR
//
//  Created by Jason on 15/11/4.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation
import SwiftyJSON

class PersonalAttributes {
    

    
    
    
    func keyValuePairs(user:User)->([String],[String]){
        var datasource = [String:String]()
//        if userInfo["gender"].stringValue == "m" {
//            datasource["性别"] = "男"
//            
//        }else{
//            datasource["性别"] = "女"
//        }
        
        
        datasource["星座"] = user.astro
        datasource["QQ"] = user.qq
        datasource["MSN"] = user.msn
        datasource["个人主页"] = user.home_page
        datasource["论坛等级"] = user.level
        datasource["帖子总数"] = "\(user.post_count)"
        datasource["登陆次数"] =  "\(user.login_count)"
        let Format = "YYYY-MM-dd-HH:mm"
        datasource["上次登录时间"] = FormmatterTime.NomalTime(user.last_login_time,Format: Format)
        datasource["上次登录IP"] = "\(user.last_login_ip!)"
        datasource["挂站时间"] = "\(user.stay_count/60/60)小时"
        datasource["注册时间"] = FormmatterTime.NomalTime(user.first_login_time,Format: Format)
        
        let keys =  datasource.keys
        let values = datasource.values
        
        return (Array(keys),Array(values))
        
    }

    
    
}

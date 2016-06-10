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
        datasource["星座"] = user.astro
        datasource["QQ"] = user.qq
        datasource["个人主页"] = user.home_page
        datasource["帖子总数"] = "\(user.post_count)"
        if user.login_count > 0 {
            datasource["登陆次数"] =  "\(user.login_count)"
        }
        datasource["当前状态"] = user.is_online == "0" ? "离线":"在线"
        let Format = "YYYY-MM-dd-HH:mm"
        datasource["上次登录时间"] = FormmatterTime.NomalTime(user.last_login_time,Format: Format)
        datasource["上次登录IP"] = "\(user.last_login_ip!)"
        let keys =  datasource.keys
        let values = datasource.values
        return (Array(keys),Array(values))
    }

}

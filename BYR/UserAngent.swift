//
//  UserAngent.swift
//  BYR
//
//  Created by Jason on 15/11/4.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation


class UserAngent{
    static let sharedInstance = UserAngent()
    
    private init () {
    }
    
    func setUserInfo(userInfo:AnyObject?) {
        
        NSUserDefaults.standardUserDefaults().setObject(userInfo, forKey: USER_INFO)
    }
    
     func getUserInfo()->AnyObject?{
        return NSUserDefaults.standardUserDefaults().objectForKey(USER_INFO)
    }
    
     func setAccessToken(token:AnyObject?){
      NSUserDefaults.standardUserDefaults().setObject(token, forKey: ACCESS_TOKEN)
    }
    
     func getAccessToken()->AnyObject?{
     return NSUserDefaults.standardUserDefaults().objectForKey(ACCESS_TOKEN)
    }
    
    func setRefreshToken(RefreshToken:AnyObject?)  {
         NSUserDefaults.standardUserDefaults().setObject(RefreshToken, forKey: REFRESHTOKEN)
    }
    
    func getRefreshToken()->AnyObject?{
        return NSUserDefaults.standardUserDefaults().objectForKey(REFRESHTOKEN)
    }
    
    
    func  getIsAuthorized()->Bool{
        return NSUserDefaults.standardUserDefaults().boolForKey(IS_AUTHORIZE)
    }
    
    func setIsAuthorized(IsAuthorize:Bool){
        NSUserDefaults.standardUserDefaults().setBool(IsAuthorize, forKey: IS_AUTHORIZE)
    }
    
    
    func removeObjectForKey(key:String) {
        NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
    }

    
    
}
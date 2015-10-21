//
//  BBSContext.swift
//  Byr
//
//  Created by Jason on 15/10/16.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation
import SwiftyJSON

class BBSContext{
   static let sharedInstance = BBSContext()
    
   private let LoginFeedbackJson = "LoginFeedbackJson"
    
    func isTokenLegal(completionHandler: ((isTokenLegal: Bool) -> Void)){
        if let json = BBSContext.sharedInstance.getLoginData(){
            //FIXME:
            let uid = json["uid"].stringValue
            let token = json["token"].stringValue
            APIClinet.sharedInstance.isTokenLegal(uid, token: token, success: { (json) -> Void in
                print(json)
                
                //成功
                if json["code"].intValue == 1 {
                    completionHandler(isTokenLegal: true)
                    
                }else{
                    let msg = json["msg"].stringValue
                    print(msg)
//                 UIApplication.topMostViewController().view
                    
//                    UIApplication.topMostViewController()?.view.makeToast(message: msg, duration: TIME_OF_TOAST_OF_TOKEN_ILLEGAL, position: HRToastPositionTop)
                    completionHandler(isTokenLegal: false)
                    
                }
                }, failure: { (error) -> Void in
                    print(error)
                    completionHandler(isTokenLegal: false)
            })
        }else{
            completionHandler(isTokenLegal: false)
        }
            
        }
    
    
    
    
    
 
    
    func getLoginData() -> JSON?{
        let userDefaults = NSUserDefaults.standardUserDefaults()
        guard let data = userDefaults.objectForKey(LoginFeedbackJson), let nsdata = data as? NSData ,
            let json = NSKeyedUnarchiver.unarchiveObjectWithData(nsdata) else{
                return nil
        }
        return JSON(json)
        
    }
}



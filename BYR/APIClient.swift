//
//  APIClient.swift
//  Byr
//
//  Created by Jason on 15/10/14.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

 let baseurl = "http:bbs.byr.cn"



class APIClinet {
    static let sharedInstance = APIClinet()
    
    func getJSONData(path:String,parameters:[String:AnyObject]?, success: (JSON) -> Void, failure: (NSError) -> Void){
        
        Alamofire.request(.GET, baseurl+path, parameters: parameters).responseSwiftyJSON{
            (request,response ,result ,error) in
            if let err = error {
                failure(err)
            } else {
                success(result)
            }
        }
        
    }
    
    //可以在这个添加token是否是合适
    func postJSONData(path:String,parameter:[String:AnyObject]?,success:(JSON) -> Void,failure:(NSError)->Void){
        Alamofire.request(.POST, baseurl, parameters: parameter).responseSwiftyJSON{
            (request,response ,result ,error) in
            if let err = error {
                failure(err)
            } else {
                success(result)
            }
        }
        
    }
    
    
    
    func getTopTenTopics(token:AnyObject,success:(JSON)->Void,failure:(NSError)->Void){
//        http://bbs.byr.cn/open/widget/topten.json?oauth_token=ddd06f3d6675fa948970dfe763e47f30
        let param = [AccessToken:token]
        self.getJSONData("/open/widget/topten.json", parameters: param, success: success, failure: failure)
    }
    

    func getAuthorizedUserInfo(token:AnyObject,success:(JSON)->Void,failure:(NSError)->Void){
        let param = [AccessToken:token]
        self.getJSONData("/open/user/getinfo.json", parameters: param, success: success, failure: failure)
    }
    
    func isTokenLegal(uid:AnyObject,token:AnyObject,success:(JSON)->Void,failure:(NSError)->Void){
        let param = ["uid":uid,"token":token]
        self.getJSONData("isTokenLegal", parameters: param, success: success, failure: failure)
    }

    
    func getACCESSToken(success:(JSON)->Void,failure:(NSError)->Void){
        let param = ["response_type":RESPONSE_TYPE,"client_id":CLIENT_ID,"redirect_uri":REDIRECT_URI]
        self.getJSONData("/oauth2/authorize", parameters: param, success: success, failure: failure)
        
    }
    
//    func readMessage(uid: AnyObject, token: AnyObject, msgID: AnyObject, success: (JSON) -> Void, failure: (NSError) -> Void) {
//        let dict = ["uid": uid, "token": token, "msg_id": msgID]
//        self.getJSONData("read_message", parameters: dict , success: success, failure: failure)
//    }
//    
//    func getMessages(userID: AnyObject, token: AnyObject, success: (JSON) -> Void, failure: (NSError) -> Void) {
//        let dict = ["uid": userID, "token": token]
//        self.getJSONData("messages", parameters: dict, success: success, failure: failure)
//    }
//    
//    func sendMessage(uid: AnyObject, token: AnyObject, receiver_uid: AnyObject,title: AnyObject, content: AnyObject, success: (JSON) -> Void, failure: (NSError) -> Void) {
//        let dict = ["uid": uid, "send_to": receiver_uid,"title": title, "content": content, "token": token]
//        self.postJSONData("send_message", parameter: dict, success: success, failure: failure)
//    }
    
    

    
    
    
    
}




    
        
        
        
        
        
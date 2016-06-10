//
//  APIClient.swift
//  Byr
//
//  Created by Jason on /10/14.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let baseurl = "http://bbs.byr.cn"

class APIClinet {
  static let sharedInstance = APIClinet()
  private  func getJSONData(path:String,parameters:[String:AnyObject]?, success: (JSON) -> Void, failure: (NSError) -> Void){
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
  private func postJSONData(path:String,parameter:[String:AnyObject]?,success:(JSON) -> Void,failure:(NSError)->Void){
    Alamofire.request(.POST, baseurl+path, parameters: parameter).responseSwiftyJSON{
      (request,response ,result ,error) in
      print(request)
      print(response)
      if let err = error {
        failure(err)
      } else {
        success(result)
      }
    }
  }

  func getUserInfo(token:AnyObject,userId:String,success:((JSON)->Void),failure:((NSError)->Void)) {
    let param = [ACCESS_TOKEN:token]
    self.getJSONData("/open/user/query/\(userId).json", parameters: param, success: success, failure: failure)
  }

  func getSectionInfo(token:AnyObject,name:String,success:((JSON)->Void),failure:((NSError)->Void)){
    let param = [ACCESS_TOKEN:token]
    self.getJSONData("/open/section/\(name).json", parameters: param, success: success, failure: failure)
  }

  func getTopics(token:AnyObject,thread:String,type:String,success:((JSON)->Void),failure:((NSError)->Void)){
    let param = [ACCESS_TOKEN:token]
    self.getJSONData("/open/\(thread)/\(type).json", parameters: param, success: success, failure: failure)
  }

  func getTopTenTopics(token:AnyObject,type:String,success:(JSON)->Void,failure:(NSError)->Void){
    let param = [ACCESS_TOKEN:token]
    self.getJSONData("/open/widget/\(type).json", parameters: param, success: success, failure: failure)
  }

  func getTopicList(token:AnyObject,name:String,mode:Int = 2,page:Int,success:(JSON)->Void,failure:(NSError)->Void){
    let param = [ACCESS_TOKEN:token,"mode":mode,"page":page]
    self.getJSONData("/open/board/\(name).json", parameters: param, success: success, failure: failure)
  }

  func getAuthorizedUserInfo(token:AnyObject,success:(JSON)->Void,failure:(NSError)->Void){
    let param = [ACCESS_TOKEN:token]
    self.getJSONData("/open/user/getinfo.json", parameters: param, success: success, failure: failure)
  }
  func getOneTopicDetail(token:AnyObject,path:String,page:Int,success:(JSON)->Void,failure:(NSError)->Void){
    let param = [ACCESS_TOKEN:token,"page":page]
    self.getJSONData("/open/threads/\(path).json", parameters: param, success:success, failure: failure)
  }

  func isTokenLegal(uid:AnyObject,token:AnyObject,success:(JSON)->Void,failure:(NSError)->Void){
    let param = ["uid":uid,"token":token]
    self.getJSONData("isTokenLegal", parameters: param, success: success, failure: failure)
  }

  func getACCESSToken(success:(JSON)->Void,failure:(NSError)->Void){
    let param = ["response_type":RESPONSE_TYPE,"client_id":CLIENT_ID,"redirect_uri":REDIRECT_URI]
    self.getJSONData("/oauth2/authorize", parameters: param, success: success, failure: failure)

  }
  func getACCESSToken(refresh_token:AnyObject,success:(JSON)->Void,failure:(NSError)->Void) {
    let param = ["client_id":CLIENT_ID,"client_secret":CLIENT_SECRET,"grant_type":"refresh_token","refresh_token":refresh_token]
    self.postJSONData("/oauth2/token", parameter: param, success: success, failure: failure)
  }
}










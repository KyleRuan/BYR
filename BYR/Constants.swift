//
//  Constants.swift
//  Byr
//
//  Created by Jason on 15/10/13.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation

 let  ACCESS_TOKEN   = "oauth_token"
 let REFRESHTOKEN  = "refresh_token"
 let Oauth_URL     = "http://bbs.byr.cn/oauth2/authorize"
 let RESPONSE_TYPE = "token"
 let CLIENT_ID     = "2a44821105d92482960593d94e4d042e"
 let REDIRECT_URI  = "http://bbs.byr.cn/oauth2/callback"
 let STATE         = "4d404f05d04eb891caacbc808ab45db1"
 let BASEURL = "http://bbs.byr.cn"  //需要加 /open 再加东西
 let IS_NOT_FIRST_LAUNCH = "isNotFirstLaunch"
 let  IS_AUTHORIZE = "authorize"
 let USER_INFO = "userInfo"

let CLIENT_SECRET = "b7d17ce51dee62ab0d22d1bc5aa67e32"







let kLoginFeedbackJson = "kLoginFeedbackJson"
// ViewController name
let OAUTH_VIEW_CONTROLLER = "OauthViewController"
let TABAR_VIEW_CONTROLLER = "TabBarController"


//tableViewCell for REUSE


let REUSE__IDENTIFIER_FOR_TOPICLIST_CELL = "TopicListCell"
let REUSE_IDENTIFIER_FOR_TOPTEN_CELL = "TopTenCell"
let  REUSE_IDENTIFIER_FOR_TOPIC_DETAIL_CELL = "detailcell"
let REUSE_IDENTIFIER_FOR_BOARD_CELL = "BoardCell"
let REUSE_IDENTIFIER_FOR_BOARDLIST_CELL  = "BoardListCells"


// Segue

let  SEGUE_FROM_LOGIN_TO_TABBAR = "LoginSuccess"
let  SEGUE_FROM_TOPTEN_TO_TOPICDETAIL = "TOPICDETAIL"
let   SEGUE_FROM_SECTION_TO_BOARDLIST  =  "SegueFromSectionToBoardTableView"
let   SEGUE_FROM_SECTION_TO_SUBSECTION = "toSubSection"
let  SEGUE_FROM_SECTION_T0_TOPICLIST = "toTopicList"


//Color

//let backgroundColor = UIColor(red: 100, green: 127, blue: 127, alpha: 1)


struct Screen {
static let width = UIScreen.mainScreen().bounds.width
    static let height =  UIScreen.mainScreen().bounds.height
    static let bounds =  UIScreen.mainScreen().bounds
}

var UserInfowindow = UIWindow(frame: Screen.bounds)


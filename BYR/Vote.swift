//
//  Vote.swift
//  我邮
//
//  Created by Jason on 15/5/27.
//  Copyright (c) 2015年 KyleRuan. All rights reserved.
//

import Foundation

//投票元数据
class Vote:NSObject {
    var vid:Int? //投票标识id
    var title:String?  //投票标题
    var start:NSDate?  //投票发起时间戳
    var end:NSDate?   //投票截止时间戳
    var user_count:Int?   //投票参与的人数
    var vote_count:Int?  //投票总票数(投票类型为单选时与user_count相等)，如果设置投票后可见且还没投票这个值为-1
    var type:Int?     //	投票类型，0为单选，1为多选
    var limit:Int?   //每个用户能投票数的最大值，只有当type为1时，此属性有效
    var aid:Int?     //投票所关联的投票版面的文章id
    /// "1"true
    var is_end:String?   //投票是否截止
    /// "1"true
    var is_deleted:String?  //投票是否被删除
    /// "1"true
    var is_result_voted:String? //投票结果是否投票后可见
    var user:User?   //投票发起人的用户元数据，如果该用户存在则为字符串
    var voted:AnyObject?   //当前用户的投票结果，如果用户已投票，则含有两个属性time(int)和viid(array)，分别表示投票的时间和所投选项的viid数组；如果用户没投票则为false
    var  options:[VoteOption]?  //投票选项，由投票选项元数据组成的数组	只存在于/vote/:id中

}



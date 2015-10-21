//
//  VoteOption.swift
//  我邮
//
//  Created by Jason on 15/5/27.
//  Copyright (c) 2015年 KyleRuan. All rights reserved.
//

import Foundation

//投票选项元数据
struct VoteOption {
    var viid:Int?  //投票选项标识id
    var label:String?  //选项内容
    var num:Int?  //改选项已投票数，如果设置投票后可见且还没投票这个值为-1
}



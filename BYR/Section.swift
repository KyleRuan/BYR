//
//  Section.swift
//  BYR
//
//  Created by Jason on 15/11/29.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation


class Section:NSObject{
    var  name:String?	//分区名称
    var  descriptions  :String?	//分区表述
    var is_root:Bool?	//是否是根分区
    var parent:String?	//该分区所属根分区名称
}
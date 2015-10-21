//
//  Zone.swift
//  Byr
//
//  Created by Jason on 15/10/18.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation

struct Zone {
    var name:String?  //分区名称
    var description:String?//分区表述
    var is_root:Bool? //是否是根分区
    var parent:String? //该分区所属根分区名称
}

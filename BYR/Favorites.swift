//
//  Favorites.swift
//  Byr
//
//  Created by Jason on 15/10/18.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation

class Favorites:NSObject{
    var  level:Int? //收藏夹级数，顶层收藏夹level为0
    var descriptions:String? //收藏夹目录
    var position:Int?//	收藏夹目录位置，该值用于删除收藏夹目录
}

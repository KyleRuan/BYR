//
//  Paging.swift
//  Byr
//
//  Created by Jason on 15/10/18.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation
import RealmSwift
class Pagination:Object  {
   dynamic var page_all_count:Int   = 0//总页数
  dynamic  var page_current_count:Int  = 0// 当前页数
  dynamic  var item_page_count:Int = 0//每页元素个数
   dynamic var item_all_count:Int  = 0//所有元素个数
}


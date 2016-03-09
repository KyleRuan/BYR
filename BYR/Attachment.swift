//
//  Attachment.swift
//  我邮
//
//  Created by Jason on 15/5/25.
//  Copyright (c) 2015年 KyleRuan. All rights reserved.
//

import Foundation
import RealmSwift

class Attachment:Object {
//     let file = List<AttachmentFile>()
  dynamic  var file:Array<AttachmentFile>?//文件列表
//    let file = List<AttachmentFile>()
    dynamic var remain_space:String?//剩余空间大小
    dynamic  var remain_count:Int = 0 //	剩余附件个数

//       let tasks = List<Task>()
    
    
   override static func ignoredProperties() -> [String] {
        
        return ["file"]
    
    
    }
    
}

//List<Task>()
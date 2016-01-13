//
//  Attachment.swift
//  我邮
//
//  Created by Jason on 15/5/25.
//  Copyright (c) 2015年 KyleRuan. All rights reserved.
//

import Foundation

class Attachment:NSObject {
    var file:[AttachmentFile]?   //文件列表
    var remain_space:String?//剩余空间大小
    var remain_count:Int?  //	剩余附件个数
}
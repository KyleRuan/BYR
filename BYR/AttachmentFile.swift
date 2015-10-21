//
//  AttachmentFile.swift
//  Byr
//
//  Created by Jason on 15/10/18.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation

struct AttachmentFile{
    var name:String? //文件名
    var url:String?  //文件链接，在用户空间的文件，该值为空
    var size:String? //文件大小
    var thumbnail_small:String? //小缩略图链接(宽度120px)，用户空间的文件，该值为空	附件为图片格式(jpg,png,gif)
    var thumbnail_middle:String? //中缩略图链接(宽度240px)，用户空间的文件，该值为空	附件为图片格式(jpg,png,gif)
}

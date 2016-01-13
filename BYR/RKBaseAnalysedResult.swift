//
//  BaseAnalysedResult.swift
//  BYR
//
//  Created by Jason on 15/11/28.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation


struct RKBaseAnalysedResult{
    var  range:NSRange?
    var data:AnyObject?
    var type:RKRichTextRunType!
    init(type:RKRichTextRunType){
        self.type = type
    
    }
//    var text:NSString?
    
}
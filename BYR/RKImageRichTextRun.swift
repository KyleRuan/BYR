//
//  RKImageRichTextRun.swift
//  BYR
//
//  Created by Jason on 15/11/28.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation


class RKImageRichTextRun:RKBaseRichTextRun{
    let type = RKRichTextRunType.RKRichTextRunTypeImage
    var  size = CGSizeZero
    
    init(base:RKBaseRichTextRun,type:RKRichTextRunType){
        
    }
    
    func analyseText(text:NSString)->RKBaseAnalysedResult{
        var  result = RKBaseAnalysedResult()
        //查找附件，主要是图片
      let   regexStr = "\\[upload=\\w*\\]\\[/upload\\]"
      let   regex = try! NSRegularExpression(pattern: regexStr, options: [])
        
        
        let arrayOfAllMathchedImage = regex.matchesInString(text as String, options: [], range: NSMakeRange(0, text.length))
        
        for imageInfo in arrayOfAllMathchedImage {
            
                 result.range = imageInfo.range
        }
        
            return result
    }
    
    
    func drawRichText(analysed:RKBaseAnalysedResult){
        
    }
}
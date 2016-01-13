//
//  RKURLRichTextRun.swift
//  BYR
//
//  Created by Jason on 15/12/3.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation


class RKURLRichTextRun:RKBaseRichTextRun{
    
    var  result:Array<RKBaseAnalysedResult>! = []
    func analyseText(text: NSString, entity: TopicModelEnity?) {
        //查找表情
       let  regexStr = "\\[url=[a-zA-z]+://[^\\s]*\\[/url\\]"
       let regex = try! NSRegularExpression(pattern: regexStr, options: [])
       let arrayOfAllMathchedURL = regex.matchesInString(text as String, options: [], range: NSMakeRange(0, text.length))
        
        
     
        for url in arrayOfAllMathchedURL {
            var urlText = RKBaseAnalysedResult(type: RKRichTextRunType.RKRichTextRunTypeURL)
            let urlString = text.substringWithRange(url.range) as NSString
            let tempRange = urlString.rangeOfString("[url=")
            let urls = urlString.substringFromIndex(tempRange.location+tempRange.length).componentsSeparatedByString("]")[0]
            let contentURL = urlString.substringFromIndex(tempRange.location+tempRange.length).componentsSeparatedByString("]")[1].componentsSeparatedByString("[")[0]
            
              urlText.range = text.rangeOfString(contentURL)
              urlText.data = urls
//            linkTextStorage.font = UIFont.systemFontOfSize(18)
//            linkTextStorage.textColor = UIColor.blueColor()
//            linkTextStorage.linkData = urls
            result.append(urlText)
            
        }

     
    }
    
    func drawRichText(size:CGSize) ->[AnyObject]
{
        var tmpArray:Array<TYLinkTextStorage> = []
        for drawText in result where drawText.type == RKRichTextRunType.RKRichTextRunTypeURL{
            let  urlStorage = TYLinkTextStorage()
            urlStorage.range = drawText.range!
            urlStorage.linkData = drawText.data
            tmpArray.append(urlStorage)
        }
        
        return tmpArray
    }

}

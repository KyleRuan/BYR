//
//  RKEmojiRichTextRun.swift
//  BYR
//
//  Created by Jason on 15/12/3.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation


class RKEmojiRichTextRun:RKBaseRichTextRun{
      var  result:Array<RKBaseAnalysedResult>! = []
    func analyseText(inout text: NSString,entity json:TopicModelEnity? = nil ){
        //查找表情
        let  regexStr  = "\\[em[a,b,c]{0,1}\\d+\\]"
        let   regex = try! NSRegularExpression(pattern: regexStr, options: [])
        let arrayOfAllMathchedEmoji = regex.matchesInString(text as String, options: [], range: NSMakeRange(0, text.length))
        
       
        
        for emoji in arrayOfAllMathchedEmoji {
            
            var analyse = RKBaseAnalysedResult(type: RKRichTextRunType.RKRichTextRunTypeEmoji)
            analyse.range = emoji.range
            let  gifName = text.substringWithRange(NSMakeRange(emoji.range.location, emoji.range.length))
            let gif = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource(gifName, ofType: "gif")!)!
            analyse.data = gif
        
            result.append(analyse)
        }
        
    }
    
    func drawRichText(size:CGSize)->[AnyObject]
{
        var tmpArray:Array<TYImageStorage> = []
        for drawText in result where drawText.type == RKRichTextRunType.RKRichTextRunTypeEmoji{
                let  imageStorage = TYImageStorage()
                 imageStorage.range = drawText.range!
            imageStorage.image = UIImage(data: (drawText.data as! NSData))
            imageStorage.size = CGSizeMake(36, 36)
            tmpArray.append(imageStorage)
        }
     
        return tmpArray
    }
    
    
}
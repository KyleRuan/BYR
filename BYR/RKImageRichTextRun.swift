//
//  RKImageRichTextRun.swift
//  BYR
//
//  Created by Jason on 15/11/28.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation


class RKImageRichTextRun:RKBaseRichTextRun{

    static  var  caches = NSCache()
    var  result:Array<RKBaseAnalysedResult>! = []
    func analyseText(text:NSString,entity: TopicModelEnity?){
                let token = UserAngent.sharedInstance.getAccessToken()
      //主要是图片
      let   regexStr = "\\[upload=\\w*\\]\\[/upload\\]"
      let   regex = try! NSRegularExpression(pattern: regexStr, options: [])
    let arrayOfAllMathchedImage = regex.matchesInString(text as String, options: [], range: NSMakeRange(0, text.length))
        for imageInfo in arrayOfAllMathchedImage {

            var imageText = RKBaseAnalysedResult(type: RKRichTextRunType.RKRichTextRunTypeImage)
            let substring = (text as NSString).substringFromIndex(imageInfo.range.location+8).componentsSeparatedByString("]").first

            //num 文件的下标
            if let num = Int(substring!){
                //大图: "url"//小图//中图:"thumbnail_middle"
                //附件为只有url
                if num > entity!.attachment!.count{
                    break
                }
                
                let urlStrig = entity!.attachment![num-1]["url"].stringValue
                if urlStrig.isEmpty {
                    print("附件")
                    continue
                }
                if let url = NSURL(string:"\(urlStrig)?oauth_token=\(token!)"){
                    if  RKImageRichTextRun.caches.objectForKey(urlStrig) != nil {
                         imageText.data = RKImageRichTextRun.caches.objectForKey(urlStrig)
                        print("cache")
                    }else{
                        let data = NSData(contentsOfURL: url)!
                        imageText.data = data
                        RKImageRichTextRun.caches.setObject(data, forKey: urlStrig)
                        print("network")
                    }
                }
                
                imageText.range = imageInfo.range
                
                result.append(imageText)
    
        }
        
    }
        
    }
    
    
    //自己定义一下我自己的view
    func drawRichText(size:CGSize)->[AnyObject]
{
        var tmpArray:Array<AnyObject> = []
        for drawText in result where drawText.type == RKRichTextRunType.RKRichTextRunTypeImage{
            let  imageStorage = TYImageStorage()
            imageStorage.range = drawText.range!
            print( imageStorage.range)
            let image = UIImage(data: (drawText.data as! NSData))
            
            
            
           
//            let height = CGFloat(CGImageGetHeight(image?.CGImage)) > size.height ? size.height:CGFloat(CGImageGetHeight(image?.CGImage))
            imageStorage.image = image
              imageStorage.size = CGSizeMake(size.width,size.width)
//            imageStorage.size = size
            tmpArray.append(imageStorage)
//            let zz = TYTextStorage()
//            zz.text = "\n"
//             tmpArray.append(zz)
            
        }
      
        return tmpArray
        }

    
}
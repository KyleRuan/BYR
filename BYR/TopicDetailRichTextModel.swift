//
//  TopicDetailRichTextModel.swift
//  BYR
//
//  Created by Jason on 15/11/11.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit
import CoreText

class RichTextHandle:NSObject{
    
    //Regex ：附件的 \\[upload=\\w*\\]\\[/upload\\]
    //表情：  "\\[em[a,b,c]{0,1}\\d+\\]"
    //  url : "[a-zA-z]+://[^\\s]*"
    //
//    let  regexStr = "\\[em[a,b,c]{0,1}\\d+\\]"
//    let  regex = try! NSRegularExpression(pattern: regexStr, options: [])
//    
//    let arrayOfAllMatches = regex.matchesInString(result2 as String, options: [], range: NSMakeRange(0,result2.length))
    
    
///
    ///
    ///
    ///
    
        
     static  var  caches = NSCache()
  class  func  textAddToRichTextViewWithRegex(cell :TopicDetailTableViewCell,entity:TopicModelEnity)-> UIView{
//        var runArray = NSMutableArray()
        let token = UserAngent.sharedInstance.getAccessToken()
        let label = TYAttributedLabel(frame: CGRectMake(0,0,CGRectGetWidth(cell.bounds)-5,0))
//          label.lineBreakMode = kCTLineBreakByTruncatingTail
    
//        label.delegate = self
        
//        label.delegate = cell.view
        
        label.lineBreakMode = CTLineBreakMode.ByCharWrapping
        
        let text = entity.content as NSString
    
        //查找表情
        var  regexStr  = "\\[em[a,b,c]{0,1}\\d+\\]"
        var  regex = try! NSRegularExpression(pattern: regexStr, options: [])
        let arrayOfAllMathchedEmoji = regex.matchesInString(text as String, options: [], range: NSMakeRange(0, text.length))
        
        let  attStringCreater = TYTextContainer()
        attStringCreater.lineBreakMode = CTLineBreakMode.ByCharWrapping
        attStringCreater.text = text as String
        let tmpArray = NSMutableArray()
        
        for emoji in arrayOfAllMathchedEmoji {
            
            let  imageStorage = TYImageStorage()
            imageStorage.imageName = text.substringWithRange(NSMakeRange(emoji.range.location, emoji.range.length))
            
           let gif = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource(imageStorage.imageName, ofType: "gif")!)!
        
            imageStorage.image = UIImage(data: gif)
            imageStorage.range = emoji.range
            imageStorage.size = CGSizeMake(36, 36)
            tmpArray.addObject(imageStorage)
        }
        
        //查找URL
        regexStr = "\\[url=[a-zA-z]+://[^\\s]*\\[/url\\]"
        regex = try! NSRegularExpression(pattern: regexStr, options: [])
        
         let arrayOfAllMathchedURL = regex.matchesInString(text as String, options: [], range: NSMakeRange(0, text.length))
        for url in arrayOfAllMathchedURL {
            let linkTextStorage = TYLinkTextStorage()
           let urlString = text.substringWithRange(url.range) as NSString
            let tempRange = urlString.rangeOfString("[url=")
            let urls = urlString.substringFromIndex(tempRange.location+tempRange.length).componentsSeparatedByString("]")[0]
            let contentURL = urlString.substringFromIndex(tempRange.location+tempRange.length).componentsSeparatedByString("]")[1].componentsSeparatedByString("[")[0]
        
 ///fix 当你修改了这个之后，之前得到range就出差了
            
            
            
            
//            attStringCreater.text = (attStringCreater.text as NSString).stringByReplacingCharactersInRange(url.range, withString: contentURL)
            linkTextStorage.range = (attStringCreater.text as NSString).rangeOfString(contentURL)
          
            linkTextStorage.font = UIFont.systemFontOfSize(18)
            linkTextStorage.textColor = UIColor.blueColor()
            linkTextStorage.linkData = urls
            tmpArray.addObject(linkTextStorage)
            
        }
        
        //查找附件，主要是图片
        regexStr = "\\[upload=\\w*\\]\\[/upload\\]"
        regex = try! NSRegularExpression(pattern: regexStr, options: [])
        
        
        let arrayOfAllMathchedImage = regex.matchesInString(text as String, options: [], range: NSMakeRange(0, text.length))
    
//      var tempYoffset:CGFloat  = 0
        for imageInfo in arrayOfAllMathchedImage {
            let  imageStorage = TYImageStorage()
           print(text.substringWithRange(imageInfo.range))
            
            
            let substring = (text as NSString).substringFromIndex(imageInfo.range.location+8).componentsSeparatedByString("]").first
            print(substring)
            if let num = Int(substring!){
//大图: "url"
//小图
//中图:"thumbnail_middle"
//附件为只有url
               
                
                if num > entity.attachment!.count{
                    break
                }
             let urlStrig = entity.attachment![num-1]["thumbnail_middle"].stringValue
                if urlStrig.isEmpty {
                    print("附件")
                    continue
                }
                if let url = NSURL(string:"\(urlStrig)?oauth_token=\(token!)"){
                    var image = UIImage()
                    if  caches.objectForKey(urlStrig) != nil {
                        image = caches.objectForKey(urlStrig) as! UIImage
                        print("cache")
                    }else{
                       
                        image = UIImage(data: NSData(contentsOfURL: url)!)!
                        caches.setObject(image, forKey: urlStrig)
                        print("network")
                    }
                    
                    imageStorage.image = image
 
                }else{
                   print("附件")
                }
             
                
            imageStorage.size = CGSizeMake(378*(cell.bounds.width)/600,378*(cell.bounds.width)/600)
         
                
//            imageStorage.size = CGSizeMake(200,200)
                
//                CGRectIntersectsRect(imageStorage.rect, imageStorage)
        
                
           
                imageStorage.range = imageInfo.range
              
                
            tmpArray.addObject(imageStorage)
    
            }


        }
        
        
        
        
        attStringCreater.addTextStorageArray(tmpArray as [AnyObject])
        tmpArray.removeAllObjects()
        

   
  attStringCreater.createTextContainerWithTextWidth(UIScreen.mainScreen().bounds.width-5)
         label.textContainer = attStringCreater
         label.sizeToFit()
        return label
    }
    
    func stringToAttributedString(){
        
    }
    
}





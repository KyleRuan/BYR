//
//  TopicDetailRichTextModel.swift
//  BYR
//
//  Created by Jason on 15/11/11.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit

class RichTextHandle {
    
    //Regex ：附件的\[upload=\w*\]\[\\upload\]
    //表情：
    func textAddToRichTextView(cell:TopicDetailTableViewCell,entity:TopicModelEnity)->UIView{
        let token = UserAngent.sharedInstance.getAccessToken()
        let  label = TYAttributedLabel(frame: CGRectMake(0,0,CGRectGetWidth(cell.bounds),0))
//        label.delegate = cell.
        let text = entity.content
        
        
        let textArray = text!.componentsSeparatedByString("\n")
        
        
        
        if entity.has_attachment {
            //有图片
            for var oneline in textArray {
                //continue
                //true 则是有图片
                while  oneline.containsString("[upload=") {
                    let imageRange  = oneline.rangeOfString("[upload=")
                
                    //substring就是图片的地址
                    let substring = oneline.substringFromIndex((imageRange?.endIndex)!).componentsSeparatedByString("]")[0]
                    let num = Int(substring)!
                   
                  
                    oneline.removeRange(oneline.rangeOfString("[upload=\(num)][/upload]")!)
//                    let urlStrig = entity.attachment![num-1]["thumbnail_middle"].stringValue
                    let urlStrig = entity.attachment![num-1]["url"].stringValue
                    if !urlStrig.isEmpty {
                        //为图片
                        let imageUrlStorage  = TYImageStorage()
                        
                        let url = NSURL(string:"\(urlStrig)?oauth_token=\(token!)")
        
                       
                        let image = UIImage(data: NSData(contentsOfURL: url!)!)
                        imageUrlStorage.image = image
                        
//                           imageUrlStorage.size = CGSizeMake(CGRectGetWidth(label.frame), 350*CGRectGetWidth(label.frame)/600)
                        imageUrlStorage.size = CGSizeMake((cell.bounds.width),(cell.bounds.width))
                      
    
                        label.appendTextStorage(imageUrlStorage)
                        label.appendText("\n")
                        
                    }else{
                        //FIXME: 非图片附件
                    }
                    
                }
                    //FIXME: url的处理和识别点击等操作
                    //文字的时候
//                 [attributedString addAttributeFont:[UIFont systemFontOfSize:15+arc4random()%4]];
                    var ll = oneline as NSString
//                  ll.
                    let attributedString = NSMutableAttributedString(string: oneline)
                   attributedString.addAttributeFont(UIFont.systemFontOfSize(18))
                    label.appendTextAttributedString(attributedString)
                    label.appendText("\n")
                
                //            scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(label.frame)+10)
            }
            
        }else {
            //无图片
            for var oneline in textArray{
//                oneline.insert("\n", atIndex: 20)
                let attributedString = NSMutableAttributedString(string: oneline)
                 attributedString.addAttributeFont(UIFont.systemFontOfSize(18))
                label.appendTextAttributedString(attributedString)
                label.appendText("\n")
                
            }
            
        }

        return label
    }
    
}

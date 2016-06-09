//
//  UIImageExtension.swift
//  BYR
//
//  Created by Jason on 5/21/16.
//  Copyright © 2016 KYLERUAN. All rights reserved.
//

import UIKit


extension UIImage {
    static func borderCircleImage(image:UIImage,borderWidth:CGFloat,borderColor:UIColor,size:CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width, size.height), false, 0)
        
        // avatar居中，直径为80的园
        // 要求这个图片是  Width= Height
        let imageWH = image.size.width ;
        let ovalWH = imageWH+borderWidth*2
        UIGraphicsBeginImageContext(CGSizeMake(ovalWH, ovalWH))
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), false, 0)
        let path = UIBezierPath(ovalInRect: CGRectMake(0, 0, ovalWH, ovalWH))
        borderColor.set()
        path.fill()
        let clipPath = UIBezierPath(ovalInRect: CGRectMake(borderWidth, borderWidth, imageWH, imageWH))
        clipPath.addClip()
        image.drawAtPoint(CGPointMake(borderWidth, borderWidth))
        let clipImage = UIGraphicsGetImageFromCurrentImageContext();
        //        //
        //        // 6.关闭上下文
        UIGraphicsEndImageContext();
        //        //
        //
        return clipImage
        //
    }
    
    static func scaleTosizeImage(image:UIImage,size:CGSize)->UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let scaled = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaled
    }
    
    
    
    func scaleToSize()->UIImage{
        
        let width = min(Screen.width, self.size.width )
        
        let scale:CGFloat =  self.size.height/self.size.width
        
        
        let height:CGFloat = width*scale
        
        UIGraphicsBeginImageContext(CGSizeMake(width, height))
        
        self.drawInRect(CGRectMake(0, 0, width, height))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        return scaledImage

    }
    
    
    
    
}

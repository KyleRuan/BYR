//
//  setupLoadingView.swift
//  BYR
//
//  Created by Jason on 15/12/29.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation

class setupLoadingView{
//    init
    
    class func markView( view:UIView)->UIView{
        
        
        
        let maskLayer = CALayer()
        
        maskLayer.position = view.center
        maskLayer.bounds = CGRectMake(0, 0, 120, 120)
        maskLayer.contents = UIImage(named: "LoadIN")?.CGImage
        
        
        let  maskBackgroundView = UIView(frame: view.bounds)
        maskBackgroundView.backgroundColor = UIColor.whiteColor()

         view.layer.mask = maskLayer

        
        return view
    }
    
    
}

//
//  ImageDisplayView.swift
//  BYR
//
//  Created by Jason on 16/2/6.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import UIKit


class ImageDisplayView :UIImageView{
    
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        self.frame = frame
        
        
    }

    convenience init(frame: CGRect,image:UIImage) {
        self.init(frame:frame)
        self.image = image
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
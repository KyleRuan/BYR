//
//  userAvatarView.swift
//  BYR
//
//  Created by Jason on 16/5/20.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import UIKit

class userAvatarView: UIView {

    var avatar:String!
    
    
   
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        avatar = ""
    }
    
    convenience init(avatar:String) {
        self.init(frame:CGRectZero)
        self.avatar = avatar
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    

    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  userAvatarView.swift
//  BYR
//
//  Created by Jason on 16/5/20.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import UIKit

class userAvatarView: UIView {
        
        //    let screenW = UIScreen.mainScreen().bounds.width
        let screenH = UIScreen.mainScreen().bounds.height
        //
        
        var ImageBG:UIImage!{
            didSet{
            
                let scaleImgae = UIImage.scaleTosizeImage(ImageBG, size: CGSizeMake(self.bounds.width,self.bounds.height))
              ImageBG = scaleImgae
                
                setNeedsDisplay()
            }
        }
    var avatarRadius:CGFloat = 40{
        didSet{
            addAvatar()
        }
    }
        var rectColor = UIColor.blueColor()
    var borderWidth:CGFloat=2 {
        didSet{
            addAvatar()
        }
    }
        var avatar:UIImage!{
            didSet{
                addAvatar()
            }
        }
        
        override  init(frame: CGRect) {
            super.init(frame: frame)
            addAvatar()
            
//            self.bounds.c
            
        }
        
    
        //
    convenience init(frame:CGRect,backgroundImage:UIImage,avatarImage:UIImage,avatarRadius:CGFloat = 40) {
            //      let screenW = UIScreen.mainScreen().bounds.width
            self.init(frame: frame)
            ImageBG = UIImage.scaleTosizeImage(backgroundImage, size: CGSizeMake(self.bounds.width,self.bounds.height))
            self.avatarRadius = avatarRadius
            
            avatar = avatarImage
            addAvatar()
            
            
        }
        
        
        
        
        private func addAvatar() {
            if avatar == nil {
                avatar = UIImage(named: "face_default_m")
            }
            let imageViewSizeX = UIScreen.mainScreen().bounds.midX-(avatarRadius+borderWidth)
            let imageViewSizeY = self.bounds.maxY
            let imageView = UIImageView(frame: CGRectMake(imageViewSizeX, imageViewSizeY-2*(avatarRadius+borderWidth),2*(avatarRadius+borderWidth), 2*(avatarRadius+borderWidth)))
            let scaleImgae = UIImage.scaleTosizeImage(avatar, size: CGSizeMake(avatarRadius*2,avatarRadius*2))
            let avatars = UIImage.borderCircleImage(scaleImgae, borderWidth: borderWidth, borderColor:rectColor,size: CGRectMake(0,0,avatarRadius*2,avatarRadius*2))
            imageView.image = avatars
            self.clipsToBounds = false
            self.addSubview(imageView)
            
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        
        // Only override drawRect: if you perform custom drawing.
        // An empty implementation adversely affects performance during animation.
        override func drawRect(rect: CGRect) {
            // Drawing code
            if ImageBG == nil {
                // backgroundView
                ImageBG = UIImage(named: "userInfBackground")
            }
            
            
            ImageBG?.drawInRect(self.bounds)
        }
        
        
    }
    



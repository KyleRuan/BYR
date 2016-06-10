//
//  userAvatarView.swift
//  BYR
//
//  Created by Jason on 16/5/20.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import UIKit

class userAvatarView: UIView {
  let screenH = Screen.height
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

  var user:User!
  override  init(frame: CGRect) {
    super.init(frame: frame)
    addAvatar()
  }
  private  var avatarFrame:CGRect!

  private func addAvatar() {
    if avatar == nil {
      avatar = UIImage(named: "face_default_m")
    }
    let imageViewSizeY = self.bounds.maxY
    let imageViewSizeX = Screen.bounds.midX-(avatarRadius+borderWidth)
    avatarFrame = CGRectMake(imageViewSizeX, imageViewSizeY-2*(avatarRadius+borderWidth),
            2*(avatarRadius+borderWidth), 2*(avatarRadius+borderWidth))

    let imageView = UIImageView(frame: avatarFrame)
    let scaleImgae = UIImage.scaleTosizeImage(avatar, size: CGSizeMake(avatarRadius*2,avatarRadius*2))
    let avatars = UIImage.borderCircleImage(scaleImgae, borderWidth: borderWidth, borderColor:rectColor,
            size: CGRectMake(0,0,avatarRadius*2,avatarRadius*2))
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
    if ImageBG == nil {
      ImageBG = UIImage(named: "userInfBackground")
    }
    ImageBG?.drawInRect(self.bounds)
    let path = UIBezierPath()
    let pathY = CGRectGetMidY(avatarFrame)+30
    path.moveToPoint(CGPointMake(0, pathY))
    path.addLineToPoint(CGPointMake(Screen.width,pathY))
    path.lineWidth = borderWidth
    rectColor.set()
    path.stroke()
    let label = UILabel()
    label.text = user.id
    label.sizeToFit()
    let rect = CGRectMake(avatarFrame.origin.x-label.bounds.width, pathY-label.bounds.height, label.bounds.width, label.bounds.height)
    label.drawTextInRect(rect)
    label.text = user.level
    label.sizeToFit()
    let rect2 = CGRectMake(CGRectGetMaxX(avatarFrame), pathY-label.bounds.height, label.bounds.width, label.bounds.height)
    label.drawTextInRect(rect2)
  }


}




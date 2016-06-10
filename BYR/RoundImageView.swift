//
//  RoundImageView.swift
//  CloundIM
//
//  Created by Jason on 15/9/23.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit



@IBDesignable
class RoundImageView: UIImageView {

  /*
  // Only override drawRect: if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  override func drawRect(rect: CGRect) {
      // Drawing code
  }
  */
  var userId:String!


  @IBInspectable var cornerRadius:CGFloat = 0{
    didSet{
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = (cornerRadius>0)
    }
  }

  @IBInspectable var borderWidth:CGFloat = 0{
    didSet{
      layer.borderWidth = borderWidth
    }
  }


  //用CGColor面板不显示
  @IBInspectable var borderColor:UIColor?{
    didSet{
      layer.borderColor = borderColor?.CGColor
    }
  }


  override init(frame: CGRect) {
    super.init(frame: frame)
    self.userInteractionEnabled = true
    userId = ""

  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    userId = ""
    self.userInteractionEnabled = true
  }

  

  
}



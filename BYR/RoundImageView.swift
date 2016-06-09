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
    
    
    
    
//    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
//        if self.userId != "" {
//            return self
//        } else {
//            return super.hitTest(point, withEvent: event)
//        }
//    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
       let token = UserAngent.sharedInstance.getAccessToken()
        APIClinet.sharedInstance.getUserInfo(token!, userId: userId, success: { (json) in
            print(json)
               let user = User.mj_objectWithKeyValues(json.object)
            self.modalToUserInfo(user)
            }) { (error) in
                print(error)
        }
     
    }
    
    
    func modalToUserInfo(user:User?) {
        guard let userInfo = user else {
            return
        }
        
        let story = UIStoryboard(name: "Setting", bundle: nil)
        guard let  vc = story.instantiateViewControllerWithIdentifier("SettingTableViewController") as? SettingTableViewController else {
            return
        }
        
        let navigator = UINavigationController(rootViewController: vc)
        navigator.navigationBar.backgroundColor = UIColor(red: 49, green: 183, blue: 254, alpha: 1)
       navigator.navigationBar.barTintColor = UIColor(red: 49, green: 183, blue: 254, alpha: 1)

        vc.type = .Others
        vc.user = userInfo
        UserInfowindow.rootViewController = navigator
        UserInfowindow.windowLevel = UIWindowLevelAlert+1
        UserInfowindow.makeKeyAndVisible()
 
    }
}



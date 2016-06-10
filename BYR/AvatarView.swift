//
//  AvatarView.swift
//  BYR
//
//  Created by Jason on 6/10/16.
//  Copyright © 2016 KYLERUAN. All rights reserved.
//

import UIKit
class AvatarView: RoundImageView {

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
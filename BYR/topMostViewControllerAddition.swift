//
//  topMostViewControllerAddition.swift
//  Byr
//
//  Created by Jason on 15/10/16.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//


import UIKit







extension UIApplication {
    
    class func topMostViewController() -> UIViewController?{
        var  topController = UIApplication.sharedApplication().keyWindow?.rootViewController
        while topController?.presentedViewController != nil {
            topController = topController?.presentedViewController
        }
        return topController
    }
    
}


extension UIViewController {
     func topMostViewController() -> UIViewController? {
        if let presentedViewController = self.presentedViewController {
            return presentedViewController.topMostViewController()
        }else {
            for view in self.view.subviews {
                if let subViewController = view.nextResponder() where subViewController is UIViewController{
                    let viewController = subViewController as! UIViewController
                    return viewController.topMostViewController()
                    
                }
            }
         }
        return self

    }
}


extension UITabBarController {
    override func topMostViewController() -> UIViewController? {
         return self.selectedViewController?.topMostViewController()
    }
}


extension UINavigationController{
    override func topMostViewController() -> UIViewController? {
        return self.visibleViewController?.topMostViewController()
    }
}

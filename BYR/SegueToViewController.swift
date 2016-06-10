//
//  SegueToViewController.swift
//  BYR
//
//  Created by Jason on 15/11/4.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation

class SegueToViewController{
  static let sharedInstance = SegueToViewController()
  func  implementationSegue(selfViewController:AnyObject,segueTo:String){
    if let startViewController = selfViewController as? UIViewController{
      let story = UIStoryboard(name: "Main", bundle: nil)
      let vc = story.instantiateViewControllerWithIdentifier(segueTo)
      startViewController.view.window?.rootViewController = vc
      return
    }

    if let startViewController = selfViewController as?  AppDelegate {
      let story = UIStoryboard(name: "Main", bundle: nil)
      let vc = story.instantiateViewControllerWithIdentifier(segueTo)
      startViewController.window?.rootViewController = vc
      return
    }


  }
}

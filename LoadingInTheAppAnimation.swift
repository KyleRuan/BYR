//
//  LoadingInTheAppAnimation.swift
//  BYR
//
//  Created by Jason on 16/3/4.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import Foundation


class LoadingInPopAnimation {
    let frontView:UIView!
    var  backgroundView = UIView()
//    let frontView = self.tabBarController!.view
    var backgroundImageView = UIImageView()
    let transformAnimation = CAKeyframeAnimation(keyPath: "bounds")
    init(frontView:UIView?){
        self.frontView = frontView
    }

    init(){
        frontView = UIView()
    }

    func animationPop(){
        UIView.animateWithDuration(0.1, delay: 1.35, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.backgroundView.alpha = 0
        }) { (done) -> Void in
            self.backgroundView.removeFromSuperview()
        }
        UIView.animateWithDuration(0.25, delay: 1.3, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            self.frontView.transform = CGAffineTransformMakeScale(1.05, 1.05)
        }) { (done) -> Void in
            if done{
                UIView.animateWithDuration(0.3,delay: 0.0,
                        options: UIViewAnimationOptions.CurveEaseInOut,
                        animations: {
                            self.frontView.transform = CGAffineTransformIdentity
                            self.backgroundImageView.alpha = 0
                        }){ (done) -> Void in
                    if done{
                        self.backgroundImageView.removeFromSuperview()
                        self.frontView.layer.mask  = nil
                    }
                }
            }
        }
    }

    func setUpAnimation(){
        //设置进入的动画
        let maskLayer = CALayer()
        maskLayer.position = (frontView?.center)!
        maskLayer.bounds = CGRectMake(0, 0, 120, 120)
        maskLayer.contents = UIImage(named: "LoadIN")?.CGImage
        frontView?.layer.mask = maskLayer
        backgroundView = UIView(frame: (frontView?.frame)!)
        backgroundView.backgroundColor = UIColor.whiteColor()
        frontView?.addSubview(backgroundView)
        frontView?.bringSubviewToFront(backgroundView)
        let  window =  UIApplication.sharedApplication().windows.last!
        backgroundImageView = UIImageView(frame: (self.frontView.frame))
        backgroundImageView.contentMode = .ScaleAspectFill
        backgroundImageView.image = UIImage(named: "LogBackground")
        window.insertSubview(backgroundImageView, belowSubview: frontView)
        //Animation
        transformAnimation.duration = 1
        transformAnimation.beginTime = CACurrentMediaTime() + 1
        let value1 = NSValue(CGRect: CGRect(x: 0, y: 0, width: 120, height: 120))
        let value2 = NSValue(CGRect: CGRect(x: 0, y: 0, width: 100, height: 100))
        let value3 = NSValue(CGRect:CGRect(x: 0, y: 0, width: 10000, height: 10000))
        transformAnimation.values = [value1,value2,value3]
        transformAnimation.keyTimes = [0,0.5,1]
        transformAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        transformAnimation.removedOnCompletion = false
        transformAnimation.fillMode = kCAFillModeForwards
        frontView?.layer.mask!.addAnimation(transformAnimation, forKey: "transformAnimation")
    }
}
//
//  CustomNavigationAnimationController.swift
//  CustomTransitions
//
//  Created by Jason on 16/1/6.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

import UIKit

class CustomNavigationAnimationController: NSObject ,UIViewControllerAnimatedTransitioning{
    var reverse = false
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()!
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let toView = toVC.view
        let fromView = fromVC.view
        let direction: CGFloat = reverse ? -1 : 1
        let const: CGFloat = -0.005
        toView.layer.anchorPoint = CGPointMake(direction == 1 ? 0:1, 0.5)
        fromView.layer.anchorPoint = CGPointMake(direction == 1 ? 1:0, 0.5)
        var viewFromTransform: CATransform3D = CATransform3DMakeRotation(direction * CGFloat(M_PI_2), 0.0, 1.0, 0.0)
        var viewToTransform: CATransform3D = CATransform3DMakeRotation(-direction * CGFloat(M_PI_2), 0.0, 1.0, 0.0)
        viewFromTransform.m34 = const
        viewToTransform.m34 = const
        //这个让两个View都缩小1倍
        containerView.transform = CGAffineTransformMakeTranslation(direction * containerView.frame.size.width / 2.0, 0)
        //toView先转过来
        toView.layer.transform = viewToTransform
        containerView.addSubview(toView)
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            containerView.transform = CGAffineTransformMakeTranslation(-direction * containerView.frame.size.width / 2.0, 0)
            fromView.layer.transform = viewFromTransform
            toView.layer.transform = CATransform3DIdentity
        }) { (_) -> Void in
            containerView.transform = CGAffineTransformIdentity
            fromView.layer.transform = CATransform3DIdentity
            toView.layer.transform = CATransform3DIdentity
            fromView.layer.anchorPoint = CGPointMake(0.5, 0.5)
            toView.layer.anchorPoint = CGPointMake(0.5, 0.5)
            if (transitionContext.transitionWasCancelled()) {
                toView.removeFromSuperview()
            } else {
                fromView.removeFromSuperview()
            }
            if !transitionContext.transitionWasCancelled(){
                transitionContext.completeTransition(true)
            }else{
                transitionContext.completeTransition(false)
            }
        }
    }
}

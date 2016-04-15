//
//  CustomInteractionController.swift
//  CustomTransitions
//
//  Created by Jason on 16/1/6.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

import UIKit

class CustomInteractionController:UIPercentDrivenInteractiveTransition {
    
    //为了获取controller
    var navigationController:UINavigationController!

    

  var shouldCompleteTransition = false
  var transitionInProgress = false
  var completionSeed: CGFloat {
       return 1 - percentComplete
   }
//    调用的时候需要调入这个VC
    func attachToViewController(viewController: UIViewController) {
        navigationController = viewController.navigationController
        setupGestureRecognizer(viewController.view)
    }
//
    private func setupGestureRecognizer(view: UIView) {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(CustomInteractionController.handlePanGesture(_:))))
    }
//
    func handlePanGesture(gestureRecognizer: UIPanGestureRecognizer) {
        
        let viewTranslation = gestureRecognizer.translationInView(gestureRecognizer.view!.superview!)
        switch gestureRecognizer.state {
        case .Began :
            transitionInProgress = true
            navigationController.popViewControllerAnimated(true)
        case .Changed:
            let  const = CGFloat(fminf(fmaxf(Float(viewTranslation.x / 200.0), 0.0), 1.0))
            shouldCompleteTransition = const > 0.5
           updateInteractiveTransition(const)
        case .Cancelled, .Ended:
            transitionInProgress = false
            if !shouldCompleteTransition || gestureRecognizer.state == .Cancelled {
                cancelInteractiveTransition()
            } else {
                finishInteractiveTransition()
            }
        default:
            print("Swift switch must be exhaustive, thus the default")
        }
    }

}

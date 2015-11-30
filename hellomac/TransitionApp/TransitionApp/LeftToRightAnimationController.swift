//
//  LeftToRightAnimationController.swift
//  TransitionApp
//
//  Created by Takayasu Sakai on 2015/12/01.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class LeftToRightAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let finalFrame = transitionContext.finalFrameForViewController(toViewController)
        
        let containerView = transitionContext.containerView()
        
        //遷移前の状態
        let screenBounds = UIScreen.mainScreen().bounds
        toViewController.view.frame = CGRectOffset(finalFrame, screenBounds.size.width * -1, 0)
        
        containerView?.addSubview(toViewController.view)
        
        let duration = transitionDuration(transitionContext)
        
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.frame = finalFrame
            }, completion:  {
                finished in
                transitionContext.completeTransition(true)
        })
    }
}

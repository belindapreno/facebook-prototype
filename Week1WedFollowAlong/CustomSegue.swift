//
//  CustomSegue.swift
//  Week1WedFollowAlong
//
//  Created by Belinda Preno on 9/2/14.
//  Copyright (c) 2014 bp. All rights reserved.
//

import UIKit

class CustomSegue: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    var isPresenting: Bool!
    var duration = 0.4
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        if (isPresenting == true) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(duration,
                delay: 0,
                options: nil,
                animations: {
                
                    
                    toViewController.view.alpha = 1
                    
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
            
        } else {
            
            UIView.animateWithDuration(duration/1.5,
                delay: 0,
                options: UIViewAnimationOptions.CurveEaseIn,
                animations: {

                    fromViewController.view.alpha = 0
                    toViewController.view.transform = CGAffineTransformIdentity
                    
                }, completion: { (finished: Bool) -> Void in
                    fromViewController.removeFromParentViewController()
                    transitionContext.completeTransition(true)
            })
        }
        
        
    }
}
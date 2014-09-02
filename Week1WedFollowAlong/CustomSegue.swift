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
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        if (isPresenting == true) {
            
            containerView.addSubview(toViewController.view)
            
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
            
        } else {
            
            UIView.animateWithDuration(0.4,
            animations: {
                
                fromViewController.view.alpha = 0
            
            }) { (finished: Bool) -> Void in
            
                fromViewController.removeFromParentViewController()
                transitionContext.completeTransition(true)
                
                
                println("animating end transition")
            
            }
        }
    }
}

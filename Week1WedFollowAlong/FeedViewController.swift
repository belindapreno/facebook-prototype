//
//  FeedViewController.swift
//  Week1WedFollowAlong
//
//  Created by Belinda Preno on 8/6/14.
//  Copyright (c) 2014 bp. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postImageView2: UIImageView!
    @IBOutlet var postImage1TapGesture: UITapGestureRecognizer!
    @IBOutlet var postImage2TapGesture: UITapGestureRecognizer!
    
    var tappedImageView: UIImageView!
    var isPresenting: Bool!
    var transition: CustomSegue!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        scrollView.contentSize = feedImageView.frame.size
    
    
    }

  
    @IBAction func onLikeButton(sender: AnyObject) {
        
        if (likeButton.selected) {
            likeButton.selected = false
        } else {
            likeButton.selected = true
        }
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func onTapPhoto(sender: AnyObject) {
        
        tappedImageView = sender.view as UIImageView
        
        performSegueWithIdentifier("photoCustomSegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        transition = CustomSegue()
        var duration = 0.4
        
        var window = UIApplication.sharedApplication().keyWindow
        var frame = window.convertRect(tappedImageView.frame, fromView: self.view)
        var newImageView = UIImageView(image: tappedImageView.image)
        newImageView.frame = frame
        newImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        window.addSubview(newImageView)
        
        transition.duration = duration
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            newImageView.frame = CGRect(x: 0, y: 52, width: 320, height: 480)
            }) { (finished: Bool) -> Void in
                UIView.animateWithDuration(0.4, animations: {
                    newImageView.alpha = 0
                    }, completion: { (finished: Bool) -> Void in
                        newImageView.removeFromSuperview()
                })
        }


            
        var destinationViewController = segue.destinationViewController as PhotoViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = transition
        destinationViewController.image = tappedImageView.image
        
    }
    
    
    
}
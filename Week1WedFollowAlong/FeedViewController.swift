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
        
        
        if segue.identifier == "photoCustomSegue" {

            var destinationVC = segue.destinationViewController as PhotoViewController
            var window = UIApplication.sharedApplication().keyWindow
            var frame = window.convertRect(tappedImageView.frame, fromView: self.scrollView)
            
            destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
            
            destinationVC.image = tappedImageView.image
            destinationVC.coordinates = frame
            destinationVC.originVC = self
            
            var duration = 0.3
            
            transition = CustomSegue()
            transition.duration = duration
            
            var newImage = UIImageView(image: tappedImageView.image)
            newImage.frame = frame
            newImage.contentMode = UIViewContentMode.ScaleAspectFit
            newImage.clipsToBounds = true
            
            var imageSize = newImage.image.size
            
            window.addSubview(newImage)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                newImage.frame = CGRect(x: 0, y: 80, width: 320, height: 480)
                newImage.center = window.center
                }) { (finished: Bool) -> Void in
                    UIView.animateWithDuration(0.1, animations: {
                        newImage.alpha = 0
                        }, completion: { (finished: Bool) -> Void in
                            newImage.removeFromSuperview()
                    })
            }
            
            destinationVC.transitioningDelegate = transition
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
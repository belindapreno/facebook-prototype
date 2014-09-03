//
//  PhotoViewController.swift
//  Week1WedFollowAlong
//
//  Created by Belinda Preno on 8/28/14.
//  Copyright (c) 2014 bp. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var photoImageView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoActionsImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    
    var image: UIImage!
    var coordinates: CGRect!
    var originVC: FeedViewController!
    var window = UIApplication.sharedApplication().keyWindow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(320,700)
        
        doneButton.alpha = 0
        photoActionsImageView.alpha = 0
        mainImageView.alpha = 0
        
        mainImageView.image = image
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        doneButton.alpha = 0
        photoActionsImageView.alpha = 0
        mainImageView.alpha = 1
        
        UIView.animateWithDuration(0.4, animations: {
            self.doneButton.alpha = 1
            self.photoActionsImageView.alpha = 1
        })
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        var offset = scrollView.contentOffset.y
        
        mainImageView.alpha = 0
        doneButton.alpha = 0
        photoActionsImageView.alpha = 0

        var destinationVC = originVC
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        var duration = 0.4
        
        var newImage = UIImageView(image: mainImageView.image)
        
        var frame = CGRect(x: 0, y: 0, width: 320, height: 480)
    
        newImage.frame = frame
        newImage.center = mainImageView.center
        newImage.center.y -= offset
        newImage.contentMode = UIViewContentMode.ScaleAspectFill
        newImage.clipsToBounds = true
        
        window.addSubview(newImage)
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            newImage.frame = self.coordinates
            }) { (finished: Bool) -> Void in
                UIView.animateWithDuration(0.1, animations: {
                    newImage.alpha = 0
                    }, completion: { (finished: Bool) -> Void in
                        newImage.removeFromSuperview()
                })
        }
        
    }
    
    @IBAction func onDoneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
        
        UIView.animateWithDuration(2, animations: {
            self.view.backgroundColor = UIColor(white: 0, alpha: 0)
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, animations: {
            self.doneButton.alpha = 0
            self.photoActionsImageView.alpha = 0
            }, completion: nil)
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            
            var yOffset = scrollView.contentOffset.y
            
            if yOffset < -20 {
                
                dismissViewControllerAnimated(true, completion: nil)
                
            } else {
                
                UIView.animateWithDuration(0.4, animations: {
                    self.doneButton.alpha = 1
                    self.photoActionsImageView.alpha = 1
                    self.view.backgroundColor = UIColor(white: 0, alpha: 1)
                    }, completion: nil)
                
            }
            
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        
        UIView.animateWithDuration(2, animations: {
            self.view.backgroundColor = UIColor(white: 0, alpha: 1)
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, animations: {
            self.doneButton.alpha = 1
            self.photoActionsImageView.alpha = 1
            }, completion: nil)
        
    }
    

}

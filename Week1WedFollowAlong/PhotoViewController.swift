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
    var transition: CustomSegue!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSizeMake(320,700)
        
        mainImageView.image = image
        mainImageView.hidden = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        mainImageView.hidden = false
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
            
        var y = scrollView.contentOffset.y
        
        if y < -20 {
            
            dismissViewControllerAnimated(true, completion: nil)

        } else {
            
            println("TEST")

            UIView.animateWithDuration(0.4, animations: {
                self.doneButton.alpha = 1
                self.photoActionsImageView.alpha = 1
                self.view.backgroundColor = UIColor(white: 0, alpha: 1)
            }, completion: nil)
            
        }
        
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
    
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
                
        transition = CustomSegue()
        var duration = 0.4
        
        var window = UIApplication.sharedApplication().keyWindow
        var frame = window.convertRect(mainImageView.frame, fromView: self.view)
        var newImageView = UIImageView(image: mainImageView.image)
        newImageView.frame = frame
        newImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        window.addSubview(newImageView)
        
        transition.duration = duration
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            newImageView.frame = CGRect(x: 16, y: 106, width: 288, height: 236)
            }) { (finished: Bool) -> Void in
                UIView.animateWithDuration(0.4, animations: {
                    newImageView.alpha = 0
                    }, completion: { (finished: Bool) -> Void in
                        newImageView.removeFromSuperview()
                })
        }
        
        
    }
    


}

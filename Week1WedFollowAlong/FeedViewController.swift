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
    
    @IBAction func onTapPhoto(sender: AnyObject) {
        performSegueWithIdentifier("photoCustomSegue", sender: self)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as PhotoViewController
        
        
        destinationViewController.image = self.postImageView.image    
        
    }

}

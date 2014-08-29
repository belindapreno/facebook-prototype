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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        scrollView.contentSize = feedImageView.frame.size
    
    
    }
    
//    scrollView.contentInset.top = 0
//    scrollView.scrollIndicatorInset.top=0

  
    @IBAction func onLikeButton(sender: AnyObject) {
        
        if (likeButton.selected) {
            likeButton.selected = false
        } else {
            likeButton.selected = true
        }
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//
//  LightBoxTransition.swift
//  Facebook
//
//  Created by Rachel Jin on 11/9/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class LightBoxTransition: BaseTransition {
    
//    var originalY: CGFloat!
    var blackView: UIView!
    
    var transitionImageView: UIImageView!
    var endTransitionImageView: UIImageView!
    var window = UIApplication.shared.keyWindow!

    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        
        
//        originalY = toViewController.view.frame.origin.y
//        
//        toViewController.view.alpha = 0
//        toViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
//        
        blackView = UIView()
        blackView.frame = fromViewController.view.bounds
        blackView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        blackView.alpha = 0
        fromViewController.view.addSubview(blackView)
//
//        UIView.animate(withDuration: 0.5, animations: {
//            self.blackView.alpha = 0.9
//            
//            toViewController.view.alpha = 1
//            toViewController.view.transform = CGAffineTransform(scaleX: 1, y: 1)
//        }) { (finished: Bool) -> Void in
//            self.finish()
//        }
        
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        var frame = window.convert(feedViewController.selectedImageView.frame, from: feedViewController.scrollView)
        
        transitionImageView = UIImageView(frame: frame)
        transitionImageView.contentMode = UIViewContentMode.scaleAspectFit
        transitionImageView.image = feedViewController.selectedImageView.image
        window.addSubview(transitionImageView)
        
        toViewController.view.alpha = 0
        fromViewController.view.alpha = 1
        
        UIView.animate(withDuration: duration, animations: {
            self.transitionImageView.frame = photoViewController.imageView.frame
            self.blackView.alpha = 0.9
        }) { (finished: Bool) -> Void in
            toViewController.view.alpha = 1
            self.transitionImageView.removeFromSuperview()
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
//        fromViewController.view.transform = CGAffineTransform(scaleX: 1, y: 1)
//        
        blackView.alpha = 0.9
//        fromViewController.view.alpha = 1
//        
//        UIView.animate(withDuration: 0.5, animations: {
//            self.blackView.alpha = 0
//            fromViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
//            fromViewController.view.alpha = 0
//            
//        }) { (finished: Bool) -> Void in
//            
//            self.blackView.removeFromSuperview()
//            self.finish()
//        }
        
        let tabBarViewController = toViewController as! UITabBarController
        
        let navigationController = tabBarViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as!FeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        
        var frame = window.convert(feedViewController.selectedImageView.frame, from: feedViewController.scrollView)
        var endFrame = window.convert(feedViewController.selectedImageView.frame, from: feedViewController.scrollView)
        
        endTransitionImageView = UIImageView(frame: frame)
        endTransitionImageView.image = photoViewController.imageView.image
        endTransitionImageView.contentMode = UIViewContentMode.scaleAspectFit
        window.addSubview(endTransitionImageView)
        
        fromViewController.view.alpha = 0
        toViewController.view.alpha = 1
        
        UIView.animate(withDuration: duration, animations: {
            self.blackView.alpha = 0
            self.endTransitionImageView.frame = endFrame
            
        }) { (finished: Bool) -> Void in
            self.endTransitionImageView.removeFromSuperview()
            self.blackView.removeFromSuperview()
            self.finish()
        }
    }
}

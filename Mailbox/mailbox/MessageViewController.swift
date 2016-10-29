//
//  MessageViewController.swift
//  mailbox
//
//  Created by Rachel Jin on 10/26/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIView!
    @IBOutlet weak var archiveIconView: UIImageView!
    @IBOutlet weak var deleteIconView: UIImageView!
    @IBOutlet weak var greenImageView: UIView!
    @IBOutlet weak var redImageView: UIView!
    
    var messageOriginalCenter: CGPoint!
    var leftOriginalCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize = feedImageView.frame.size
        
        deleteIconView.alpha = 0
        archiveIconView.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didPanMessage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        //var velocity = sender.velocity(in: view)

        
        if sender.state == .began {
            messageOriginalCenter = messageImageView.center
            leftOriginalCenter = leftImageView.center
            
        } else if sender.state == .changed {
            
            messageImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x , y: messageOriginalCenter.y)
            
            if translation.x > 60 && translation.x < 260 {
                
                leftImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x - 375, y: leftOriginalCenter.y)
                UIView.animate(withDuration: 0.3, animations:{
                    self.deleteIconView.alpha = 0
                    self.archiveIconView.alpha = 1
                    self.greenImageView.alpha = 1
                    self.redImageView.alpha = 0}, completion: nil)
            }else if translation.x >= 260 {
                
                leftImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x - 375, y: leftOriginalCenter.y)
                UIView.animate(withDuration: 0.3, animations:{
                    self.deleteIconView.alpha = 1
                    self.archiveIconView.alpha = 0
                    self.greenImageView.alpha = 0
                    self.redImageView.alpha = 1}, completion: nil)
            }

        }else if sender.state == .ended {
            
            UIView.animate(withDuration: 0.3, animations: {
                self.leftImageView.center = CGPoint(x: 0, y: self.leftOriginalCenter.y)
                self.messageImageView.center = self.messageOriginalCenter
                self.deleteIconView.alpha = 0
                self.archiveIconView.alpha = 0
                self.greenImageView.alpha = 1
                self.redImageView.alpha = 1
                }, completion: nil)
        }
  
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

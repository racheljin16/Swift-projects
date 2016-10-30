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
    @IBOutlet weak var rightImageView: UIView!
    @IBOutlet weak var yellowImageView: UIView!
    @IBOutlet weak var brownImageView: UIView!
    @IBOutlet weak var listIconView: UIImageView!
    @IBOutlet weak var laterIconView: UIImageView!
    @IBOutlet weak var rescheduleImageView: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    
    var messageOriginalCenter: CGPoint!
    var leftOriginalCenter: CGPoint!
    var rightOriginalCenter: CGPoint!
    var scrollOriginalCenter: CGPoint!
    var rescheduleOriginalCenter: CGPoint!
    var listOriginalCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize = feedImageView.frame.size
        
        deleteIconView.alpha = 0
        archiveIconView.alpha = 0
        laterIconView.alpha = 0
        listIconView.alpha = 0
        rescheduleImageView.alpha = 0
        listImageView.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didPanMessage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        var velocity = sender.velocity(in: view)
        let p = abs(translation.x)/60
        
        if sender.state == .began {
            messageOriginalCenter = messageImageView.center
            leftOriginalCenter = leftImageView.center
            rightOriginalCenter = rightImageView.center
            scrollOriginalCenter = scrollView.center
            rescheduleOriginalCenter = rescheduleImageView.center
            listOriginalCenter = listImageView.center
            
        } else if sender.state == .changed {
            
            messageImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            if translation.x >= 0 && translation.x < 60{
                
                self.archiveIconView.alpha = p
                self.yellowImageView.alpha = 0
                self.brownImageView.alpha = 0
                self.listIconView.alpha = 0
                self.laterIconView.alpha = 0
                self.redImageView.alpha = 0
                self.greenImageView.alpha = 0
            }else if translation.x > 60 && translation.x < 260 {
                
                leftImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x - 375, y: leftOriginalCenter.y)
                rightImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x + 375, y: messageOriginalCenter.y)
                UIView.animate(withDuration: 0.3, animations:{
                    self.deleteIconView.alpha = 0
                    self.archiveIconView.alpha = 1
                    self.greenImageView.alpha = 1
                    self.redImageView.alpha = 0
                    }, completion: nil)
            }else if translation.x >= 260 {
                
                leftImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x - 375, y: leftOriginalCenter.y)
                rightImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x + 375, y: messageOriginalCenter.y)
                UIView.animate(withDuration: 0.3, animations:{
                    self.deleteIconView.alpha = 1
                    self.archiveIconView.alpha = 0
                    self.greenImageView.alpha = 0
                    self.redImageView.alpha = 1
                    }, completion: nil)
            }else if translation.x > -60 && translation.x <= 0 {
                
                self.laterIconView.alpha = p
                self.redImageView.alpha = 0
                self.greenImageView.alpha = 0
                self.deleteIconView.alpha = 0
                self.archiveIconView.alpha = 0
                self.yellowImageView.alpha = 0
                self.brownImageView.alpha = 0
            }else if translation.x < 0 && translation.x > -260 {
            
                leftImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x - 375, y: leftOriginalCenter.y)
                rightImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x + 375, y: messageOriginalCenter.y)
                UIView.animate(withDuration: 0.3, animations: {
                    self.laterIconView.alpha = 1
                    self.listIconView.alpha = 0
                    self.yellowImageView.alpha = 1
                    self.brownImageView.alpha = 0
                    }, completion: nil)
            }else if translation.x < -260 {
            
                leftImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x - 375, y: leftOriginalCenter.y)
                rightImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x + 375, y: messageOriginalCenter.y)
                UIView.animate(withDuration: 0.3, animations: {
                    self.listIconView.alpha = 1
                    self.laterIconView.alpha = 0
                    self.yellowImageView.alpha = 0
                    self.brownImageView.alpha = 1
                    }, completion: nil)
            }

        }else if sender.state == .ended {
            
            if velocity.x > 0 && translation.x < 60 {
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.leftImageView.center = CGPoint(x: 0, y: self.leftOriginalCenter.y)
                    self.messageImageView.center = self.messageOriginalCenter
                    }, completion: nil)
            }else if velocity.x > 0 && translation.x > 60 && translation.x < 260 {
               
                UIView.animate(withDuration: 0.3, animations: {
                    self.leftImageView.center = CGPoint(x: 120, y: self.leftOriginalCenter.y)
                    self.messageImageView.center = CGPoint(x: 375 + 120, y: self.leftOriginalCenter.y)
                    }, completion: {(value: Bool) in
                        UIView.animate(withDuration: 0.3, animations: {
                            self.messageImageView.alpha = 0
                            self.scrollView.center = CGPoint(x: self.scrollOriginalCenter.x, y: self.scrollOriginalCenter.y-100)
                            self.leftImageView.alpha = 0
                            self.rightImageView.alpha = 0
                            }, completion: nil)
                    })
            }else if velocity.x > 0 && translation.x > 260 {
                
                UIView.animate(withDuration: 1, animations: {
                    self.leftImageView.center = CGPoint(x: 150, y: self.leftOriginalCenter.y)
                    self.messageImageView.center = CGPoint(x: 375 + 150, y: self.leftOriginalCenter.y)
                    }, completion: {(value: Bool) in
                        UIView.animate(withDuration: 0.3, animations: {
                            self.messageImageView.alpha = 0
                            self.scrollView.center = CGPoint(x: self.scrollOriginalCenter.x, y: self.scrollOriginalCenter.y-100)
                            self.leftImageView.alpha = 0
                            self.rightImageView.alpha = 0
                            }, completion: nil)
                })

            }else if velocity.x < 0 && translation.x > -60 {
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.rightImageView.center = CGPoint(x: 0, y: self.rightOriginalCenter.y)
                    self.messageImageView.center = self.messageOriginalCenter
                    }, completion: nil)
            }else if velocity.x < 0 && translation.x < -60 && translation.x > -260 {
                
                self.rescheduleImageView.center = CGPoint(x: self.scrollOriginalCenter.x, y: self.rescheduleOriginalCenter.y)
                self.rightImageView.center = self.rightOriginalCenter
                self.messageImageView.center = self.messageOriginalCenter
                UIView.animate(withDuration: 0.3, animations: {
                    self.rescheduleImageView.alpha = 1
                    }, completion: nil)
            }else if velocity.x < 0 && translation.x < -260 {
                
                self.listImageView.center = CGPoint(x: self.scrollOriginalCenter.x, y: self.listOriginalCenter.y)
                self.rightImageView.center = self.rightOriginalCenter
                self.messageImageView.center = self.messageOriginalCenter
                UIView.animate(withDuration: 0.3, animations: {
                    self.listImageView.alpha = 1
                    }, completion: nil)
            }
        }
    }
    @IBAction func didTapReschedule(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1, animations: {
            self.rescheduleImageView.alpha = 0
            }, completion: {(value: Bool) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageImageView.alpha = 0
                    self.scrollView.center = CGPoint(x: self.scrollOriginalCenter.x, y: self.scrollOriginalCenter.y-100)
                    self.leftImageView.alpha = 0
                    self.rightImageView.alpha = 0
                    }, completion: nil)
        })
    }
    @IBAction func onTapList(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1, animations: {
            self.listImageView.alpha = 0
            }, completion: {(value: Bool) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageImageView.alpha = 0
                    self.scrollView.center = CGPoint(x: self.scrollOriginalCenter.x, y: self.scrollOriginalCenter.y-100)
                    self.leftImageView.alpha = 0
                    self.rightImageView.alpha = 0
                    }, completion: nil)
        })
    }
}

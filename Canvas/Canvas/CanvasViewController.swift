//
//  CanvasViewController.swift
//  Canvas
//
//  Created by Rachel Jin on 10/27/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    @IBOutlet weak var trayView: UIView!
    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    var newlyCreatedFace: UIImageView!
    var newlyCreatedFaceOriginalCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        trayDownOffset = 200
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        var velocity = sender.velocity(in: view)
        
        if sender.state == .began {
            trayOriginalCenter = trayView.center
        } else if sender.state == .changed {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        } else if sender.state == .ended {
            if velocity.y > 0 {
                UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: {
                    self.trayView.center = self.trayDown
                    }, completion: nil)
            }else {
                UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: {
                    self.trayView.center = self.trayUp
                    }, completion: nil)
            }
        }
    }
    @IBAction func didPanFace(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if sender.state == .began {
            var imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            UIView.animate(withDuration: 0.1, animations: {
                self.newlyCreatedFace.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                }, completion: nil)
        } else if sender.state == .changed {
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
        } else if sender.state == .ended {
            UIView.animate(withDuration: 0.1, delay:0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[], animations: {
                self.newlyCreatedFace.transform = CGAffineTransform (scaleX: 1.05, y: 1.05)
                }, completion: nil)
        }
        
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(CanvasViewController.didPinch(sender:)))
            newlyCreatedFace.isUserInteractionEnabled = true
            newlyCreatedFace.addGestureRecognizer(pinchGestureRecognizer)
    }
    
    func didPinch(sender: UIPinchGestureRecognizer) {
//        print("pinched")
        newlyCreatedFace.transform = newlyCreatedFace.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
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

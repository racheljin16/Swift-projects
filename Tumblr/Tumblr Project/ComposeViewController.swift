//
//  ComposeViewController.swift
//  Tumblr Project
//
//  Created by Rachel Jin on 11/1/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    @IBOutlet weak var icon1View: UIImageView!
    @IBOutlet weak var icon2View: UIImageView!
    @IBOutlet weak var icon3View: UIImageView!
    @IBOutlet weak var icon4View: UIImageView!
    @IBOutlet weak var icon5View: UIImageView!
    @IBOutlet weak var icon6View: UIImageView!
    @IBOutlet weak var cancleButton: UIButton!
    
    var iconOriginalY: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.icon1View.center.y = 750
        self.icon2View.center.y = 750
        self.icon3View.center.y = 750
        self.icon4View.center.y = 860
        self.icon5View.center.y = 860
        self.icon6View.center.y = 860

    }
    
    override func viewDidAppear(_ animated: Bool) {
        iconTransformWithOffset()
        
    }
    
    func iconTransformWithOffset() {
        let icons = [icon2View,icon1View,icon3View,icon4View,icon6View,icon5View]
        
        for index in 0...5 {
            let icon = icons[index]
            
            UIView.animate(withDuration: 0.6, delay: Double(index) * 0.05, usingSpringWithDamping:  0.7, initialSpringVelocity: 9, options: [], animations: {
                    icon?.transform = CGAffineTransform(translationX: 0, y: -500)
            }, completion: {(value: Bool) in
                UIView.animate(withDuration: 0.2, delay: 0.3, options: .curveEaseOut, animations: {
                    self.cancleButton.transform = CGAffineTransform(translationX: 0, y: -61)
                }, completion: nil)
            })
        }
    
     }

    @IBAction func onTapCancle(_ sender: UIButton) {
        let icons = [icon2View,icon1View,icon3View,icon4View,icon6View,icon5View]
        
        for index in 0...5 {
            let icon = icons[index]
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.cancleButton.transform = CGAffineTransform(translationX: 0, y: +61)
            }, completion: {(value: Bool) in
                UIView.animate(withDuration: 0.6, delay: Double(index) * 0.05, usingSpringWithDamping:  0.7, initialSpringVelocity: 9, options: [], animations: {
                    icon?.transform = CGAffineTransform(translationX: 0, y: -950)
                    icon?.alpha = 0
                }, completion: {(value: Bool) in
                    self.dismiss(animated: true, completion: nil)
                })
            })
        }
    
    }

}


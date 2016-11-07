//
//  MainViewController.swift
//  Tumblr Project
//
//  Created by Rachel Jin on 11/1/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bubbleView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    var fadeTransition: FadeTransition!
    
    var HomeViewController: UIViewController!
    var SearchViewController: UIViewController!
    var TrendingViewController: UIViewController!
    var AccountViewController: UIViewController!
    var ViewControllers: [UIViewController]!
    
    var selectedIndex: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        SearchViewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController")
        TrendingViewController = storyboard.instantiateViewController(withIdentifier: "TrendingViewController")
        AccountViewController = storyboard.instantiateViewController(withIdentifier: "AccountViewController")
        
        ViewControllers = [HomeViewController,SearchViewController,AccountViewController,TrendingViewController]
        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
        
        UIView.animate(withDuration:0.8, delay: 0.0,

            options: [.autoreverse,.repeat], animations: { () -> Void in
                self.bubbleView.transform = CGAffineTransform(translationX: 0, y: 10)
        }, completion: nil)
        
    }
    
    @IBAction func didPressTab(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        buttons[previousIndex].isSelected = false
        let previousVC = ViewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.isSelected = true
        let vc = ViewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        var destinationViewController = segue.destination
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
    }

    @IBAction func didTapSearch(_ sender: UIButton) {
        bubbleView.removeFromSuperview()
    }
    

    

}

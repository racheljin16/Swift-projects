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
    @IBOutlet var buttons: [UIButton]!
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

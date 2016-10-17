//
//  ScrollingWelcomeViewController.swift
//  Dropbox project
//
//  Created by Rachel Jin on 10/16/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class ScrollingWelcomeViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!

    @IBOutlet weak var ScrollingImage: UIImageView!
    
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let indicatorColor = UIColor(red: 13, green: 103, blue: 223, alpha: 1)
//        
//        let indicatorTintedColor = UIColor(red: 13, green: 103, blue: 223, alpha: 0.5)

        scrollView.contentSize = ScrollingImage.frame.size
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = UIColor.black
        
        pageControl.pageIndicatorTintColor = UIColor.green

        // Do any additional setup after loading the view.
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

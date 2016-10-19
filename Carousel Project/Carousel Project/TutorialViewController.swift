//
//  TutorialViewController.swift
//  Carousel project
//
//  Created by Rachel Jin on 10/19/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backupButtonView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 1500, height: 667)
        scrollView.delegate = self
        self.backupButtonView.alpha = 0
        self.pageControl.alpha = 1
        
        pageControl.numberOfPages = 4
//        pageControl.currentPageIndicatorTintColor = UIColor(red: 13, green: 103, blue: 223, alpha: 1)
//        pageControl.pageIndicatorTintColor = UIColor(red: 13, green: 103, blue: 223, alpha: 0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let page : Int = Int(round(scrollView.contentOffset.x / 375))
        

        pageControl.currentPage = page
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let offset = Float(scrollView.contentOffset.x)
        
        if offset >= 1125 {
            UIView.animate(withDuration: 0.4, animations: {
                self.backupButtonView.alpha = 1
            })
            
            self.pageControl.alpha = 0
        }
        else {
            self.backupButtonView.alpha = 0
            self.pageControl.alpha = 1
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

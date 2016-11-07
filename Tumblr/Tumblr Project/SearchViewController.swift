//
//  SearchViewController.swift
//  Tumblr Project
//
//  Created by Rachel Jin on 11/1/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var loadingView: UIView!
    
    @IBOutlet weak var searchFeedImage: UIImageView!
    @IBOutlet weak var ImageView: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        images = [loading_1, loading_2, loading_3]
        animatedImage = UIImage.animatedImage(with: images, duration: 1.0)
        ImageView.image = animatedImage
    }

    override func viewWillAppear(_ animated: Bool) {
//        searchFeedImage.alpha = 0
        loadingView.alpha = 1
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.2, delay: 2, animations: {
            self.loadingView.alpha = 0
        }, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

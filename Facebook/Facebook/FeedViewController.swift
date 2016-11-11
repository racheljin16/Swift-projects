//
//  FeedViewController.swift
//  Facebook
//
//  Created by Rachel Jin on 11/8/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIView!
    var lightBoxTransition: LightBoxTransition!
    var fadeTransition: FadeTransition!
    var selectedImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.frame.size
        lightBoxTransition = LightBoxTransition()
        fadeTransition = FadeTransition()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! PhotoViewController
        destinationVC.image = self.selectedImageView.image
        destinationVC.modalPresentationStyle = .custom
        destinationVC.transitioningDelegate = self.lightBoxTransition
        lightBoxTransition.duration = 1
    }
        

    @IBAction func onTapPhoto(_ sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        performSegue(withIdentifier: "toPhotoSegue", sender: nil)
    }

}

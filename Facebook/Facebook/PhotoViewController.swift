//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Rachel Jin on 11/10/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController,UIScrollViewDelegate {


    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var photoActionImage: UIImageView!

    var image: UIImage!
    var scrollViewOffset: CGFloat!
    var scrollDistance: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        scrollView.backgroundColor = UIColor(white: 0, alpha: 0.9)
        scrollView.contentSize = CGSize(width: 375, height: 900)
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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

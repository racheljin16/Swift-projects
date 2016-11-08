//
//  FeedDetailsViewController.swift
//  Facebook
//
//  Created by Rachel Jin on 11/8/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class FeedDetailsViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var commentContainer: UIView!
    @IBOutlet weak var detailsView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.frame.size
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
       
        scrollView.sendSubview(toBack: detailsView)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil, using: { (notification: Notification!) -> Void in
            var userInfo = (notification! as NSNotification).userInfo!
            
            // Get the keyboard height and width from the notification
            // Size varies depending on OS, language, orientation
            let kbSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.size
            
            self.commentContainer.frame.origin.y = self.view.frame.size.height - kbSize.height - self.commentContainer.frame.size.height
        })
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil, using: { (notification: Notification!) -> Void in
            self.commentContainer.frame.origin.y = self.scrollView.frame.size.height + self.scrollView.frame.origin.y
        })

    }

    @IBAction func onTapBack(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func onTapLikeText(_ sender: UIButton) {
        likeButton.isSelected = !likeButton.isSelected
    }
    
    @IBAction func onTapCommentButton(_ sender: UIButton) {
        commentField.becomeFirstResponder()
    }
    
    @IBAction func onTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func onEditingBegan(_ sender: UITextField) {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.commentContainer.center = CGPoint(x: 187.5, y: 592)
        })
    }
}

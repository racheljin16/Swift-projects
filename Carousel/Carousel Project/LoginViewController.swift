//
//  LoginViewController.swift
//  Carousel project
//
//  Created by Rachel Jin on 10/17/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBAction func didTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    
    @IBAction func onButton(_ sender: UIButton) {
        loginIndicator.startAnimating()

        if emailField.text!.isEmpty && passwordField.text!.isEmpty {
            let alertController = UIAlertController(title: "Email required", message: "Please enter your Email address", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true) {
            }
            loginIndicator.stopAnimating()
        }
        
        else if emailField.text == "rachel@gmail.com" && passwordField.text == "rachel" {
            let alertController = UIAlertController(title: "Signing in...", message: "", preferredStyle: .alert)
            self.present(alertController, animated: true) {
            }
            delay(2, closure: { () -> () in
                alertController.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            })
        } else {
            let alertController = UIAlertController(title: "Signing in...", message: "", preferredStyle: .alert)
            self.present(alertController, animated: true) {
            }
            delay(2, closure: { () -> () in
                alertController.title = "Sign in failed"
                alertController.message = "Incorrect email address or password"
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    
                }
                alertController.addAction(OKAction)
                self.loginIndicator.stopAnimating()
            })
        }
    }
    
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        Offset View Positions when the Keyboard is Shown
        
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
     
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset
            
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in self.buttonParentView.frame.origin.y = self.buttonInitialY

        }
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120

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

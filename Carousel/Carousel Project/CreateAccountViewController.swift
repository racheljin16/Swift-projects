//
//  CreateAccountViewController.swift
//  Carousel Project
//
//  Created by Rachel Jin on 10/21/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIImageView!
    @IBOutlet weak var createNavBar: UIImageView!
    @IBOutlet weak var checkboxButton: UIButton!


    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    @IBAction func onTapCheckbox(_ sender: UIButton) {
//        sender.isSelected = true
        sender.isSelected = !sender.isSelected
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        createNavBar.transform = transform
        fieldParentView.transform = transform
        createNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.1) { () -> Void in
            self.fieldParentView.transform = CGAffineTransform.identity
            self.createNavBar.transform = CGAffineTransform.identity
            self.fieldParentView.alpha = 1
            self.createNavBar.alpha = 1
        }
    }

    @IBAction func onClickBack(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset
            
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in self.buttonParentView.frame.origin.y = self.buttonInitialY
            
        }
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -130

    }

    @IBAction func onTapOutside(_ sender: UITapGestureRecognizer) {
        firstNameTextField.endEditing(true)
        lastNameTextField.endEditing(true)
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)

    }
    
    @IBAction func onSubmit(_ sender: UIButton) {
        if firstNameTextField.text == "Rachel" && lastNameTextField.text == "Jin"{
            let altercontroller = UIAlertController(title: "Creating Account...", message: "", preferredStyle: .alert)
            self.present(altercontroller, animated:true, completion:nil)
            delay(2) {
                self.performSegue(withIdentifier: "getStartedSegue", sender: nil)
                altercontroller.dismiss(animated: true, completion: nil)
            }
        }else{
            let altercontroller = UIAlertController(title: "Frist Name Required", message: "Please enter your first name", preferredStyle: .alert)
            altercontroller .addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            self.present(altercontroller, animated:true, completion:nil)
        }

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

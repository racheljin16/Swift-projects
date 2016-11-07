//
//  LogInFormViewController.swift
//  Tumblr Project
//
//  Created by Rachel Jin on 11/6/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class LogInFormViewController: UIViewController {
    @IBOutlet weak var logInForm: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.logInForm.alpha = 0
        self.backgroundView.alpha = 0.6
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.2, animations: {
            self.logInForm.alpha = 1
        }, completion: nil)
        
    }

    @IBAction func didTapCancel(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            self.cancelButton.backgroundColor = UIColor(red: 80/255, green: 151/255, blue: 195/255, alpha: 0.5)
        }, completion: {(value: Bool) in
            self.dismiss(animated: true, completion: nil)
        })
    }

}

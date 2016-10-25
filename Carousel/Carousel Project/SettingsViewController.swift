//
//  SettingsViewController.swift
//  Carousel project
//
//  Created by Rachel Jin on 10/19/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func onTapSignOut(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Sign Out", message: "Are you sure to sign out?", preferredStyle: .alert)
        let logoutAction = UIAlertAction(title: "Sign Out", style: .destructive) {
            (action) in
            }

        alertController.addAction(logoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }

        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true) {
        }
        delay(2, closure: { () -> () in
            self.performSegue(withIdentifier: "loginBackSegue", sender: nil)
        })
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = imageView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPressDismiss(_ sender: UIButton) {
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

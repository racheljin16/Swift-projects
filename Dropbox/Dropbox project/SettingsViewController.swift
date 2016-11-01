//
//  SettingsViewController.swift
//  Dropbox project
//
//  Created by Rachel Jin on 10/15/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var settingImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = settingImage.frame.size

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

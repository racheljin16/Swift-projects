//
//  GetStartedViewController.swift
//  Carousel Project
//
//  Created by Rachel Jin on 10/24/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {


    
    @IBAction func onTapBack(_ sender: UIButton) {
//navigationController!.popViewController(animated: true)

        for viewController in (self.navigationController?.viewControllers)! {
            if(viewController is IntroViewController) {
                self.navigationController?.popToViewController(viewController as! IntroViewController, animated: true)
                break;
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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

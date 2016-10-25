//
//  TermsViewController.swift
//  Carousel Project
//
//  Created by Rachel Jin on 10/24/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    
    @IBAction func onClickDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    @IBOutlet weak var webView: UIWebView!
    let url = "https://www.dropbox.com/terms?mobile=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let requestURL = NSURL(string:url)
        let request = NSURLRequest(url: requestURL! as URL)
        webView.loadRequest(request as URLRequest)
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

//
//  IntroViewController.swift
//  Carousel project
//
//  Created by Rachel Jin on 10/17/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scrollView: UIScrollView!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tileView1: UIImageView!
    @IBOutlet weak var tileView2: UIImageView!
    @IBOutlet weak var tileView3: UIImageView!
    @IBOutlet weak var tileView4: UIImageView!
    @IBOutlet weak var tileView5: UIImageView!
    @IBOutlet weak var tileView6: UIImageView!
    
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    
    func updateViewTransformsWithOffset(offset: Float){
        let tiles = [tileView1,tileView2,tileView3,tileView4,tileView5,tileView6]
        
        for index in 0...5{
            let tile = tiles[index]
            
            let tx = convertValue(inputValue: CGFloat(offset), r1Min: 0, r1Max: 667, r2Min:CGFloat(xOffsets[index]), r2Max:0)
            let ty = convertValue(inputValue: CGFloat(offset), r1Min: 0, r1Max: 667, r2Min:CGFloat(yOffsets[index]), r2Max:0)
            let scale = convertValue(inputValue: CGFloat(offset), r1Min: 0, r1Max: 667, r2Min: CGFloat(scales[index]), r2Max:1)
            let rotation = convertValue(inputValue: CGFloat(offset), r1Min: 0, r1Max: 667, r2Min:CGFloat(rotations[index]), r2Max:0)
            
            tile?.transform = CGAffineTransform(translationX: CGFloat(tx),y: CGFloat(ty))
            tile?.transform = (tile?.transform)!.scaledBy(x: CGFloat(scale),y: CGFloat(scale))
            tile?.transform = (tile?.transform)!.rotated(by: CGFloat(Double(rotation) * M_PI / 180))
        }
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
        let offset = Float(scrollView.contentOffset.y)
        // content offset = 0 -> 667
        updateViewTransformsWithOffset(offset: offset)
        // print("content offset: \(scrollView.contentOffset.y)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self

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

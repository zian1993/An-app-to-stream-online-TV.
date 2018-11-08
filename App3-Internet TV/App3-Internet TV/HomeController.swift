//
//  HomeController.swift
//  App3-Internet TV
//
//  Created by Hassan Khan on 10/16/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    //Declaring the IBOutlet variables that are to be controlled.
    @IBOutlet private var images : UIImageView?

    //Declaring other private variables to control the IBoutlet
    private var tempimage : UIImage?
    private var animate : [UIImage]
    
    //Initializing the private variables:
    required init?(coder aDecoder: NSCoder) {
        
        //Initializing the variables.
        tempimage = nil
        animate = [UIImage]()
        
        //Initializing base class
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Setting up my animation images
        buildarray()
        
        //Starting the animation
        animateaway()
    }
    
    //Building the animation array using a function.
    public func buildarray()
    {
        //Setting up the animation array
        tempimage = UIImage(named: "homeImage.png")
        animate.append(tempimage!)
        
        tempimage = UIImage(named: "image1.png")
        animate.append(tempimage!)
        
        tempimage = UIImage(named: "image2.png")
        animate.append(tempimage!)
    }
    
    public func animateaway()
    {
        //Setting up the animation for the ImageView IBOutlet
        images?.animationImages = animate
        images?.animationDuration = TimeInterval(17)
        images?.animationRepeatCount = 0
        
        images?.startAnimating()
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

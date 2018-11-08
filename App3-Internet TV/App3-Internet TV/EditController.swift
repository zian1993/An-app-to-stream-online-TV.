//
//  EditController.swift
//  App3-Internet TV
//
//  Created by Hassan Khan on 10/17/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import UIKit

class EditController: UIViewController {

    //Declaring the UIScrollView Object
    @IBOutlet private var buttonHolder: UIScrollView?
    
    //Declaring the private variables
    //private var buttonman : ButtonArray
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttoncreate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        buttoncreate()
    }
    
    //Initializing the private variables.
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    public func buttoncreate()
    {
        var y = 1.0   //y-ccordinate with respect to upper left coord of UIScrollView
        let no_buttons = buttonman.buttonkit.count  //Total # of buttons to be added
        let buttonHeight = 40   //Height of each button – dependent on desired font
        let offset = 5    //Distance between buttons
        
        //Compute the total height needed to contain all buttons – virtual distance
        let totalHeight = no_buttons * (buttonHeight + offset)
        
        //Setting virtual size.
        buttonHolder?.contentSize = CGSize(width: (buttonHolder?.frame.size.width)!, height: CGFloat(totalHeight))
        
        //Setting background color
        buttonHolder?.backgroundColor = UIColor.white
        
        //Creating the buttons
        for i in 0..<no_buttons
        {
            //Instantiate button
            let button = UIButton(type: UIButtonType.roundedRect)
            
            //Set the Button info
            button.setTitle(buttonman.buttonkit[i][0], for: UIControlState.normal)
            
            //Create a an event handler for each button
            button.addTarget(self, action: #selector(buttonPushed(sender:)), for: UIControlEvents.touchUpInside)
            
            //Set the background color etc
            button.backgroundColor = UIColor.blue
            button.tintColor = UIColor.white
            
            
            //Set the Frame for each button - needs to be centered in X direction
            let buttonFrame = CGRect(x:  CGFloat(20.0), y: CGFloat(y), width: (self.buttonHolder?.frame.size.width)! - 40.0,height: CGFloat(buttonHeight))
            
            button.frame = buttonFrame
            
            //Add directly to the parent
            buttonHolder?.addSubview(button)
            
            //Increment amount specified in height
            y += Double(buttonHeight + offset)
        }
    }
    
    public func buttonPushed(sender : Any)
    {
        let value = sender as! UIButton
        let title = value.titleLabel?.text
        //print(title!)
        
        //Finding the title in the buttons array,
        //and setting it equal to the global button index variable
        buttonindex = buttonman.findindex(title!)
        
        //First instantiating the url change view controller.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "urlchange") as! URLChange
        
        self.present(controller, animated: true, completion: nil)
    
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

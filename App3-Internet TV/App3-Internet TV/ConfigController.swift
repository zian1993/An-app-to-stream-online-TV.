//
//  ConfigController.swift
//  App3-Internet TV
//
//  Created by Hassan Khan on 10/17/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import UIKit

var vol = Float(0.0)
var volumecount = 0

class ConfigController: UIViewController {
    
    //Declaring the IBOutlets
    @IBOutlet private var name : UITextField?
    @IBOutlet private var url : UITextField?
    @IBOutlet private var volume : UISlider?
    @IBOutlet private var set : UIButton?

    private var namestr : String
    private var urlstr : String
    private var temparray : [String]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Initializing the private variables.
    required init?(coder aDecoder: NSCoder)
    {
        namestr = String()
        urlstr = String()
        temparray = [String]()
        super.init(coder: aDecoder)
    }

    @IBAction func any (sender: AnyObject, forEvent event: UIEvent)
    {
        
        if sender is UIButton
        {
            temparray.append(namestr)
            temparray.append(urlstr)
            buttonman.buttonkit.append(temparray)
            temparray = [String]()
        }
        
        if sender is UISlider
        {
            vol = (volume?.value)!
            volumecount += 1
        }
    }
    
    //Setting up IBActions for bringing up keyboard when the user
    //touches the text field
    @IBAction func editstart (sender: UITextField)
    {
        if (sender == name)
        {
        name?.becomeFirstResponder()
        }
        
        else if (sender == url)
        {
        url?.becomeFirstResponder()
        }
    }
    
    @IBAction func editend (sender: UITextField)
    {
        if (sender == name)
        {
            name?.resignFirstResponder()
            namestr = (name?.text)!
        }
            
        else if (sender == url)
        {
            url?.resignFirstResponder()
            urlstr = (url?.text)!
        }
    }
    
    @IBAction func editchange(sender: UITextField)
    {
        if (sender == name)
        {
            namestr = (name?.text)!
        }
            
        else if (sender == url)
        {
            urlstr = (url?.text)!
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

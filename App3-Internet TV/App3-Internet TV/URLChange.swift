//
//  URLChange.swift
//  App3-Internet TV
//
//  Created by Hassan Khan on 10/17/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import UIKit

public var buttonindex = 0

class URLChange: UIViewController {

    //Declaring the IBOutlets
    @IBOutlet private var modify : UIButton?
    @IBOutlet private var text : UITextField?
    @IBOutlet private var namedisplay : UITextView?
    
    //Declaring private variables
    private var texter : String
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        namedisplay?.text = buttonman.buttonkit[buttonindex][0]
    }
    
    //Initializing the private variables.
    required init?(coder aDecoder: NSCoder)
    {
        texter = String()
        super.init(coder: aDecoder)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func any (sender: AnyObject, forEvent event: UIEvent)
    {
        
        if sender is UIButton
        {
            buttonman.buttonkit[buttonindex][1] = texter
        }
    }
    
    //Setting up IBActions for bringing up keyboard when the user
    //touches the text field
    @IBAction func editstart (sender: UITextField)
    {
        text?.becomeFirstResponder()
    }

    @IBAction func editend (sender: UITextField)
    {
        text?.resignFirstResponder()
        texter = (text?.text)!
    }
    
    @IBAction func editchange(sender: UITextField)
    {
        texter = (text?.text)!
    }
    
    override var canBecomeFirstResponder: Bool
        {
        return true
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

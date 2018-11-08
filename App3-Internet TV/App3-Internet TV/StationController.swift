//
//  StationController.swift
//  App3-Internet TV
//
//  Created by Hassan Khan on 10/16/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import UIKit
import AVFoundation

var buttonman = ButtonArray()
var stationcounter = 0

class StationController: UIViewController {
    
    //Declaring the IBOutlet of scrollview
    @IBOutlet private var buttonHolder: UIScrollView?
    
    //Declaring other variables
    //public var buttonman : ButtonArray
    
    private var temparray1 : [String]
    private var temparray2 : [String]
    //private var tempurl : URL
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Setting up the buttons for the first time view loads.
        if (stationcounter == 0)
        {
        buttonsetup()
        }
        
        //Creating the buttons and managing user interaction
        //with the buttons.
        buttoncreate()
        
        //Keeping a count of how many times the viewdidload was
        //called.
        stationcounter += 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        buttoncreate()
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
        //and therefore finding the corresponding url to play
       let tempurl = URL(string: buttonman.buttonkit[buttonman.findindex(title!)][1])!
        
        //Now playing the URL
        playURL(tempurl)
    }
    
    public func playURL(_ url: URL)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Player") as! PlayerController
        
        controller.setURL(url: url)
        
        controller.player = AVPlayer(url: url)
        
        //Setting the volume of the player
        if (volumecount == 0)
        {
        controller.player?.volume = 0.5
        }
        else
        {
        controller.player?.volume = vol
        }
        
        self.present(controller, animated: true, completion: nil)

    }
    
    //Initializing the private variables.
    required init?(coder aDecoder: NSCoder)
    {
        temparray1 = [String]()
        temparray2 = [String]()
        
        //buttonman = ButtonArray()
        
        super.init(coder: aDecoder)
    }
    
    //This is where the button array will be created.
    private func buttonsetup()
    {
        temparray1 = ["France24","MLB","The Blaze","Weather","ABC","CBS",  "Free Speech", "Travel", "SECDN", "Daytona", "HouseTV","ROKU","Orange County", "Seminole County",
            "University of Texas", "Temple University","University of California"]
        
        temparray2 =
            ["http://static.france24.com/live/F24_EN_LO_HLS/live_web.m3u8",
                "http://cmctv.ios.internapcdn.net/cmctv_vitalstream_com/live_1/CMCUSA/CCURstream0.m3u8",
                "http://mlblive-akc.mlb.com/ls01/mlbam/mlb_network/NETWORK_LINEAR_1/MLB_VIDEO_MLBN_FAUX_LINEAR_STREAM_1_MLB_Network_Linear_Stream_Tuesday_20170704_1499230681478/2400K/2400_slide.m3u8",
                "https://theblaze.global.ssl.fastly.net/live/theblaze/master.m3u8",
                "http://weather-lh.akamaihd.net/i/twc_1@92006/master.m3u8",
                "http://abclive.abcnews.com/i/abc_live4@136330/master.m3u8",
                "http://cbsnewshd-lh.akamaihd.net/i/CBSNHD_7@199302/master.m3u8",
                "https://edge.free-speech-tv-live.top.comcast.net/out/u/fstv.m3u8",
                "http://media4.tripsmarter.com:1935/LiveTV/ACVBHD/chucklist.m3u8",
                "http://na-all15.secdn.net/pegstream3-live/play/c3e1e4c4-7f11-4a54-8b8f-c590a95b4ade/playlist.m3u8",
                "http://oflash.dfw.swagit.com/live/daytonabeachfl/smil:std-4x3-1-a/chucklist.m3u8",
                "http://video.oct.dc.gov/out/u/DCN.m3u8",
                "http://d3ktuc8v2sjk6m.cloudfront.net/livetv/ngrp:HouseChannel_all/chucklist.m3u8",
                "http://173.199.158.79:1935/roku/myStream/playlist.m3u8",
                "http://otv3.ocfl.net:1936/OrangeTV/smil:OrangeTV.smil/chunklist_w1007974604_b894100_sleng.m3u8",
                "http://video.seminolecountyfl.gov:1935/live/SGTV/chunklist.m3u8",
                "http://tstv-stream.tsm.utexas.edu/hls/livestream_hi/index.m3u8"]
                /*"http://streaming.temple.edu/tutvlive/_definst_/mp4:play/chunklist.m3u8",
                "http://diffusionm4.assnat.qc.ca/canal9/250.sdp/playlist.m3u8"*/
        
        //Setting up the button array
        buttonman.setup(temparray1, temparray2)
    }
    
    //If we are setting up the button array after modification
    public func buttonsetup(_ a: ButtonArray)
    {
        buttonman = a
    }
    
    /*If we need the button aray in another viewcontroller.
    public func buttonreturn() -> ButtonArray
    {
        return buttonman
    }*/

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

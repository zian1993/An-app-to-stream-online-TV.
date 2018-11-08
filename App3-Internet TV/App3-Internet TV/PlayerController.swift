//
//  PlayerController.swift
//  App3-Internet TV
//
//  Created by Hassan Khan on 10/16/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayerController: AVPlayerViewController {

    private var url : URL!
    
    public func setURL(url : URL)
    {
        self.url = url
    }
    
    public func setVolume(_ a: Int)
    {
        self.setVolume(a)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.player?.play()
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

//
//  ButtonArray.swift
//  App3-Internet TV
//
//  Created by Hassan Khan on 10/16/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import UIKit

class ButtonArray: NSObject {

    //This class is going to be used to declare a datatype of 
    //a 2D array, which will contain the station call name
    //and the station url as well.
    
    public var buttonkit : [[String]]
    
    private var temparray : [String]
    private var temparray2 : [String]
    private var tempint : Int
    private var tempint1: Int
    
    /*init?(coder aDecoder: NSCoder)
    {
        buttonkit = [[String]]()
        temparray = [String]()
        temparray2 = [String]()
        tempint = 0
        
        super.init()
    }*/
    
    public override init() {
        buttonkit = [[String]]()
        temparray = [String]()
        temparray2 = [String]()
        tempint = 0
        tempint1 = 0
    }
    
    public func setup(_ a: [String], _ b: [String])
    {
        
        //Adding the names of the buttons and corresponding urls
        //to the buttonkit array.
        
        for i in 0..<(a.count)
        {
            temparray.append(a[i])
            temparray.append(b[i])
            
            buttonkit.append(temparray)
            
            temparray.removeAll()
        }
    }
    
    public func add (_ a: String, _ b: String)
    {
     
        //This function will be called when we want to add
        //more buttons to the button array
        
        temparray2.append(a)
        temparray2.append(b)
        
        buttonkit.append(temparray2)
    }
    
    public func modify (_ a: String, _ b: String)
    {
        //Getting the index where the station call is
        tempint1 = findindex(a)
        
        //After finding the index, replace the url for that index
        buttonkit[tempint1][1] = b
    }
    
    public func findindex(_ a:String) -> Int
    {
        //Getting the index where the station call is
        tempint = buttonkit.index(where: {$0[0] == a})!
        
        return tempint
    }
    
}

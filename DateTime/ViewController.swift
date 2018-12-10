//
//  ViewController.swift
//  DateTime
//
//  Created by Saleh Enam Shohag on 30/11/18.
//  Copyright © 2018 Nazia Afroz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let timestamp = Int64(Date.init().timeIntervalSince1970)
            //Date.init().timeIntervalSince1970 as Int64
        let timeOffset = NSTimeZone.local.secondsFromGMT()
        print("timestamp = \(timestamp) timeoffset = \(timeOffset)")
        let date = NSDate.init(timeIntervalSince1970: Double(timestamp))
            //Date.init(timeIntervalSince1970: Double(timestamp))
        print("\(date)")
        let dateOriginal = Date.init()
        print("\(dateOriginal)")
        
        let dateTimeUtil  = DateTimeUtil.init()
        dateTimeUtil.run()
    }

    

    

}


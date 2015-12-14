//
//  ViewController.swift
//  AdSample
//
//  Created by Takayasu Sakai on 2015/12/14.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.canDisplayBannerAds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


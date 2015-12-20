//
//  ViewController.swift
//  ModelSample
//
//  Created by Takayasu Sakai on 2015/12/21.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let model = Model()
        print(model[0])
        
        model[0] = "すず"
        print(model[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


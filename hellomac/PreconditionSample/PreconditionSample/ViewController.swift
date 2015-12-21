//
//  ViewController.swift
//  PreconditionSample
//
//  Created by Takayasu Sakai on 2015/12/22.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hello("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func hello(name: String){
        precondition(name.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0)
        print("こんにちは" + name + "さん")
    }
}


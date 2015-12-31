//
//  ViewController.swift
//  HelloWorldMac
//
//  Created by Takayasu Sakai on 2015/12/31.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeText(sender: AnyObject) {
        if(message.text == "Hello World!"){
            message.text = "こんにちは"
        }else{
            message.text = "Hello World!"
        }
    }

}


//
//  ViewController.swift
//  ButtonSample
//
//  Created by Takayasu Sakai on 2015/11/21.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = "ラベル"
    }

    @IBAction func buttonTouchDown(sender: AnyObject) {
        label1.text = "Hello World!"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


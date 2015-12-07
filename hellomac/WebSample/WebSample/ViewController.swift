//
//  ViewController.swift
//  WebSample
//
//  Created by Takayasu Sakai on 2015/12/07.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressBtn(sender: UIButton) {
        let controller = WebPageViewController(url: "http://swift-studying.com/blog/swift/")
        self.presentViewController(controller, animated: true, completion: nil)
    }
   

}


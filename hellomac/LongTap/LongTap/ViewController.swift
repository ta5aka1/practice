//
//  ViewController.swift
//  LongTap
//
//  Created by Takayasu Sakai on 2015/12/04.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: "doGesture:")
        self.view.addGestureRecognizer(longPressGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doGesture(gesture: UIGestureRecognizer) {
        if let longPressGesture = gesture as? UILongPressGestureRecognizer{
            longPress(longPressGesture)
        }
    }

    private func longPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state != .Began {
            return
        }
        
        UIView.animateWithDuration(0.5, animations: {() -> Void in
                self.view.backgroundColor = UIColor.blueColor()
            }) {(finished) -> Void in
                self.view.backgroundColor = UIColor.whiteColor()
        }
    }
}


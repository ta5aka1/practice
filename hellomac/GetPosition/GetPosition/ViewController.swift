//
//  ViewController.swift
//  GetPosition
//
//  Created by Takayasu Sakai on 2015/12/24.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label:UILabel!
    var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label = UILabel(frame: CGRectMake(10.0, 10.0, 200.0,40.0))
        label.text = "Test"
        view.addSubview(label)
        
        button = UIButton(type: .System) as UIButton
        button.frame = CGRectMake(80.0, 80.0, 85.0, 30.0)
        button.setTitle("ボタン", forState: .Normal)
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // ラベルの高さと幅を取得
        let height = CGRectGetHeight(label.frame)
        let width  = CGRectGetWidth(label.frame)
        print("ラベルの高さ:\(height) 幅:\(width)")
        
        let midX = CGRectGetMidX(button.frame)
        let midY = CGRectGetMidY(button.frame)
        print("ボタンの中心のX座標：\(midX) 幅：\(midY)")
    }

}


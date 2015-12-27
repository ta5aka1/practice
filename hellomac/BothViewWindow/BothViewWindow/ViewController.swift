//
//  ViewController.swift
//  BothViewWindow
//
//  Created by Takayasu Sakai on 2015/12/27.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var bothSideView: BothSideView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 表に表示するビュー
        let frontLabel = UILabel()
        frontLabel.backgroundColor = UIColor.redColor()
        frontLabel.text = "表"
        frontLabel.alpha = 0.6
        
        let backLabel = UILabel()
        backLabel.backgroundColor = UIColor.purpleColor()
        backLabel.text = "裏"
        backLabel.alpha = 0.6
        backLabel.textAlignment = .Left
        
        bothSideView = BothSideView(front: frontLabel, back: backLabel)
        bothSideView.frame = UIScreen.mainScreen().bounds
        
        view.addSubview(bothSideView)
        
        let tap = UITapGestureRecognizer(target: self, action: "tapView")
        bothSideView.addGestureRecognizer(tap)
    }

    func tapView(){
        var transform = bothSideView.layer.sublayerTransform
        transform = CATransform3DRotate(transform, CGFloat(M_PI), 0.0, 1.0, 0.0)
        
        // bothSideViewの子ビュー(子レイヤー)も裏返す
        bothSideView.layer.sublayerTransform = transform
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  textPaddingApp
//
//  Created by Takayasu Sakai on 2015/12/07.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let text = "あかさたなはまやらわあかさたなはまやらわあかさたなはまやらわあかさたなはまやらわあかさたなはまやらわあかあたなはまやらわ"
        let label = UILabel(frame: CGRectMake(0, 0, 200, 80))
        label.center = self.view.center
        label.font = UIFont.boldSystemFontOfSize(14.0)
        label.numberOfLines = 0
        self.view.addSubview(label)
        
        let lineHeight: CGFloat = 25.0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        label.attributedText = attributedText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


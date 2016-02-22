//
//  ViewController.swift
//  Chapter5
//
//  Copyright © 2015年 shoeisha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 数字の入力中かどうか示す
    // trueの間、数字押下で順次桁を繰り下げる
    var usrInputting: Bool = false
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func inputNumber(sender: UIButton) {
        var displayNum: String = "0"
        
        if !usrInputting{
            usrInputting = true
            displayNum = (sender.titleLabel?.text)!
        } else {
            displayNum = displayLabel.text!
            
            // 入力された文字を末尾に結合することで繰り上げを行う
            displayNum += (sender.titleLabel?.text)!
        }
        
        displayLabel.text = displayNum
    }

    var selectedOpearand: String = ""
    @IBAction func operate(sender: UIButton) {
        if usrInputting {
            enter()
        }
        selectedOpearand = (sender.titleLabel?.text)!
    }
    
    var targetNum: Double? = nil
    @IBAction func enter() {
        usrInputting = false
        
        if targetNum != nil && selectedOpearand != "" {
            let resultNum: Double = resultValue
            
            switch selectedOpearand {
            case "x" :
                resultValue = targetNum! * resultNum
            case "÷" :
                if(resultNum == 0) {
                    resultValue = targetNum! / resultNum
                }
            case "+" :
                resultValue = targetNum! + resultNum
            case "?" :
                resultValue = targetNum! - resultNum
            default :
                break
            }
        }
        selectedOpearand = ""
        targetNum = resultValue
    }
    
    var resultValue: Double{
        get{
            return (NSNumberFormatter().numberFromString(displayLabel.text!)?.doubleValue)!
        }
        set{
            displayLabel.text = "\(newValue)"
            usrInputting = false
        }
    }
    @IBAction func clearAll(sender: UIButton) {
        targetNum = nil
        selectedOpearand = ""
        resultValue = 0
    }
}


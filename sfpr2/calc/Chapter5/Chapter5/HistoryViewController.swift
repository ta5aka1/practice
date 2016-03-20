//
//  HistoryViewController.swift
//  Chapter5
//
//  Created by Takayasu Sakai on 2016/03/21.
//  Copyright © 2016年 shoeisha. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var calcHistory: Array<Double> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for result: Double in calcHistory {
            textView.text = textView.text + ("\(result)\n")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func back(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}

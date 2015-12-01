//
//  ViewController.swift
//  DownloadTask
//
//  Created by Takayasu Sakai on 2015/12/02.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController , NSURLSessionDownloadDelegate {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tap(sender: AnyObject) {
        self.downloadWithDataTask()
    }
    
    func downloadWithDataTask() {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: config, delegate: self, delegateQueue: nil)

        let url = NSURL(string: "http://www.geocities.jp/ezotombo9/Sample/syouzyou.jpg")
        let task = session.downloadTaskWithURL(url!)
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        let data = NSData(contentsOfURL: location)
        if data!.length == 0 {
            NSLog("download Error!")
        }else{
            NSLog("download Success!")
            self.imageView.image = UIImage(data: data!)
        }
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil {
            session.invalidateAndCancel()
        }else{
            session.finishTasksAndInvalidate()
        }
        NSLog("All Done.")
    }

}


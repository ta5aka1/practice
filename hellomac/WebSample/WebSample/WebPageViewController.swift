//
//  WebPageViewController.swift
//  WebSample
//
//  Created by Takayasu Sakai on 2015/12/07.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import WebKit
import UIKit

class WebPageViewController: UIViewController, WKNavigationDelegate{
    
    private let _webView = WKWebView()
    private let _progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.Bar)
    private let _closeBtn = UIButton(type: .Custom)
    private let _goBackBtn = UIButton(type: .Custom)
    private let _goForwardBtn = UIButton(type: .Custom)
    private let _reloadBtn = UIButton(type: .Custom)
    
    private let _baseMenuView = UIView()
    private let _initialURL:String
    
    init(url:String){
        _initialURL = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        _initialURL = ""
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        //progress view
        _baseMenuView.addSubview(_progressView)
        
        _webView.navigationDelegate = self
        _webView.allowsBackForwardNavigationGestures = true
        _webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.New, context: nil)
        self.view.addSubview(_webView)
        if let url = NSURL(string: _initialURL){
            _webView.loadRequest(NSURLRequest(URL: url))
        }
        
        _baseMenuView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(_baseMenuView)
        
        //closeBtn
        _closeBtn.setImage(UIImage(named: "Close"), forState: .Normal)
        _closeBtn.addTarget(self, action: "pressBtn:", forControlEvents: .TouchUpInside)
        _baseMenuView.addSubview(_closeBtn)
        
        //goBackBtn
        _goBackBtn.enabled = false
        _webView.addObserver(self, forKeyPath: "canGoBack", options: NSKeyValueObservingOptions.New, context: nil)
        _goBackBtn.setImage(UIImage(named: "GoBack"), forState: .Normal)
        _goBackBtn.addTarget(self, action: "pressBtn:", forControlEvents: .TouchUpInside)
        _baseMenuView.addSubview(_goBackBtn)
        
        //goForwardBtn
        _goForwardBtn.enabled = false
        _webView.addObserver(self, forKeyPath: "canGoForward", options: NSKeyValueObservingOptions.New, context: nil)
        _goForwardBtn.setImage(UIImage(named: "GoForward"), forState: .Normal)
        _goForwardBtn.addTarget(self, action: "pressBtn:", forControlEvents: .TouchUpInside)
        _baseMenuView.addSubview(_goForwardBtn)
        
        //reloadBtn
        _reloadBtn.setImage(UIImage(named: "Reload"), forState: .Normal)
        _reloadBtn.addTarget(self, action: "pressBtn:", forControlEvents: .TouchUpInside)
        _baseMenuView.addSubview(_reloadBtn)
        
        setupConstraints()
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if object!.isEqual(_webView){
            if keyPath == "estimatedProgress"{
                _progressView.progress = Float(_webView.estimatedProgress)
            } else if keyPath == "canGoBack" {
                _goBackBtn.enabled = _webView.canGoBack
            } else if keyPath == "canGoForward" {
                _goForwardBtn.enabled = _webView.canGoForward
            }
            
        }
    }
    
    func setupConstraints(){
        var viewConstraints = [NSLayoutConstraint]()
        
        // baseMenu
        var baseMenuViewConstraints = [NSLayoutConstraint]()
        _baseMenuView.translatesAutoresizingMaskIntoConstraints = false
        baseMenuViewConstraints.append(NSLayoutConstraint(item: _baseMenuView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50.0))
        viewConstraints.append(NSLayoutConstraint(item: _baseMenuView, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: _baseMenuView, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: _baseMenuView, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        
        // progressView
        _progressView.translatesAutoresizingMaskIntoConstraints = false
        baseMenuViewConstraints.append(NSLayoutConstraint(item: _progressView, attribute: .Left, relatedBy: .Equal, toItem: _baseMenuView, attribute: .Left, multiplier: 1.0, constant: 0.0))
        baseMenuViewConstraints.append(NSLayoutConstraint(item: _progressView, attribute: .Right, relatedBy: .Equal, toItem: _baseMenuView, attribute: .Right, multiplier: 1.0, constant: 0.0))
        baseMenuViewConstraints.append(NSLayoutConstraint(item: _progressView, attribute: .Top, relatedBy: .Equal, toItem: _baseMenuView, attribute: .Top, multiplier: 1.0, constant: 0.0))
        
        //closeBtn
        _closeBtn.translatesAutoresizingMaskIntoConstraints = false
        var closeBtnConstraints = [NSLayoutConstraint]()
        closeBtnConstraints.append(NSLayoutConstraint(item: _closeBtn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40.0))
        closeBtnConstraints.append(NSLayoutConstraint(item: _closeBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 0.0))
        baseMenuViewConstraints.append(NSLayoutConstraint(item: _closeBtn, attribute: .CenterY, relatedBy: .Equal, toItem: _baseMenuView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        baseMenuViewConstraints.append(NSLayoutConstraint(item: _closeBtn, attribute: .Left, relatedBy: .Equal, toItem: _baseMenuView, attribute: .Left, multiplier: 1.0, constant: 10.0))
        
        // reloadBtn
        _reloadBtn.translatesAutoresizingMaskIntoConstraints = false
        var reloadBtnConstraints = [NSLayoutConstraint]()
        reloadBtnConstraints.append(NSLayoutConstraint(item: _reloadBtn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1.0, constant: 40.0))
        reloadBtnConstraints.append(NSLayoutConstraint(item: _reloadBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1.0, constant: 24.0))
        baseMenuViewConstraints.append(NSLayoutConstraint(item: _reloadBtn, attribute: .CenterY, relatedBy: .Equal, toItem: _baseMenuView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        baseMenuViewConstraints.append(NSLayoutConstraint(item: _reloadBtn, attribute: .Left, relatedBy: .Equal, toItem: _closeBtn, attribute: .Right, multiplier: 1.0, constant: 10.0))
        
        // goBackBtn
        _goBackBtn.translatesAutoresizingMaskIntoConstraints = false
        var goBackBtnConstraints = [NSLayoutConstraint]()
        goBackBtnConstraints.append(NSLayoutConstraint(item: _goBackBtn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40.0))
        goBackBtnConstraints.append(NSLayoutConstraint(item: _goBackBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 24.0))
        baseMenuViewConstraints.append(NSLayoutConstraint(item: _goBackBtn, attribute: .CenterY, relatedBy: .Equal, toItem: _baseMenuView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        baseMenuViewConstraints.append(NSLayoutConstraint(item: _goBackBtn, attribute: .Left, relatedBy: .Equal, toItem: _reloadBtn, attribute: .Right, multiplier: 1.0, constant: 20.0))
        
        // goForwardBtn
        _goForwardBtn.translatesAutoresizingMaskIntoConstraints = false
        var goForwardBtnConstraints = [NSLayoutConstraint]()
        goForwardBtnConstraints.append(NSLayoutConstraint(item: _goForwardBtn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40.0))
        goForwardBtnConstraints.append(NSLayoutConstraint(item: _goForwardBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 24.0))
        baseMenuViewConstraints.append(NSLayoutConstraint(item: _goForwardBtn, attribute: .CenterY, relatedBy: .Equal, toItem: _baseMenuView, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        baseMenuViewConstraints.append(NSLayoutConstraint(item: _goForwardBtn, attribute: .Left, relatedBy: .Equal, toItem: _goBackBtn, attribute: .Right, multiplier: 1.0, constant: 20.0))
        
        // webView
        _webView.translatesAutoresizingMaskIntoConstraints = false
//        var webViewConstraints = [NSLayoutConstraint]()
        viewConstraints.append(NSLayoutConstraint(item: _webView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: _webView, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: _webView, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: _webView, attribute: .Bottom, relatedBy: .Equal, toItem: _baseMenuView, attribute: .Top, multiplier: 1.0, constant: 0.0))
        
        NSLog("start")
        _closeBtn.addConstraints(closeBtnConstraints)
        NSLog("close added")
        _reloadBtn.addConstraints(reloadBtnConstraints)
        NSLog("reload added")
        _goBackBtn.addConstraints(goBackBtnConstraints)
        NSLog("goBack added")
        _goForwardBtn.addConstraints(goForwardBtnConstraints)
        NSLog("goForward added")
        _baseMenuView.addConstraints(baseMenuViewConstraints)
        NSLog("baseMenu added")
        self.view.addConstraints(viewConstraints)
    }
    
    // 画面を閉じるときにObserverを削除。削除しないとアプリが落ちる
    deinit {
        _webView.removeObserver(self, forKeyPath: "estimatedProgress", context: nil)
        _webView.removeObserver(self, forKeyPath: "canGoBack", context: nil)
        _webView.removeObserver(self, forKeyPath: "canGoForward", context: nil)
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.2*Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            self._progressView.progress = 0.0
        }
    }
    
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        NSLog("\(error.localizedDescription)")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.2 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            self._progressView.progress = 0.0
        }
    }
    
    // ボタンをおした時の処理
    func pressBtn(sender: UIButton) {
        if sender.isEqual(_closeBtn){
            self.dismissViewControllerAnimated(true, completion: nil)
        } else if sender.isEqual(_goBackBtn) {
            _webView.goBack()
        } else if sender.isEqual(_goForwardBtn) {
            _webView.goForward()
        } else if sender.isEqual(_reloadBtn) {
            _webView.reload()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

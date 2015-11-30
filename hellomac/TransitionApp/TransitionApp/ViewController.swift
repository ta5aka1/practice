//
//  ViewController.swift
//  TransitionApp
//
//  Created by Takayasu Sakai on 2015/12/01.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate{
    let btn = UIButton(type: .System)
    private let animationController = LeftToRightAnimationController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
        setupConstraints()
    }

    private func setupView(){
        btn.addTarget(self, action: "pressBtn:", forControlEvents: .TouchUpInside)
        btn.setTitle("タップ", forState: .Normal)
        view.addSubview(btn)
    }
    
    private func setupConstraints() {
        var viewConstraints = [NSLayoutConstraint]()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        var btnConstraints = [NSLayoutConstraint]()
        btnConstraints.append(NSLayoutConstraint(item: btn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100.0))
        btnConstraints.append(NSLayoutConstraint(item: btn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1.0, constant: 60.0))
        viewConstraints.append(NSLayoutConstraint(item: btn, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: btn, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        btn.addConstraints(btnConstraints)
        view.addConstraints(viewConstraints)
    }
    
    func pressBtn(sender: UIButton) {
        let controller = TransitionViewController()
        controller.transitioningDelegate = self
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animationController
    }

}


//
//  BothSideView.swift
//  BothViewWindow
//
//  Created by Takayasu Sakai on 2015/12/27.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class BothSideView: UIView{
    let frontView: UIView
    let backView: UIView
    
    init(front: UIView, back: UIView){
        self.frontView = front
        self.backView = back
        
        super.init(frame: CGRectZero)
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        frontView.frame = bounds
        backView.frame = bounds
    }
    
    override func layoutSubviews() {
        addSubview(frontView)
        
        addSubview(backView)
        backView.layer.zPosition = -1.0
        
        var transform = CATransform3DIdentity
        transform = CATransform3DRotate(transform, CGFloat(M_PI), 0.0, 1.0, 0.0)
        backView.layer.transform = transform
    }
}

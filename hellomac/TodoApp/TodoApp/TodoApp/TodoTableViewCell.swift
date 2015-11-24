//
//  TodoTableViewCell.swift
//  TodoApp
//
//  Created by Takayasu Sakai on 2015/11/25.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

@objc protocol TodoTableViewCellDelegate {
    optional func updateTodo(index: Int)
    optional func removeTodo(index: Int)
}

class TodoTableViewCell : UITableViewCell {
    var haveButtonsDisplayed = false
    weak var delegate: TodoTableViewCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier : String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .None
        
        self.createView()

        let swipeReconizer = UISwipeGestureRecognizer(target: self, action: "showDeleteButton")
        swipeReconizer.direction = .Left
        self.contentView.addGestureRecognizer(swipeReconizer)
        
        self.contentView.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: "hideDeleteButton"))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func showDeleteButton() {
        if !haveButtonsDisplayed {
            UIView.animateWithDuration(0.1, animations: {
                let size = self.contentView.frame.size
                let origin = self.contentView.frame.origin
                
                self.contentView.frame = CGRect(x: origin.x - 100, y:origin.y, width:size.width, height: size.height)
                }) { completed in self.haveButtonsDisplayed = true }
        }
    }
    
    func hideDeleteButton() {
        if haveButtonsDisplayed {
            UIView.animateWithDuration(0.1, animations: {
                let size = self.contentView.frame.size
                let origin = self.contentView.frame.origin
            
                self.contentView.frame = CGRect(x: origin.x + 100, y: origin.y, width: size.width, height: size.height)
                }){ completed in self.haveButtonsDisplayed = false }
        }
    }
    
    func createView() {
        let origin = self.frame.origin
        let size = self.frame.size
        
        self.contentView.backgroundColor = UIColor.whiteColor()
        
        let updateButton = UIButton(type: .System)
        updateButton.frame = CGRect(x: size.width - 100, y:origin.y, width: 50, height: size.height)
        updateButton.backgroundColor = UIColor.lightGrayColor()
        updateButton.setTitle("Edit", forState: .Normal)
        updateButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        updateButton.addTarget(self, action: "updateTodo", forControlEvents: .TouchUpInside)
        
        let removeButton = UIButton(type: .System)
        removeButton.frame = CGRect(x: size.width - 50, y: origin.y, width: 50, height: size.height)
        removeButton.setTitle("Delete", forState: .Normal)
        removeButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        removeButton.addTarget(self, action: "removeTodo", forControlEvents: .TouchUpInside)
        
        self.backgroundView = UIView(frame: self.bounds)
        self.backgroundView?.addSubview(updateButton)
        self.backgroundView?.addSubview(removeButton)
    }
    
    func updateTodo() {
        delegate?.updateTodo!(self.tag)
    }
    
    func removeTodo() {
        delegate?.updateTodo!(self.tag)
    }
}
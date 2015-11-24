//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by Takayasu Sakai on 2015/11/21.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

enum TodoAlertViewType {
    case Create, Update(Int), Remove(Int)
}

class TodoTableViewController : UIViewController{
    var todo = TodoDataManager.sharedInstance
    var tableView: UITableView?
    var alert : UIAlertController?
    var alertType: TodoAlertViewType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 64))
        header.image = UIImage(named: "header")
        header.userInteractionEnabled = true

        let title = UILabel(frame: CGRect(x:10, y:20, width:310, height:40))
        title.text = "ToDo List"
        header.addSubview(title)
        
        let button = UIButton(type: .System)
        button.frame = CGRect(x: 320 - 50, y: 20, width: 50, height: 44)
        button.setTitle("Add", forState: .Normal)
        button.addTarget(self, action: "showCreateView", forControlEvents: .TouchUpInside)
        header.addSubview(button)
        
        let screenWidth = UIScreen.mainScreen().bounds.size.height
        self.tableView = UITableView(frame: CGRect(x:0, y:60, width:310, height:screenWidth - 60))
        self.tableView!.dataSource = self
        
        self.view.addSubview(self.tableView!)
        self.view.addSubview(header)
    }
    
    func showCreateView() {
        self.alertType = TodoAlertViewType.Create
        self.alert = UIAlertController(title: "Todoを追加する", message: nil, preferredStyle: .Alert)
        self.alert!.addTextFieldWithConfigurationHandler({ (textField:UITextField) in
            textField.delegate = self
        })
        
        self.presentViewController(self.alert!, animated: true, completion: nil)
    }
    
}

extension TodoTableViewController : UITextFieldDelegate {
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        if let type = self.alertType {
            switch type {
            case .Create:
                let todo = TODO(title: textField.text!)
                if self.todo.create(todo) {
                    textField.text = nil
                    self.tableView?.reloadData()
                }
            case let .Update(index):
                let todo = TODO(title: textField.text!)
                if self.todo.update(todo, at:index) {
                    textField.text = nil
                    self.tableView?.reloadData()
                }
            case let .Remove(index):
                break
            }
        }
        self.alert?.dismissViewControllerAnimated(false, completion: nil)
        return true
    }
}
extension TodoTableViewController : TodoTableViewCellDelegate {
    func updateTodo(index: Int){
        self.alertType = TodoAlertViewType.Update(index)
        
        self.alert = UIAlertController(title: "Edit", message: nil, preferredStyle: .Alert)
        self.alert?.addTextFieldWithConfigurationHandler({ textField in
            textField.text = self.todo[index].title
            textField.delegate = self
        })
        
        self.presentViewController(self.alert!, animated: true, completion: nil)
    }
    
    func removeTodo(index: Int){
        self.alertType = TodoAlertViewType.Remove(index)
        
        self.alert = UIAlertController(title: "Delete", message: nil, preferredStyle:  .Alert)
        self.alert?.addAction(UIAlertAction(title: "Delete", style: .Destructive) { action in
            self.todo.remove(index)
            self.tableView?.reloadData()
        })
        
        self.alert?.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        self.presentViewController(self.alert!, animated: true, completion: nil)
    }
}
extension TodoTableViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return self.todo.size
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = TodoTableViewCell(style: .Default, reuseIdentifier: nil)
        cell.delegate = self
        
        cell.textLabel?.text = self.todo[indexPath.row].title
        cell.tag = indexPath.row
        
        return cell
    }
}

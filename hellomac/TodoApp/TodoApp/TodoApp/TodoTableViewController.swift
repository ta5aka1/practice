//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by Takayasu Sakai on 2015/11/21.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import UIKit

class TodoTableViewController : UIViewController{
    var todo = TodoDataManager.sharedInstance
    var tableView: UITableView?
    
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

}

extension TodoTableViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return self.todo.size
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.textLabel?.text = self.todo[row].title
        
        return cell
    }
}

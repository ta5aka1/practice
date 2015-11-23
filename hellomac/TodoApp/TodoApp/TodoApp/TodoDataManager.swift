//
//  TodoDataManager.swift
//  TodoApp
//
//  Created by Takayasu Sakai on 2015/11/23.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//
import UIKit

struct TODO {
    var title: String
}

class TodoDataManager
{
    let STORE_KEY = "TodoDataManager.store_key"
    var todoList : [TODO]
    
    static let sharedInstance = TodoDataManager()
    
    var size : Int {
        return todoList.count
    }
    
    subscript(index: Int) -> TODO {
        return todoList[index]
    }
    
    private init(){
        let defaults = NSUserDefaults.standardUserDefaults()
        if let data = defaults.objectForKey(self.STORE_KEY) as? [String] {
            self.todoList = data.map { title in
                TODO(title:title)
            }
        } else {
            self.todoList = []
        }
    }
    
    class func validate(todo : TODO!) -> Bool {
        return todo != nil && todo.title != ""
    }
    
    func save () {
        let defaults = NSUserDefaults.standardUserDefaults()
        let data = self.todoList.map{
            todo in todo.title
        }
        defaults.setObject(data, forKey: self.STORE_KEY)
    }
    
    func create( todo : TODO!) -> Bool {
        if(TodoDataManager.validate(todo)) {
            self.todoList.append(todo)
            self.save()
            return true
        }
        return false
    }
    
    func update(todo: TODO!, at index : Int) -> Bool {
        if(index >= self.todoList.count) {
            return false
        }
        
        if TodoDataManager.validate(todo){
            todoList[index] = todo
            self.save()
            return true
        }
        return false
    }
    
    func remove(index : Int) -> Bool {
        if(index >= self.todoList.count){
            return false
        }
        
        self.todoList.removeAtIndex(index)
        self.save()
        
        return true
    }
    
}
//
//  TodoDataManager.swift
//  TodoApp
//
//  Created by Takayasu Sakai on 2015/11/23.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

struct TODO {
    var title: String
}

class TodoDataManager
{
    var todoList : [TODO]
    init(){
        let defaults = NSUserDefaults.standardUserDefaults()
        if let data = defaults.obfectForKey(self.STORE_KEY) as? [String] {
            self.todoList = data.map { title in
                TODO(title:title)
            }
        } else {
            self.todoList = []
        }
    }
    
    func save () {
        let defaults = NSUserDefaults.starndardUserDefaults()
        let data = self.todoList.map{
            todo in todo.title
        }
        defaults.setObject(data, forKey: self.STORE_KEY)
    }
    
    class func validate(todo : TODO!) -> Bool {
        return todo != nil && todo.title != ""
    }
    
    func create( todo : TODO!) -> Bool {
        if(TodoDataManager.validate(todo)) {
            self.todoList.append(todo)
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
            return true
        }
        return false
    }
    
    func remove(index : Int) -> Bool {
        if(index >= self.todoList.count){
            return false
        }
        
        self.todoList.removeAtIndex(index)
        return true
    }
    
}
//
//  Todo.swift
//  TodoApplication
//
//  Created by Takayasu Sakai on 2016/01/24.
//  Copyright © 2016年 Takayasu Sakai. All rights reserved.
//

import Foundation
import CoreData

@objc(Todo)
class Todo: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    @NSManaged var item: String

}

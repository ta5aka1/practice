//
//  Model.swift
//  ModelSample
//
//  Created by Takayasu Sakai on 2015/12/21.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

import Foundation

class Model{
    private var myFavorites = ["ガッキー", "ささきき","まぎー"]
    
    subscript(num: Int) -> String{
        get{
            return self.myFavorites[num]
        }
        set{
            self.myFavorites[num] = newValue
        }
    }
}
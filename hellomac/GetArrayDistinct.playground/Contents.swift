//: Playground - noun: a place where people can play

import UIKit

func distinct<T: Equatable>(source: [T]) -> [T] {
    var unique = [T]()
    for item in source{
        if !unique.contains(item) {
            unique.append(item)
        }
    }
    return unique
}

class CustomClass:Equatable{
    let name: String!
    let hobby: String!
    
    init(name:String, hobby: String){
        self.name = name
        self.hobby = hobby
    }
}

func == (lhs: CustomClass, rhs: CustomClass) -> Bool{
    return lhs.name == rhs.name
}

let yamada = CustomClass(name: "山田", hobby: "スキー")
let yamada2 = CustomClass(name: "山田", hobby: "ゲーム")
let tanaka = CustomClass(name: "田中", hobby: "ゲーム")

print (yamada == yamada2)
print (yamada == tanaka)

let persons = [yamada, yamada2, tanaka]
for person in distinct(persons){
    print(person.name)
}
//: Playground - noun: a place where people can play

import UIKit

let fans = [("Aさん", "ガッキー"),("Bさん","ささきき"),("Cさん","さとみ")]

let fansOfGakki = fans.filter{(_, target) in
    return target == "ガッキー"
}

print(fansOfGakki)

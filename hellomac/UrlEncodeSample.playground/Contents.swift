//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let urlString = "http://roketnews24.com/2015/07/17/【609089"
if let encodeUrlString = urlString
    .stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()){
    print(encodeUrlString)
}
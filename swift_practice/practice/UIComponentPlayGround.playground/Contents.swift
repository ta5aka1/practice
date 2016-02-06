//: Playground - noun: a place where people can play

import UIKit

var button = UIButton(frame: CGRectMake(0, 0, 100, 50))

button.backgroundColor = UIColor.blueColor()
button.setTitle("Button", forState: UIControlState.Normal)

button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)

var slider = UISlider(frame: CGRectMake(0, 0, 100, 30))
slider.minimumValue = 0.0
slider.maximumValue = 100.0
slider.value = 75.0

var label = UILabel(frame: CGRectMake(0, 0, 100, 30))

label.text = "Swift"
label.textAlignment = NSTextAlignment.Center
label.backgroundColor = UIColor( red: 0.5, green: 1.0, blue: 1.0, alpha: 1.0)
label.textColor = UIColor.whiteColor()

var textField = UITextField(frame: CGRectMake(0, 0, 100, 30))
var textView = UITextView(frame: CGRectMake(0, 0, 150, 100))

textField.text = "UITextField"
textView.text = "1行目\n2行目\n3行目"

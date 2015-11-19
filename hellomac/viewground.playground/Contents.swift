
import UIKit
var str = "Hello playground."

func UIColorFromRGB(rgbValue: UInt) -> UIColor{
    return UIColor(
        red : CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green : CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue : CGFloat((rgbValue & 0x0000FF)) / 255.0,
        alpha : CGFloat(1.0)
    )
}

let size = CGSize(width:200, height:200)

let view:UIView = UIView(frame: CGRect(origin:CGPointZero, size: size))
view.backgroundColor = UIColor(white:0.9, alpha:1.0)

UIGraphicsBeginImageContextWithOptions(size, false, 0)

let path = UIBezierPath()
path.moveToPoint(CGPointMake(50,50))
path.addLineToPoint(CGPointMake(150,50))
path.addLineToPoint(CGPointMake(150,150))
path.addLineToPoint(CGPointMake(50, 150))
path.addLineToPoint(CGPointMake(50,50))
UIColor.orangeColor().setStroke()
path.stroke()

UIColorFromRGB(0xFF0000).setFill()
path.fill()

let attrString = NSAttributedString(
    string: "Hello World!",
    attributes: [NSForegroundColorAttributeName: UIColor.blackColor(),
        NSFontAttributeName: UIFont.boldSystemFontOfSize(15.0)])
attrString.drawAtPoint(CGPointMake(50, 50))

view.layer.contents = UIGraphicsGetImageFromCurrentImageContext().CGImage

UIGraphicsEndImageContext()

let preview = view







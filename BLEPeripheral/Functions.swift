//
//  Functions.swift
//  huilvchaxun
//
//  Created by qiuhong on 11/24/15.
//  Copyright © 2015 qiuhhong. All rights reserved.
//

import Foundation
import Dispatch
import UIKit

let PI = 3.14159265358979323846
let EARTH_RADIUS = 6378.137
let screenW = UIScreen.mainScreen().bounds.width
let screenH = UIScreen.mainScreen().bounds.height

func afterDelay(seconds: Double, closure: () -> ()) {
    let when = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(when, dispatch_get_main_queue(), closure)
}

func alertView(title: String, message: String, okActionTitle: String, cancleActionTitle: String, okHandler: ((action: UIAlertAction!) -> Void)?, viewController: UIViewController){
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    let cancelAction = UIAlertAction(title: cancleActionTitle, style: UIAlertActionStyle.Cancel, handler: nil)
    let okAction = UIAlertAction(title: okActionTitle, style: UIAlertActionStyle.Destructive, handler: okHandler)
    alert.addAction(cancelAction)
    alert.addAction(okAction)
    viewController.presentViewController(alert, animated: true, completion: nil)
}

func alertView(title: String, message: String, okActionTitle: String, okHandler: ((action: UIAlertAction!) -> Void)?, viewController: UIViewController){
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    let okAction = UIAlertAction(title: okActionTitle, style: UIAlertActionStyle.Default, handler: okHandler)
    alert.addAction(okAction)
    viewController.presentViewController(alert, animated: true, completion: nil)
}

extension UIColor {
    
    class func colorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func RGBColor(red red: Double, green: Double, blue: Double, alpha: Double) -> UIColor {
        return UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: CGFloat(alpha))
    }
}

func systemTimeYYYYMMddHHmmss() -> String{
    let date = NSDate()
    let timeFormatter = NSDateFormatter()
    timeFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
    let systemTime = timeFormatter.stringFromDate(date) as String
    return systemTime
}

func systemTimeHHmmss() -> String{
    let date = NSDate()
    let timeFormatter = NSDateFormatter()
    timeFormatter.dateFormat = "HH:mm:ss"
    let systemTime = timeFormatter.stringFromDate(date) as String
    return systemTime
}
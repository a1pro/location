//
//  Helper.swift
//  CartoonMe
//
//  Created by iApp on 21/07/22.
//

import UIKit

class Helper: NSObject {
    
    //MARK:- DISPATCH METHODS
    static func dispatchDelay(deadLine: DispatchTime , execute : @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: deadLine, execute: execute)
    }
    
    static func  dispatchMain(execute : @escaping () -> Void) {
        DispatchQueue.main.async(execute: execute)
    }
    
    static func dispatchBackground(execute : @escaping () -> Void) {
        DispatchQueue.global().async(execute: execute)
    }
    
    static func dispatchMainAfter(time : DispatchTime , execute :@escaping (() -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: time, execute: execute)
    }
    
    
    
    /// Logs all available fonts from iOS SDK and installed custom font
    class func logAllAvailableFonts() {
        for family in UIFont.familyNames {
            print("\(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }
    }
    
}

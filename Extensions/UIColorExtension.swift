//
//  UIColorExtension.swift
//  CartoonMe
//
//  Created by iApp on 25/07/22.
//

import UIKit
//Reference = https://medium.com/ios-os-x-development/a-smart-way-to-manage-colours-schemes-for-ios-applications-development-923ef976be55
//let shadowColor = Color.shadow.value
//let shadowColorWithAlpha = Color.shadow.withAlpha(0.5)
//let customColorWithAlpha = Color.custom(hexString: "#123edd", alpha: 0.25).value
enum Color {
    
    case theme
    case border
    case shadow
    
    case lightBackground
    
    case darkText
    case lightText
    case intermidiateText
    
    // 1
//    case custom(hexString: String, alpha: Double)
    // 2
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

extension Color{
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        switch self {
        case .border:
            instanceColor = UIColor(r: 0, g: 0, b: 0, a: 0.5)
        case .theme:
            instanceColor = UIColor.white
        case .shadow:
            instanceColor = UIColor(r: 0, g: 0, b: 0, a: 0.14)
        case .lightBackground:
            instanceColor = UIColor(r: 237, g: 241, b: 242, a: 1.0)
        case .darkText:
            instanceColor = UIColor(r: 84, g: 84, b: 84, a: 1.0)
        case .intermidiateText:
            instanceColor = UIColor(r: 87, g: 87, b: 87, a: 1.0)
        case .lightText:
            instanceColor = UIColor(r: 119, g: 119, b: 119, a: 1.0)
//        case .custom(let hexValue, let opacity):
//            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
        }
        return instanceColor
    }
    
}

extension UIColor{
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat,a: CGFloat = 1.0) {
      self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
}

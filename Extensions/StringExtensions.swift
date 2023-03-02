//
//  StringExtensions.swift
//  CartoonMe
//
//  Created by iApp on 25/07/22.
//

import UIKit

extension String {
    func attributedTo(font: UIFont,spacing:CGFloat = 0.0, lineSpacing: CGFloat = 0 ,color: UIColor? = nil) -> NSMutableAttributedString{
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.lineSpacing = lineSpacing
        
        let range = NSMakeRange(0, self.count)
        let attrStr = NSMutableAttributedString(string: self)
        attrStr.addAttribute(.font, value: font, range: range)
        attrStr.addAttribute(.kern, value: spacing, range: range)
        attrStr.addAttribute(.paragraphStyle, value: paraStyle, range: range)
//        NSAttributedString.Key.paragraphStyle: paraStyle,
        if let textColor = color {
            attrStr.addAttribute(.foregroundColor, value: textColor, range: range)
        }
        return attrStr
    }
}

//
//  GenerateRandomColor.swift
//  Location
//
//  Created by Rakesh on 01/03/23.
//

import Foundation
import UIKit

extension UIColor {
    class var random: UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
}

//
//  ViewControllerExtions.swift
//  Location
//
//  Created by Rakesh on 27/02/23.
//

import Foundation
import UIKit
extension UIViewController{
    static var identifier:String{
        return String(describing: self)
    }
    static func  instantiate() -> Self{
        let storeyboard = UIStoryboard(name: "Main", bundle: nil)
        return storeyboard.instantiateViewController(withIdentifier: identifier) as! Self
        
    }
}

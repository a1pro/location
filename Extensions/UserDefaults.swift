//
//  UserDefaults.swift
//  Location
//
//  Created by Rakesh on 27/02/23.
//

import Foundation
import UIKit
extension UserDefaults{
    private enum userDefaultKeys:String{
        case hasOnboarded
    }
    var hasOnboarded:Bool{
        get{
            bool(forKey: userDefaultKeys.hasOnboarded.rawValue)
        }
        set{
            setValue(newValue, forKey: userDefaultKeys.hasOnboarded.rawValue)
            
        }
        
    }
}

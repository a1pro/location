//
//  AppStoryboard.swift
//  CartoonMe
//
//  Created by iApp on 21/07/22.
//

import UIKit


enum AppStoryboard : String {
    case Main, Home, Draft, Toon
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T{
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    
    func initialViewController() -> UIViewController?{
        return instance.instantiateInitialViewController()
    }
}


extension UIViewController {
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func initiantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self{
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    //    func howToUse(){
    //        let homeScreen = ViewController.initiantiate(fromAppStoryboard: .Main)
    //    }
}

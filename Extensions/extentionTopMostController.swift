//
//  extentionTopMostController.swift
//  CartoonMe
//
//  Created by Rajeev Dhiman on 25/08/22.
//

import Foundation
import UIKit

extension UIViewController {
    func topMostViewController() -> UIViewController {
        if self.presentedViewController == nil {
            return self
        }
        if let navigation = self.presentedViewController as? UINavigationController {
            return navigation.visibleViewController!.topMostViewController()
        }
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab
            }
            return tab.topMostViewController()
        }
        return self.presentedViewController!.topMostViewController()
    }
}

extension UIApplication {
    func topMostViewController() -> UIViewController? {
        return self.keyWindow?.rootViewController?.topMostViewController()
    }
}
/*
extension UIApplication {

    class func topViewController(base: UIViewController? = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {

            return topViewController(base: nav.visibleViewController)

        }

        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }

        if let _ = base as? UIAlertController {
            return nil
        }

        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }

        return base

    }

}
*/

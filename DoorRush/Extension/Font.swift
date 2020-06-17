//
//  Font.swift
//  DoorRush
//
//  Created by edwin on 06/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

extension UIFont {
    class func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "TTNorms-Regular", size: size)!
    }
    class func light(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "TTNorms-Light", size: size)!
    }
    class func medium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "TTNorms-Medium", size: size)!
    }
    class func bold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "TTNorms-Bold", size: size)!
    }
}

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        if self.children.count > 0 {
            let viewControllers:[UIViewController] = self.children
            for viewContoller in viewControllers{
                viewContoller.willMove(toParent: nil)
                viewContoller.view.removeFromSuperview()
                viewContoller.removeFromParent()
            }
        }
    }
}

extension UINavigationBar {
    func setCustomFont() {
        titleTextAttributes = [NSAttributedString.Key.font: UIFont.bold(ofSize: 18)]
        largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.bold(ofSize: 35)]
    }
}

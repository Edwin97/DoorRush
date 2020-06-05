//
//  TabBarController.swift
//  Adventure App
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTabBar()
        customTabBarFont()
        
        tabBar.barTintColor = .white
        tabBar.tintColor = UIColor(named: "red")
        
        
    }
    
    func customTabBarFont() {
        let appearance = UITabBarItem.appearance()
        appearance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "TTNorms-Medium", size: 14)!], for: .normal)
//        appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "grey")!], for: .normal)
        appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemRed], for: .selected)
    }
    
    func setupTabBar() {
        
        let activityController =  UINavigationController(rootViewController: ActivityController())
        activityController.tabBarItem = UITabBarItem(title: "Delivery", image: UIImage(named: "activityTabView"), tag: 0)
        
        let exploreController =  UINavigationController(rootViewController: ExploreController())
        exploreController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "searchTabView"), tag: 0)
        
        let orderController = UINavigationController(rootViewController: OrderController())
        orderController.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(named: "orderTabView"), tag: 0)
        
        let settingController = UINavigationController(rootViewController: SettingController())
        settingController.tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "settingTabView"), tag: 0)
        
        self.viewControllers = [activityController, exploreController, orderController, settingController]
    }    
}

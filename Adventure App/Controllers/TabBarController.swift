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
    }
    
    func setupTabBar() {
        let activityController = ActivityController()
        activityController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "activityTabView"), tag: 0)
        
        let exploreController = ExploreController()
        exploreController.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(named: "searchTabView"), tag: 0)
        
        let orderController = OrderController()
        orderController.tabBarItem = UITabBarItem(title: "Order", image: UIImage(named: "orderTabView"), tag: 0)
        
        let settingController = SettingController()
        settingController.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(named: "settingTabView"), tag: 0)
        
        self.viewControllers = [activityController, exploreController, orderController, settingController]
    }    
}

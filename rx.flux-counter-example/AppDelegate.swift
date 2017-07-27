//
//  AppDelegate.swift
//  rx.flux
//
//  Created by Hung Dinh Van on 6/26/17.
//  Copyright © 2017 ChuCuoi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        DI.setup([StoreAssembly(), ViewControllerAssembly()])
        window = UIWindow(frame: UIScreen.main.bounds)
        if let counterVC = DI.resolve() as CounterViewController?, let todoVC = DI.resolve() as TodoViewController? {
            let tabBarVC = UITabBarController()
            let counterNav = UINavigationController(rootViewController: counterVC)
            let todoNav = UINavigationController(rootViewController: todoVC)
            counterNav.tabBarItem.title = "Counter"
            todoNav.tabBarItem.title = "Todo"
            tabBarVC.viewControllers = [counterNav, todoNav]
            window?.rootViewController = tabBarVC
        }
        window?.makeKeyAndVisible()
        return true
    }
}


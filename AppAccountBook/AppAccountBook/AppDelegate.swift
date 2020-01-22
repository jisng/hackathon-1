//
//  AppDelegate.swift
//  AppAccountBook
//
//  Created by 박지승 on 2020/01/21.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13, *) {
            
        } else {
            let todayVC = TodayViewController()
            todayVC.tabBarItem = UITabBarItem(title: "Today",
                                            image: UIImage(systemName: "plus.square.on.square"),
                                            // "plus.square" // plus.circle // plusminus.circle // wonsign.circle // wonsign.square
                                            tag: 0)
            let monthVC = MonthViewController()
            monthVC.tabBarItem = UITabBarItem(title: "Month",
                                              image: UIImage(systemName: "calendar"),
                                              tag: 1)
            let chartVC = ChartViewController()
            chartVC.tabBarItem = UITabBarItem(title: "Stats",
                                              image: UIImage(systemName: "line.horizontal.3.decrease"),
                                              tag: 2)
            
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [todayVC, monthVC, chartVC]
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = tabBarController
            window?.makeKeyAndVisible()
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


//
//  AppDelegate.swift
//  app-LocalStore
//
//  Created by Walter Luis Deonísio Junior on 18/10/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CustomTabBarViewController()
        window?.makeKeyAndVisible()
        return true
    }
}


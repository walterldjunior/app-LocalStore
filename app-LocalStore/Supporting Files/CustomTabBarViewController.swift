//
//  CustomTabBarViewController.swift
//  app-LocalStore
//
//  Created by Walter Luis Deonísio Junior on 18/10/20.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setComponents()
    }
    
    fileprivate func setComponents() {
        viewControllers = [
            createNavController(viewController: HomeCollectionViewController(), title: "Home", imageName: "home_off"),
            createNavController(viewController: UIViewController(), title: "Map", imageName: "map_off"),
            createNavController(viewController: UIViewController(), title: "Profile", imageName: "profile_off"),
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: viewController)
//        navVC.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        navVC.navigationBar.barTintColor = UIColor.Theme.primary
        navVC.tabBarItem.image = UIImage(named: imageName)
        navVC.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.white,
                                                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        return navVC
    }
}

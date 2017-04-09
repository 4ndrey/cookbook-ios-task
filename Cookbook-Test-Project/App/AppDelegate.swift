//
//  AppDelegate.swift
//  Cookbook-Test-Project
//
//  Created by Dominik Vesely on 12/01/2017.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navController = UINavigationController(rootViewController: ListController())
        navController.isNavigationBarHidden = true

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }
}


//
//  AppDelegate.swift
//  CordovaApp
//
//  Created by Swetha Sreekanth on 15/8/20.
//

import Foundation
import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         setupRootViewController(launchOptions: launchOptions)
        
        return true
    }
    
    
    // Method to invoke Assign First view controller dynamically
    func setupRootViewController(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let mainVC =  StartViewController()
            navigationController = UINavigationController(rootViewController: mainVC)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }

}

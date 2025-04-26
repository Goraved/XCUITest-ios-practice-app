//
//  AppDelegate.swift
//  TestPracticeApp
//
//  Created by Roman Pobotin on 26.04.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("AppDelegate: application did finish launching")
        
        // Create window directly without using scenes
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Use your LoginViewController as the root
        let loginVC = LoginViewController()
        let navController = UINavigationController(rootViewController: loginVC)
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        print("Window should be visible now")
        return true
    }
}

//
//  AppDelegate.swift
//  Test
//
//  Created by Viktor Golubenkov on 12.02.2021.
//

import UIKit

@available(iOS 13.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //MARK: - tabBar items color
        UITabBar.appearance().tintColor = #colorLiteral(red: 0, green: 0.2080000043, blue: 0.5799999833, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.5139999986, green: 0.5649999976, blue: 0.6430000067, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor(named: "colorBlue")
        
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


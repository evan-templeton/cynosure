//
//  AppDelegate.swift
//  Cynosure
//
//  Created by Lacy P. Smith  on 8/21/20.
//  Copyright © 2020 Evan Templeton. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
        
        
    }
    
//    func configureInitialViewController() {
//        let storyBoard = UIStoryboard(name: "Welcome", bundle: nil)
//        if Auth.auth().currentUser != nil {
//            window?.rootViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
//        } else {
//            print("Success?")
//            window?.rootViewController = storyBoard.instantiateViewController(withIdentifier: "WelcomeVC") as! UINavigationController
//        }
//        window?.makeKeyAndVisible()
//    }

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


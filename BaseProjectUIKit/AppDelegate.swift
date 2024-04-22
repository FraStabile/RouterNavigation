//
//  AppDelegate.swift
//  BaseProjectUIKit
//
//  Created by Francesco Stabile on 22/04/24.
//

import UIKit
import HomeModule
import CoreLayer
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
    
    func application(_ application: UIApplication,
                         open url: URL,
                         options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        /// Handle the URL property accordingly
        print(url)
        return true
    }
}


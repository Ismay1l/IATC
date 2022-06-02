//
//  AppDelegate.swift
//  TaxiApp
//
//  Created by Ismayil Ismayilov on 02.05.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let vc = MapViewController()
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        return true
    }
}


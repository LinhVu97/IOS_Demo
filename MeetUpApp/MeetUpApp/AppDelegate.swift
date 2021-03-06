//
//  AppDelegate.swift
//  MeetUpApp
//
//  Created by Vũ Linh on 15/07/2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupView()
        return true
    }

    // Setup Window View
    private func setupView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabbarViewController()
        window?.makeKeyAndVisible()
    }
}

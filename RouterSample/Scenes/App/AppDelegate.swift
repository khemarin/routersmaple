//
//  AppDelegate.swift
//  RouterSample
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var appRouter = AppRouter()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        appRouter.start()
        return true
    }

}


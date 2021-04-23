//
//  AppRouter.swift
//  RouterSample
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/22.
//

import UIKit

class AppRouter: BaseRouter {
    let window: UIWindow

    init(window: UIWindow? = nil) {
        if let expectedWindow = window {
            self.window = expectedWindow
        } else {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window.backgroundColor = .white
        }
    }

    override func start() {
        let tabBarRouter = TabBarRouter()
        addChild(tabBarRouter)
        window.rootViewController = tabBarRouter.controller
        window.makeKeyAndVisible()
        tabBarRouter.start()
    }
}

//
//  TabBarRouter.swift
//  RouterSample
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/22.
//

import UIKit

class TabBarRouter: BaseRouter {
    let controller: UITabBarController

    override init() {
        controller = UITabBarController()
    }

    override func start() {
        let homeRouter = HomeRouter()
        addChild(homeRouter)
        homeRouter.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        homeRouter.start()

        let searchRouter = SearchRouter()
        addChild(searchRouter)
        searchRouter.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        searchRouter.start()

        let tabControllers: [UIViewController] = [
            homeRouter.navigationController,
            searchRouter.navigationController
        ]

        controller.setViewControllers(tabControllers, animated: false)
    }
}

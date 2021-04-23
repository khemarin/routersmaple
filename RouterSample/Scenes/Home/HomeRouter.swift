//
//  HomeRouter.swift
//  RouterSample
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/22.
//

import UIKit

class HomeRouter: BaseRouter {
    let navigationController: UINavigationController

    override init() {
        self.navigationController = UINavigationController()
    }

    override func start() {
        let homeViewController = HomeViewController()
        homeViewController.router = self

        for index in 0..<5 {
            let pageRouter = PageRouter(index: index)
            addChild(pageRouter)
            pageRouter.start()
        }

        navigationController.pushViewController(homeViewController, animated: false)
        if let viewController = viewControllerAtIndex(0) {
            homeViewController.setViewControllers(
                [viewController],
                direction: .forward,
                animated: false,
                completion: nil
            )
        }
    }

    func viewControllerBefore(viewController: UIViewController) -> UIViewController? {
        guard let index = indexOf(viewController: viewController) else {
            return nil
        }
        return viewControllerAtIndex(index - 1)
    }

    func viewControllerAfter(viewController: UIViewController) -> UIViewController? {
        guard let index = indexOf(viewController: viewController) else {
            return nil
        }
        return viewControllerAtIndex(index + 1)
    }

    private func indexOf(viewController: UIViewController) -> Int? {
        let index = children.firstIndex(where: { ($0 as? PageRouter)?.viewController === viewController })
        return index
    }

    private func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        guard index >= 0, index < children.count else {
            return nil
        }
        return (children[index] as? PageRouter)?.viewController
    }
}

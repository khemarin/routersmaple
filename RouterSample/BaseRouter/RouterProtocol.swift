//
//  RouterProtocol.swift
//  RouterSample
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/21.
//

import UIKit

protocol RouterProtocol: class {
    var identifier: String { get set }
    var children: [RouterProtocol] { get set }
    var parent: RouterProtocol? { get set }

    func addChild(_ child: RouterProtocol)
    func removeChild(_ child: RouterProtocol)

    func start()
    func end()
}

protocol StackRouterProtocol: class {
    var navigationController: UINavigationController { get set }
    var viewController: UIViewController? { get set }

    func popToRouter(_ router: StackRouterProtocol, animated: Bool)
    func popToRoot(animated: Bool)
}

extension StackRouterProtocol where Self: RouterProtocol {
    typealias CurrentType = StackRouterProtocol & RouterProtocol
    func popToRouter(_ router: CurrentType, animated: Bool) {
        if router === self {
            return
        }
        guard router.navigationController === navigationController,
              let viewController = router.viewController else {
            return
        }
        // Clean up the in between router
        var tmpParent = self.parent
        while tmpParent != nil, tmpParent !== router {
            var currentParent = tmpParent
            tmpParent = currentParent?.parent
            currentParent = nil
        }
        navigationController.popToViewController(viewController, animated: animated)
    }

    func popToRoot(animated: Bool) {
        // Clean up the in between router

        navigationController.popToRootViewController(animated: animated)
    }
}

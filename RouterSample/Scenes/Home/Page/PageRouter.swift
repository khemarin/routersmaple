//
//  PageRouter.swift
//  RouterSample
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/22.
//

import UIKit

class PageRouter: BaseRouter {
    let viewController: PageViewController
    let index: Int
    init(index: Int) {
        viewController = PageViewController()
        self.index = index
    }

    override func start() {
        viewController.label.text = "Page \(index)"
    }
}

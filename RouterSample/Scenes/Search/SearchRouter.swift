//
//  SearchRouter.swift
//  RouterSample
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/22.
//

import UIKit

class SearchRouter: BaseRouter {
    let navigationController: UINavigationController
    private weak var viewModel: SearchViewModel?

    override init() {
        self.navigationController = UINavigationController()
    }

    override func start() {
        let searchViewController = SearchViewController()
        searchViewController.router = self
        navigationController.pushViewController(searchViewController, animated: false)
        self.viewModel = searchViewController.viewModel
    }

    func didSelectItem(atIndex index: Int) {
        guard let id = viewModel?.idAtIndex(index) else {
            return
        }
        print("selected item: \(id)")
    }
}

//
//  HomeViewController.swift
//  RouterSample
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/22.
//

import UIKit

class HomeViewController: UIPageViewController {
    weak var router: HomeRouter?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"

        dataSource = self
        delegate = self
    }
}

extension HomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return router?.viewControllerBefore(viewController: viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return router?.viewControllerAfter(viewController: viewController)
    }
}

extension HomeViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {

    }
}

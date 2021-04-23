//
//  HomeRouterTests.swift
//  RouterSampleTests
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/22.
//

import XCTest
@testable import RouterSample

class HomeRouterTests: XCTestCase {

    func testStart() {
        let router = HomeRouter()
        router.start()

        XCTAssertEqual(router.children.count, 5)
    }

    func testPreviousController() {
        let router = HomeRouter()
        router.start()

        let viewController = (router.children[3] as! PageRouter).viewController
        let previousViewController = (router.children[2] as! PageRouter).viewController
        XCTAssert(router.viewControllerBefore(viewController: viewController) === previousViewController)
    }

    func testNextController() {
        let router = HomeRouter()
        router.start()

        let viewController = (router.children[2] as! PageRouter).viewController
        let nextViewController = (router.children[3] as! PageRouter).viewController
        XCTAssert(router.viewControllerAfter(viewController: viewController) === nextViewController)
    }

    func testControllerOutOfBounds() {
        let router = HomeRouter()
        router.start()

        let viewController = (router.children[4] as! PageRouter).viewController
        XCTAssertNil(router.viewControllerAfter(viewController: viewController))
    }

    func testNextControllerOfNotExisted() {
        let router = HomeRouter()
        router.start()

        XCTAssertNil(router.viewControllerAfter(viewController: UIViewController()))
    }

    func testPreviousControllerOfNotExisted() {
        let router = HomeRouter()
        router.start()

        XCTAssertNil(router.viewControllerBefore(viewController: UIViewController()))
    }
}

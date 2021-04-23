//
//  AppRouterTests.swift
//  RouterSampleTests
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/22.
//

import XCTest
@testable import RouterSample

class AppRouterTests: XCTestCase {

    func testInit() {
        let router = AppRouter()
        XCTAssertNotNil(router.window)
    }

    func testStart() {
        let router = AppRouter(window: MockWindow())

        XCTAssertTrue(router.children.isEmpty)

        router.start()
        XCTAssertTrue(TabBarRouter.didOpenFrom(router))
        XCTAssertEqual(router.children.count, 1)

        let tabBarRouter = router.children[0] as? TabBarRouter
        XCTAssert(tabBarRouter?.children[0] is HomeRouter)
        XCTAssert(tabBarRouter?.children[1] is SearchRouter)
    }
}

private class MockWindow: UIWindow {
    override func makeKeyAndVisible() {
        // Do nothing
    }
}

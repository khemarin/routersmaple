//
//  Router+Helper.swift
//  RouterSampleTests
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/22.
//

import Foundation
@testable import RouterSample

extension RouterProtocol {
    func childRouter<T>() -> T? {
        return children.first(where: { $0 is T }) as? T
    }

    static func didOpenFrom(_ router: RouterProtocol) -> Bool {
        let selfIfOpened: Self? = router.childRouter()
        return selfIfOpened != nil
    }
}

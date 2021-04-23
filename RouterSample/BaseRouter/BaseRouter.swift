//
//  BaseRouter.swift
//  RouterSample
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/21.
//

import Foundation

class BaseRouter: RouterProtocol {
    weak var parent: RouterProtocol?
    var identifier: String
    var children: [RouterProtocol]

    init() {
        identifier = UUID().uuidString
        children = []
    }

    func addChild(_ child: RouterProtocol) {
        children.append(child)
        child.parent = self
    }

    func removeChild(_ child: RouterProtocol) {
        child.parent = nil
        children.removeAll(where: { $0.identifier == child.identifier })
    }

    func start() {

    }

    func end() {
        parent?.removeChild(self)
    }
}

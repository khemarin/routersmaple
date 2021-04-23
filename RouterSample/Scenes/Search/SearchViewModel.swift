//
//  SearchViewModel.swift
//  RouterSample
//
//  Created by Loch, Khemarin | Cameron | ECMPD on 2021/04/22.
//

import Foundation

private class Item {
    let name: String
    let id: String

    init(name: String) {
        id = UUID().uuidString
        self.name = name
    }
}

class SearchViewModel {
    private var items: [Item]

    init() {
        items = (0...30).map { Item(name: "Item \($0)") }
    }

    func totalItems() -> Int {
        return items.count
    }

    func titleAtIndex(_ index: Int) -> String? {
        if index >= 0, index < items.count {
            return items[index].name
        }
        return nil
    }

    func idAtIndex(_ index: Int) -> String? {
        if index >= 0, index < items.count {
            return items[index].id
        }
        return nil
    }
}

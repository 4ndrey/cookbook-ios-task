//
//  TableAdapter.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 08.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import ACKategories

class TableAdapter<Item, Cell: BaseCell>: NSObject, UITableViewDataSource, UITableViewDelegate {

    private weak var tableView: UITableView?
    private var items = [Item]()
    var didSelect: ((Item) -> Void)?

    init(tableView: UITableView) {
        super.init()

        tableView.dataSource = self
        tableView.delegate = self
        self.tableView = tableView
    }

    func update(collection: [Item]) {
        items = collection
        tableView?.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeCellForIndexPath(indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? Cell)?.updateWithItem(items[indexPath.row] as Any)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let didSelect = didSelect {
            didSelect(items[indexPath.row])
        }
    }
}

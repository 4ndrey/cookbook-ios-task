//
//  ListController.swift
//  Cookbook-Test-Project
//
//  Created by Andrey Toropchin on 08.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class ListController: BaseViewController {

    private var viewModel: ListViewModeling?
    private var tableAdapter: TableAdapter<ReceiptViewModeling, ListCell>?

    convenience init(viewModel: ListViewModeling) {
        self.init(nibName: nil, bundle: nil)
        
        viewModel.recipes.producer
            .on(value: { self.tableAdapter?.update(collection: $0) })
            .start()
        viewModel.errorMessage.producer
            .on(value: { self.displayErrorMessage($0) })
            .start()
        self.viewModel = viewModel
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.reload()
    }

    override func setupUI() {
        // prepare nav bar
        let addButton = AddButton(style: .blue)
        addButton.addTarget(self, action: #selector(addReceipt), for: .primaryActionTriggered)
        let navBar = NavBar(title: "Recepty".localized(), rightItem: addButton)

        // prepare table view
        let tableView = UITableView()
        tableView.rowHeight = 142
        tableView.separatorStyle = .none
        
        tableAdapter = TableAdapter(tableView: tableView)
        tableAdapter?.didSelect = { [weak self] receipt in self?.push(DetailsController(viewModel: DetailsViewModel(model: receipt))) }

        // layout views
        ListViewLayout(root: view).layout(navBar: navBar, tableView: tableView)
    }

    func addReceipt() {
        push(AddController())
    }
}


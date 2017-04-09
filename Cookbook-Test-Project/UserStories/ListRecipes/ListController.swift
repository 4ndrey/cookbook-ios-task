//
//  ListController.swift
//  Cookbook-Test-Project
//
//  Created by Andrey Toropchin on 08.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import SnapKit

class ListController: BaseViewController {

    var tableAdapter: TableAdapter<Receipt, ListCell>?
    var api: CookbookAPIServicing!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        self.api = CookbookAPIService(network: Network(), authHandler: nil)
        api.getRecipes().startWithResult { [weak self] result in
            switch result {
            case .success(let items):
                self?.tableAdapter?.update(collection: items)
            case .failure(let error):
                print(error)
            }
        }
    }

    func setupUI() {
        view.backgroundColor = UIColor.white

        let titleLabel = UILabel()

        let attributes: NSDictionary = [
            NSFontAttributeName:UIFont.base(),
            NSForegroundColorAttributeName:UIColor.baseBlack,
            NSKernAttributeName:-0.4
        ]

        let attributedTitle = NSAttributedString(string: "Recepty", attributes: attributes as? [String : AnyObject])

        titleLabel.attributedText = attributedTitle
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }

        let addButton = UIButton()
        addButton.setImage(#imageLiteral(resourceName: "ic_add"), for: .normal)
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-15)
            make.height.width.equalTo(22)
        }

        let tableView = UITableView()
        tableView.rowHeight = 142
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(65)
            make.left.right.bottom.equalToSuperview()
        }
        tableAdapter = TableAdapter(tableView: tableView)
        tableAdapter?.didSelect = { receipt in
            self.navigationController?.pushViewController(DetailsController(), animated: true)

            self.api.getRecipe(id: receipt.id).startWithResult { result in
                print(result)
            }
//            self.api.rateRecipe(id: receipt.id, score: 4).startWithResult { _ in }
        }

//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_add"), style: .plain, target: self, action: #selector(addReceipt))
    }

    func addReceipt() {
        
    }
}


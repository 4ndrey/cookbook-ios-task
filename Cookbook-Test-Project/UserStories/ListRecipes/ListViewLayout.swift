//
//  ListViewLayout.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import SnapKit

class ListViewLayout {
    let root: UIView

    init(root: UIView) {
        self.root = root
    }

    func layout(navBar: UIView, tableView: UIView) {
        root.addSubview(navBar)
        navBar.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(64)
        }

        root.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(65)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

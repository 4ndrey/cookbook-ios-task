//
//  AddViewLayout.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import SnapKit

class AddViewLayout {
    let root: UIView

    init(root: UIView) {
        self.root = root
    }

    func layout(navBar: UIView, nameContainer: UIView, infoContainer: UIView, ingredientsView: UIView) {
        root.addSubview(navBar)
        navBar.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(64)
        }

        root.addSubview(nameContainer)
        nameContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(107)
            make.height.equalTo(86)
        }

        root.addSubview(infoContainer)
        infoContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(nameContainer.snp.bottom).offset(0)
            make.height.equalTo(86)
        }

        root.addSubview(ingredientsView)
        ingredientsView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(infoContainer.snp.bottom).offset(0)
        }
    }
}

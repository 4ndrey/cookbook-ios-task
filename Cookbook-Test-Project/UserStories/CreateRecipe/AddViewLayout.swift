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

    func layout(navBar: UIView, scrollView: UIView, nameContainer: UIView, infoContainer: UIView, ingredientsView: UIView, descContainer: UIView, timeContainer: UIView) {
        root.addSubview(navBar)
        navBar.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(64)
        }

        root.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(navBar.snp.bottom)
        }

        let placeholder = UIView()
        scrollView.addSubview(placeholder)
        placeholder.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.width.equalTo(navBar)
        }

        scrollView.addSubview(nameContainer)
        nameContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(43)
            make.height.equalTo(86)
        }

        scrollView.addSubview(nameContainer)
        nameContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(107)
            make.height.equalTo(86)
        }

        scrollView.addSubview(infoContainer)
        infoContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(nameContainer.snp.bottom).offset(0)
            make.height.equalTo(86)
        }

        scrollView.addSubview(ingredientsView)
        ingredientsView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(infoContainer.snp.bottom).offset(0)
        }

        scrollView.addSubview(descContainer)
        descContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(ingredientsView.snp.bottom).offset(28)
            make.height.equalTo(86)
        }

        scrollView.addSubview(timeContainer)
        timeContainer.snp.makeConstraints { make in
            make.top.equalTo(descContainer.snp.bottom)
            make.left.right.equalTo(descContainer)
            make.height.equalTo(44)
            make.bottom.equalToSuperview()
        }
    }
}

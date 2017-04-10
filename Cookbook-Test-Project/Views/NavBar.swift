//
//  NavBar.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class NavBar: UIView {
    let titleLabel: NavLabel
    let leftItems: UIStackView
    let rightItems: UIStackView

    convenience init(title: String, leftItem: UIView? = nil, rightItem: UIView? = nil) {
        self.init(frame: CGRect.zero)

        titleLabel.text = title
        if let leftItem = leftItem { leftItems.addArrangedSubview(leftItem) }
        if let rightItem = rightItem { rightItems.addArrangedSubview(rightItem) }
    }

    override init(frame: CGRect) {
        titleLabel = NavLabel()
        leftItems = UIStackView()
        rightItems = UIStackView()

        super.init(frame: frame)

        layoutTitle()
        layoutLeft()
        layoutRight()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutTitle() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }

    private func layoutLeft() {
        leftItems.axis = .horizontal
        leftItems.distribution = .fillEqually
        leftItems.alignment = .fill

        addSubview(leftItems)
        leftItems.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8.5)
            make.top.equalToSuperview().offset(31.5)
        }
    }

    private func layoutRight() {
        rightItems.axis = .horizontal
        rightItems.distribution = .fillEqually
        rightItems.alignment = .fill

        addSubview(rightItems)
        rightItems.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-13)
            make.centerY.equalTo(titleLabel)
        }
    }
}

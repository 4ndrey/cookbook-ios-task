//
//  LabeledTextContainer.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import SnapKit

class LabeledTextContainer: UIView {
    let label: UILabel
    let container: TextFieldContainer

    override init(frame: CGRect) {
        label = UILabel()
        container = TextFieldContainer()

        super.init(frame: frame)

        label.textColor = UIColor.blue
        label.font = UIFont.base(size: 14)
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(17)
        }

        addSubview(container)
        container.snp.makeConstraints { make in
            make.left.equalTo(label)
            make.right.equalTo(label)
            make.top.equalTo(label.snp.bottom).offset(12)
            make.height.equalTo(28)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

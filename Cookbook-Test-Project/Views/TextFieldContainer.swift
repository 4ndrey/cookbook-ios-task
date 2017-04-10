//
//  TextField.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import SnapKit

class TextFieldContainer: UIView {
    let textField: UITextField

    override init(frame: CGRect) {
        textField = UITextField()

        super.init(frame: frame)

        textField.borderStyle = .none
        textField.textColor = UIColor.baseBlack
        textField.font = UIFont.base(size: 16)
        addSubview(textField)
        textField.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(16)
        }

        let separator = UIView()
        separator.backgroundColor = UIColor.separator
        addSubview(separator)
        separator.snp.makeConstraints { make in
            make.bottom.equalTo(textField.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(2)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

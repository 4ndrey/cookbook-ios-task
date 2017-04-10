//
//  DurationContainer.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class DurationContainer: TextFieldContainer, UITextFieldDelegate {
    let durationField: UITextField

    override init(frame: CGRect) {
        durationField = UITextField()

        super.init(frame: frame)

        textField.text = "Čas".localized()
        textField.delegate = self

        durationField.font = UIFont.base(size: 17)
        durationField.textColor = UIColor.baseBlack
        durationField.placeholder = "60 min."
        textField.rightView = durationField
        textField.rightViewMode = .always
        durationField.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(60)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.textField {
            durationField.becomeFirstResponder()
            return false
        }
        return true
    }
}

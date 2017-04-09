//
//  AddController.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class AddController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        let titleLabel = UILabel()

        let attributes: NSDictionary = [
            NSFontAttributeName:UIFont.base(),
            NSForegroundColorAttributeName:UIColor.baseBlack,
            NSKernAttributeName:-0.4
        ]

        let attributedTitle = NSAttributedString(string: "Přidat recept", attributes: attributes as? [String : AnyObject])

        titleLabel.attributedText = attributedTitle
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }

        let backButton = BlueBackButton()
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8.5)
            make.top.equalToSuperview().offset(31.5)
            make.height.equalTo(21)
        }

        let createButton = UIButton()
        createButton.setTitleColor(UIColor.blue, for: .normal)
        createButton.setTitleColor(UIColor.gray, for: .highlighted)
        createButton.setTitle("Přidat", for: .normal)
        createButton.titleLabel?.font = UIFont.base(size: 17)
        createButton.addTarget(self, action: #selector(addReceipt), for: .touchUpInside)
        view.addSubview(createButton)
        createButton.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.height.equalTo(21)
            make.right.equalToSuperview().offset(-13)
        }

        // Title

        let label = UILabel()
        label.textColor = UIColor.blue
        label.font = UIFont.base(size: 14)
        label.text = "Název receptu".uppercased()
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(107)
            make.height.equalTo(16)
        }

        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = UIColor.baseBlack
        textField.font = UIFont.base(size: 16)
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.left.equalTo(label)
            make.right.equalTo(label)
            make.top.equalTo(label.snp.bottom).offset(12)
            make.height.equalTo(16)
        }

        let separator = UIView()
        separator.backgroundColor = UIColor.separator
        view.addSubview(separator)
        separator.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(2)
        }

        // Info

        let label2 = UILabel()
        label2.textColor = UIColor.blue
        label2.font = UIFont.base(size: 14)
        label2.text = "ÚVODNÍ TEXT".uppercased()
        view.addSubview(label2)
        label2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(separator.snp.bottom).offset(27)
            make.height.equalTo(16)
        }

        let textField2 = UITextField()
        textField2.borderStyle = .none
        textField2.textColor = UIColor.baseBlack
        textField2.font = UIFont.base(size: 16)
        view.addSubview(textField2)
        textField2.snp.makeConstraints { make in
            make.left.equalTo(label2)
            make.right.equalTo(label2)
            make.top.equalTo(label2.snp.bottom).offset(12)
            make.height.equalTo(16)
        }

        let separator2 = UIView()
        separator2.backgroundColor = UIColor.separator
        view.addSubview(separator2)
        separator2.snp.makeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(2)
        }

        // Ingredients

        let label3 = UILabel()
        label3.textColor = UIColor.blue
        label3.font = UIFont.base(size: 14)
        label3.text = "INGREDIENCE".uppercased()
        view.addSubview(label3)
        label3.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(separator2.snp.bottom).offset(27)
            make.height.equalTo(16)
        }

        let ingredients = UIStackView()
        ingredients.axis = .vertical

        view.addSubview(ingredients)
        ingredients.snp.makeConstraints { make in
            make.left.right.equalTo(label3)
            make.top.equalTo(label3.snp.bottom).offset(14)
        }

        for _ in 1...3 {
            let c = TextFieldContainer()
            ingredients.addArrangedSubview(c)
            c.snp.makeConstraints { make in
                make.height.equalTo(40)
            }
        }

        let addButton = UIButton()
        addButton.setImage(#imageLiteral(resourceName: "ic_add_small"), for: .normal)
        addButton.setTitle("Přidat".uppercased(), for: .normal)
        addButton.setTitleColor(UIColor.magenta, for: .normal)
        addButton.setTitleColor(UIColor.gray, for: .highlighted)
        addButton.layer.cornerRadius = 10
        addButton.layer.borderColor = UIColor.magenta.cgColor
        addButton.layer.borderWidth = 2
        addButton.titleLabel?.font = UIFont.base(size: 12)
        addButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8)
        addButton.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0)

        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.top.equalTo(ingredients.snp.bottom).offset(16)
            make.left.equalTo(label3)
            make.height.equalTo(32)
            make.width.equalTo(82)
        }

        // Desc

        let label4 = UILabel()
        label4.textColor = UIColor.blue
        label4.font = UIFont.base(size: 14)
        label4.text = "POSTUP".uppercased()
        view.addSubview(label4)
        label4.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(addButton.snp.bottom).offset(28)
            make.height.equalTo(16)
        }

        let c1 = TextFieldContainer()
        view.addSubview(c1)
        c1.snp.makeConstraints { make in
            make.top.equalTo(label4.snp.bottom).offset(3)
            make.left.right.equalTo(label4)
            make.height.equalTo(40)
        }

        let c2 = TextFieldContainer()
        c2.textField.text = "Čas"
        view.addSubview(c2)
        c2.snp.makeConstraints { make in
            make.top.equalTo(c1.snp.bottom).offset(16)
            make.left.right.equalTo(label4)
            make.height.equalTo(44)
        }
    }

    func addReceipt() {

    }
}

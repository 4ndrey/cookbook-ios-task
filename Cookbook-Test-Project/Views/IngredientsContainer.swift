//
//  IngredientsContainer.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

class IngredientsContainer: UIView {
    private let ingredients: UIStackView

    var values = MutableProperty<[String]>([])

    override init(frame: CGRect) {
        ingredients = UIStackView()

        super.init(frame: frame)

        let label = UILabel()
        label.textColor = UIColor.blue
        label.font = UIFont.base(size: 14)
        label.text = "Ingredience".localized().uppercased()
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(16)
        }

        ingredients.axis = .vertical
        addSubview(ingredients)
        ingredients.snp.makeConstraints { make in
            make.left.right.equalTo(label)
            make.top.equalTo(label.snp.bottom).offset(15)
        }

        let addButton = UIButton()
        addButton.addTarget(self, action: #selector(addElement), for: .primaryActionTriggered)
        addButton.setImage(#imageLiteral(resourceName: "ic_add_small"), for: .normal)
        addButton.setTitle("Přidat".localized().uppercased(), for: .normal)
        addButton.setTitleColor(UIColor.magenta, for: .normal)
        addButton.setTitleColor(UIColor.gray, for: .highlighted)
        addButton.layer.cornerRadius = 10
        addButton.layer.borderColor = UIColor.magenta.cgColor
        addButton.layer.borderWidth = 2
        addButton.titleLabel?.font = UIFont.base(size: 12)
        addButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8)
        addButton.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0)

        addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.top.equalTo(ingredients.snp.bottom).offset(16)
            make.left.equalTo(label)
            make.height.equalTo(32)
            make.width.equalTo(82)
            make.bottom.equalToSuperview()
        }

        addElement()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func addElement() {
        let c = TextFieldContainer()
        ingredients.addArrangedSubview(c)
        c.snp.makeConstraints { make in
            make.height.equalTo(40)
        }

        var array = [Signal<String, NoError>]()
        for c in ingredients.arrangedSubviews {
            if let textContainer = c as? TextFieldContainer {
                array.append(textContainer.textField.reactive.continuousTextValues.map { $0 ?? "" })
            }
        }
        values <~ Signal.combineLatest(array).map { $0.filter { $0.length > 0 } }

        // update last values
        for c in ingredients.arrangedSubviews {
            if let textContainer = c as? TextFieldContainer {
                textContainer.textField.sendActions(for: .editingChanged)
            }
        }
    }
}

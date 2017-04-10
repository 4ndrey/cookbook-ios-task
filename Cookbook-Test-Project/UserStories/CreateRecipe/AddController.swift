//
//  AddController.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class AddController: BaseViewController {

    private var viewModel: AddViewModeling?
    private var nameContainer: LabeledTextContainer!
    private var infoContainer: LabeledTextContainer!
    private var ingredientsView: IngredientsContainer!
    private var descContainer: LabeledTextContainer!
    private var timeContainer: TextFieldContainer!

    convenience init(viewModel: AddViewModeling) {
        self.init(nibName: nil, bundle: nil)

        viewModel.onCreated.producer
            .on(value: { [weak self] _ in self?.back() })
            .start()
        viewModel.errorMessage.producer
            .on(value: { [weak self] in self?.displayErrorMessage($0) })
            .start()
        self.viewModel = viewModel
    }

    override func setupUI() {
        // prepare nav bar
        let backButton = BackButton(style: .blue)
        backButton.addTarget(self, action: #selector(back), for: .primaryActionTriggered)

        let createButton = NavButton()
        createButton.title = "Přidat".localized()
        createButton.addTarget(self, action: #selector(addReceipt), for: .primaryActionTriggered)

        let navBar = NavBar(title: "Přidat recept".localized(), leftItem: backButton, rightItem: createButton)

        // prepare views
        nameContainer = LabeledTextContainer()
        nameContainer.label.text = "Název receptu".localized().uppercased()

        infoContainer = LabeledTextContainer()
        infoContainer.label.text = "Úvodní text".localized().uppercased()

        ingredientsView = IngredientsContainer()

        descContainer = LabeledTextContainer()
        descContainer.label.text = "Postup".localized().uppercased()

        // layout views
        AddViewLayout(root: view).layout(navBar: navBar, nameContainer: nameContainer, infoContainer: infoContainer, ingredientsView: ingredientsView, descContainer: descContainer)

        // Desc

        let label4 = UILabel()
        label4.textColor = UIColor.blue
        label4.font = UIFont.base(size: 14)
        label4.text =
        view.addSubview(label4)
        label4.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(ingredientsView.snp.bottom).offset(28)
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

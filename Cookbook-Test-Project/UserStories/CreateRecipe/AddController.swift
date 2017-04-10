//
//  AddController.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class AddController: BaseViewController {

    private var viewModel: AddViewModeling?

    private var createButton: NavButton!
    private var nameContainer: LabeledTextContainer!
    private var infoContainer: LabeledTextContainer!
    private var ingredientsView: IngredientsContainer!
    private var descContainer: LabeledTextContainer!
    private var durationContainer: DurationContainer!

    convenience init(viewModel: AddViewModeling) {
        self.init(nibName: nil, bundle: nil)

        viewModel.onCreated.producer
            .on(value: { [weak self] _ in self?.back() })
            .start()
        viewModel.errorMessage.producer
            .on(value: { [weak self] in
                self?.createButton.isEnabled = true
                self?.displayErrorMessage($0)
            })
            .start()

        viewModel.input.name <~ nameContainer.container.textField.reactive.continuousTextValues
        viewModel.input.info <~ infoContainer.container.textField.reactive.continuousTextValues
        viewModel.input.description <~ descContainer.container.textField.reactive.continuousTextValues
        viewModel.input.duration <~ durationContainer.durationField.reactive.continuousTextValues.map { Int($0 ?? "") ?? 0 }

        self.viewModel = viewModel
    }

    override func setupUI() {
        // prepare nav bar
        let backButton = BackButton(style: .blue)
        backButton.addTarget(self, action: #selector(back), for: .primaryActionTriggered)

        createButton = NavButton()
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

        durationContainer = DurationContainer()

        // layout views
        AddViewLayout(root: view).layout(navBar: navBar, nameContainer: nameContainer, infoContainer: infoContainer, ingredientsView: ingredientsView, descContainer: descContainer, timeContainer: durationContainer)
    }

    func addReceipt() {
        view.endEditing(true)
        createButton.isEnabled = false // avoid repeated taps
        viewModel?.input.ingredients.value = ingredientsView.values // can be wrapped via custom reactive extension
        viewModel?.addReceipt()
    }
}

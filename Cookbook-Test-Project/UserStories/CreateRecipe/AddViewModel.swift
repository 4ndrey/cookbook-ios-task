//
//  AddViewModel.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import Foundation
import ReactiveSwift

struct AddReceiptInput {
    var name: String
    var info: String
    var description: String
    var ingredients: [String]
    var duration: Int
}

protocol AddViewModeling {
    var onCreated: Property<Void?> { get }
    var errorMessage: Property<String?> { get }

    var input: AddReceiptInput { get }
    func addReceipt()
}

class AddViewModel: AddViewModeling {
    let input: AddReceiptInput
    private let api: CookbookAPIServicing
    private var disposables = CompositeDisposable()

    var onCreated: Property<Void?> { return Property(_onCreated) }
    private let _onCreated = MutableProperty<Void?>(nil)

    var errorMessage: Property<String?> { return Property(_errorMessage) }
    private let _errorMessage = MutableProperty<String?>(nil)

    init() {
        input = AddReceiptInput(name: "", info: "", description: "", ingredients: [], duration: 0)
        api = CookbookAPIService(network: Network(), authHandler: nil)
    }

    deinit {
        disposables.dispose()
    }

    func addReceipt() {
        disposables += api.createRecipe(name: input.name, description: input.description, info: input.info, duration: input.duration, ingredients: input.ingredients)
            .observe(on: UIScheduler())
            .on(value: { _ in self._onCreated.value = () })
            .on(failed: { self._errorMessage.value = $0.localizedDescription })
            .start()
    }
}

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
    let name: MutableProperty<String?>
    let info: MutableProperty<String?>
    let description: MutableProperty<String?>
    let ingredients: MutableProperty<[String]?>
    let duration: MutableProperty<Int?>
}

protocol AddViewModeling {
    var onCreated: Property<Void?> { get }
    var errorMessage: Property<String?> { get }

    var input: AddReceiptInput { get }
    func addReceipt()
}

class AddViewModel: BaseViewModel, AddViewModeling {
    let input: AddReceiptInput
    private let api: CookbookAPIServicing
    private var disposables = CompositeDisposable()

    var onCreated: Property<Void?> { return Property(_onCreated) }
    private let _onCreated = MutableProperty<Void?>(nil)

    var errorMessage: Property<String?> { return Property(_errorMessage) }
    private let _errorMessage = MutableProperty<String?>(nil)

    override init() {
        input = AddReceiptInput(name: MutableProperty(nil), info: MutableProperty(nil), description: MutableProperty(nil), ingredients: MutableProperty(nil), duration: MutableProperty(nil))
        api = CookbookAPIService(network: Network(), authHandler: nil)

        super.init()
    }

    deinit {
        disposables.dispose()
    }

    func addReceipt() {
        disposables += api.createRecipe(name: input.name.value ?? "", description: input.description.value ?? "", info: input.info.value ?? "", duration: input.duration.value ?? 0, ingredients: input.ingredients.value ?? [])
            .observe(on: UIScheduler())
            .on(value: { _ in self._onCreated.value = () })
            .on(failed: { self._errorMessage.value = self.handleError($0) })
            .start()
    }
}

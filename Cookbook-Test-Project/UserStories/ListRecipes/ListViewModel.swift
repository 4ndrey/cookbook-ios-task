//
//  ListViewModel.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol ListViewModeling {
    var recipes: Property<[ReceiptViewModeling]> { get }
    var errorMessage: Property<String?> { get }

    func reload()
}

class ListViewModel: BaseViewModel, ListViewModeling {
    private let api: CookbookAPIServicing
    private var disposables = CompositeDisposable()

    var recipes: Property<[ReceiptViewModeling]> { return Property(_recipes) }
    private let _recipes = MutableProperty<[ReceiptViewModeling]>([])

    var errorMessage: Property<String?> { return Property(_errorMessage) }
    private let _errorMessage = MutableProperty<String?>(nil)

    override init() {
        api = CookbookAPIService(network: Network(), authHandler: nil)
        super.init()
    }

    deinit {
        disposables.dispose()
    }

    func reload() {
        disposables += api.getRecipes()
            .observe(on: UIScheduler())
            .on(value: { self._recipes.value = $0 })
            .on(failed: { self._errorMessage.value = self.handleError($0) })
            .start()
    }
}

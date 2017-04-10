//
//  DetailsViewModel.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol DetailsViewModeling {
    init(model: ReceiptViewModeling)

    var receipt: Property<ReceiptViewModeling?> { get }
    var errorMessage: Property<String?> { get }

    func reload()
    func rate(score: Int)
}

class DetailsViewModel: DetailsViewModeling {
    private let api: CookbookAPIServicing
    private var disposables = CompositeDisposable()

    var receipt: Property<ReceiptViewModeling?> { return Property(_receipt) }
    private let _receipt = MutableProperty<ReceiptViewModeling?>(nil)

    var errorMessage: Property<String?> { return Property(_errorMessage) }
    private let _errorMessage = MutableProperty<String?>(nil)

    required init(model: ReceiptViewModeling) {
        _receipt.value = model
        api = CookbookAPIService(network: Network(), authHandler: nil)
    }

    deinit {
        disposables.dispose()
    }

    func reload() {
        disposables += api.getRecipe(id: _receipt.value!.id)
            .observe(on: UIScheduler())
            .on(value: { self._receipt.value = $0 })
            .on(failed: { self._errorMessage.value = $0.localizedDescription })
            .start()
    }

    func rate(score: Int) {
        disposables += api.rateRecipe(id: _receipt.value!.id, score: score)
            .observe(on: UIScheduler())
            .on(value: { self._receipt.value = Receipt.with(self.receipt.value!).updateScore($0.score) })
            .on(failed: { self._errorMessage.value = $0.localizedDescription })
            .start()
    }
}

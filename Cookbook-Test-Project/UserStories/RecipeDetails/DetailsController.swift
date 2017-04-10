//
//  DetailsController.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class DetailsController: BaseViewController {

    private var viewModel: DetailsViewModeling?

    private var coverView: DarkenImageView?
    private var titleLabel: UILabel?
    private var scoreView: ScoreView?
    private var timeView: TimeView?
    private var textView: TextView?
    private var rateControl: RateControl?

    convenience init(viewModel: DetailsViewModeling) {
        self.init(nibName: nil, bundle: nil)

        viewModel.receipt.producer
            .on(value: { [weak self] receipt in
                if let receipt = receipt {
                    self?.titleLabel?.text = receipt.name
                    self?.timeView?.time = receipt.duration
                    self?.scoreView?.score = receipt.score
                    self?.textView?.update(info: receipt.info, description: receipt.description, ingredients: receipt.ingredients)
                }
            })
            .start()
        viewModel.errorMessage.producer
            .on(value: { [weak self] in self?.back(); self?.displayErrorMessage($0) })
            .start()
        self.viewModel = viewModel
    }

    override func setupUI() {
        // prepare nav bar
        let backButton = BackButton(style: .white)
        backButton.addTarget(self, action: #selector(back), for: .primaryActionTriggered)
        let addButton = AddButton(style: .white)
        addButton.addTarget(self, action: #selector(addReceipt), for: .primaryActionTriggered)
        let navBar = NavBar(title: "", leftItem: backButton, rightItem: addButton)

        // prepare views
        coverView = DarkenImageView(image: #imageLiteral(resourceName: "img_big"))
        titleLabel = BigTitleLabel()
        timeView = TimeView(style: .white)
        scoreView = ScoreView(style: .white, height: 32)
        textView = TextView()
        rateControl = RateControl()
        rateControl?.action = { [weak self] score in self?.viewModel?.rate(score: score) }

        // layout views
        DetailsViewLayout(root: view).layout(navBar: navBar, coverView: coverView!, titleLabel: titleLabel!, timeView: timeView!, scoreView: scoreView!, textView: textView!, rateView: rateControl!)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.reload()
    }

    func addReceipt() {
        push(AddController())
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
}

//
//  RateControl.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

typealias ActionClosure = (_ score: Int) -> Void

class RateControl: UIView {
    var action: ActionClosure?

    private let stars: UIStackView

    override init(frame: CGRect) {
        stars = UIStackView()

        super.init(frame: frame)

        backgroundColor = UIColor.blue

        let rateLabel = UILabel()
        rateLabel.textColor = UIColor.white
        rateLabel.text = "Ohodnoť tento recept".localized()
        rateLabel.font = UIFont.base(size: 20)

        addSubview(rateLabel)
        rateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(29)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }

        stars.axis = .horizontal
        stars.distribution = .fillEqually
        stars.alignment = .fill
        stars.backgroundColor = UIColor.green

        addSubview(stars)
        stars.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-39)
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
        }

        for i in 1...5 {
            let starButton = UIButton()
            starButton.tag = i
            starButton.alpha = 0.5
            starButton.setBackgroundImage(#imageLiteral(resourceName: "ic_star_white"), for: .normal)
            starButton.addTarget(self, action: #selector(rate(sender:)), for: .primaryActionTriggered)

            stars.addArrangedSubview(starButton)
            starButton.snp.makeConstraints { make in
                make.height.width.equalTo(48)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func rate(sender: UIButton) {
        let score = sender.tag

        for button in stars.arrangedSubviews {
            if let button = button as? UIButton {
                button.alpha = button.tag <= score ? 1 : 0.5
            }
        }

        if let action = action {
            action(score)
        }
    }
}

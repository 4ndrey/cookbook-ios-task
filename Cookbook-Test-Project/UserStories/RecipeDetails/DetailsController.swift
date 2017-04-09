//
//  DetailsController.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import SnapKit

class DetailsController: BaseViewController, UIScrollViewDelegate {
    var coverView: DarkenImageView!
    var coverViewHeight: Constraint!
    var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        coverView = DarkenImageView(image: #imageLiteral(resourceName: "img_big"))
        coverView.contentMode = .scaleAspectFill
        view.addSubview(coverView)
        coverView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            coverViewHeight = make.height.equalTo(UIScreen.main.bounds.size.width).constraint
        }

        let containerView = UIView()
        containerView.backgroundColor = UIColor.magenta
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.bottom.equalTo(coverView)
            make.left.right.equalToSuperview()
            make.height.equalTo(64)
        }

        let titleLabel = UILabel()
        titleLabel.font = UIFont.base(size: 24)
        titleLabel.textColor = UIColor.white
        titleLabel.text = "Čokoládová “nutela” s pomerančem"
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.bottom.equalTo(containerView.snp.top).offset(-30)
        }

        let backButton = BackButton()
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8.5)
            make.top.equalToSuperview().offset(31.5)
            make.height.equalTo(21)
        }

        let addButton = UIButton()
        addButton.setImage(#imageLiteral(resourceName: "ic_add_white"), for: .normal)
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.right.equalToSuperview().offset(-15)
            make.height.width.equalTo(22)
        }

        let scoreView = UIStackView()
        scoreView.axis = .horizontal
        scoreView.distribution = .fillEqually
        scoreView.alignment = .fill
        scoreView.backgroundColor = UIColor.green

        containerView.addSubview(scoreView)
        scoreView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.centerY.equalToSuperview()
            make.height.equalTo(32)
        }

        scoreView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for _ in 1...4 {
            let star = UIImageView(image: #imageLiteral(resourceName: "ic_star_white"))
            scoreView.addArrangedSubview(star)
            star.snp.makeConstraints { make in
                make.height.width.equalTo(32)
            }
        }

        let durationLabel = UILabel()
        durationLabel.font = UIFont.base(size: 15)
        durationLabel.textColor = UIColor.white
        durationLabel.textAlignment = .left
        durationLabel.text = "60 min."

        let timeIcon = UIImageView(image: #imageLiteral(resourceName: "ic_time").withRenderingMode(.alwaysTemplate))
        timeIcon.tintColor = UIColor.white
        containerView.addSubview(timeIcon)
        timeIcon.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-92)
            make.top.equalToSuperview().offset(24)
            make.height.width.equalTo(14)
        }

        containerView.addSubview(durationLabel)
        durationLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(timeIcon.snp.right).offset(9)
            make.height.equalTo(18)
            make.right.equalToSuperview()
        }

        textView = UITextView()
        textView.text = "Když si čokoládovou pomazánku (nebo cokoli jiného) uděláte doma, víte, co jste do ní dali, a dopřejete si samé dobré věci. Je pak už jen na vás, jestli budete pomazánku snídat, či mlsat jen tak ze sklenice. \n\n\n\n\n\n Když si čokoládovou pomazánku (nebo cokoli jiného) uděláte doma, víte, co jste do ní dali, a dopřejete si samé dobré věci. Je pak už jen na vás, jestli budete pomazánku snídat, či mlsat jen tak ze sklenice."
        textView.textColor = UIColor.receiptColor
        textView.font = UIFont.base(size: 16)
        textView.isEditable = false
        textView.textContainerInset = UIEdgeInsetsMake(40, 30, 30, 40)

        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.white
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }

        scrollView.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.width.equalTo(view)
            make.height.equalTo(textView.sizeThatFits(CGSize(width: UIScreen.main.bounds.size.width, height: CGFloat.greatestFiniteMagnitude)).height)
        }

        let rateView = UIView()
        rateView.backgroundColor = UIColor.blue

        scrollView.addSubview(rateView)
        rateView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(textView.snp.bottom)
            make.height.equalTo(160)
        }

        let rateLabel = UILabel()
        rateLabel.textColor = UIColor.white
        rateLabel.text = "Ohodnoť tento recept"
        rateLabel.font = UIFont.base(size: 20)

        rateView.addSubview(rateLabel)
        rateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(29)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }

        let stars = UIStackView()
        stars.axis = .horizontal
        stars.distribution = .fillEqually
        stars.alignment = .fill
        stars.backgroundColor = UIColor.green

        rateView.addSubview(stars)
        stars.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-39)
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
        }

        stars.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for _ in 1...4 {
            let star = UIImageView(image: #imageLiteral(resourceName: "ic_star_white"))
            stars.addArrangedSubview(star)
            star.snp.makeConstraints { make in
                make.height.width.equalTo(48)
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

    var lastOffsetY = CGFloat(0)
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let delta = scrollView.contentOffset.y - lastOffsetY
        if scrollView.contentOffset.y > 0 {
            if delta > 0 {
                for constraint in coverView.constraints {
                    if constraint.firstAttribute == .height {
                        constraint.constant = max(250, constraint.constant - delta)
                    }
                }
            }
        }
        else {
            for constraint in coverView.constraints {
                if constraint.firstAttribute == .height {
                    constraint.constant = UIScreen.main.bounds.width
                }
            }
        }
        lastOffsetY = scrollView.contentOffset.y
    }
}

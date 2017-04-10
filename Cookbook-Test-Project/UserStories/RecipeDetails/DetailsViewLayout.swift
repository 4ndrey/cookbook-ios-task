//
//  DetailsViewLayout.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import SnapKit

class DetailsViewLayout {
    let root: UIView

    init(root: UIView) {
        self.root = root
    }

    func layout(navBar: UIView, coverView: UIView, titleLabel: UIView, timeView: UIView, scoreView: UIView, textView: UIView, rateView: UIView) {
        root.addSubview(coverView)
        coverView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.size.width)
        }

        root.addSubview(navBar)
        navBar.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(64)
        }

        // ---

        let containerView = UIView()
        containerView.backgroundColor = UIColor.magenta
        root.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.bottom.equalTo(coverView)
            make.left.right.equalToSuperview()
            make.height.equalTo(64)
        }

        root.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.bottom.equalTo(containerView.snp.top).offset(-30)
        }

        containerView.addSubview(timeView)
        timeView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-28)
            make.top.equalToSuperview().offset(24)
        }

        containerView.addSubview(scoreView)
        scoreView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.centerY.equalToSuperview()
        }

        // text area

        let scrollView = ScrollView()
        scrollView.minHeight = 250
        scrollView.coverView = coverView
        scrollView.backgroundColor = UIColor.white
        root.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }

        scrollView.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(40)
            make.height.equalTo(1)
        }

        // rating area

        scrollView.addSubview(rateView)
        rateView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(textView.snp.bottom).offset(40)
            make.height.equalTo(160)
            make.width.equalTo(root)
        }
    }
}

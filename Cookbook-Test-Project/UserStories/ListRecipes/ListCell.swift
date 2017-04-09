//
//  ListCell.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 08.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import SnapKit

class ListCell: BaseCell {

    var titleLabel: UILabel
    var valuesView: UIStackView
    var scoreView: UIStackView
    var durationLabel: UILabel

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel()
        titleLabel.font = UIFont.base
        titleLabel.textColor = UIColor.blue

        valuesView = UIStackView()
        valuesView.axis = .vertical
        valuesView.spacing = 10

        scoreView = UIStackView()
        scoreView.axis = .horizontal
        scoreView.distribution = .fillEqually
        scoreView.alignment = .fill

        durationLabel = UILabel()
        durationLabel.font = UIFont.base(size: 15)
        durationLabel.textColor = UIColor.baseBlack
        durationLabel.textAlignment = .left

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let iconView = UIImageView(image: #imageLiteral(resourceName: "img_small"))
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(30)
            make.height.width.equalTo(96)
        }

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.left.equalTo(iconView.snp.right).offset(18)
            make.right.equalToSuperview().offset(-31)
        }

        contentView.addSubview(valuesView)
        valuesView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalTo(titleLabel)
            make.right.equalTo(titleLabel)
        }

        let container1 = UIView()
        valuesView.addArrangedSubview(container1)
        container1.snp.makeConstraints { make in
            make.height.equalTo(16)
        }

        container1.addSubview(scoreView)
        scoreView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
        }

        let container2 = UIView()
        valuesView.addArrangedSubview(container2)
        container2.snp.makeConstraints { make in
            make.height.equalTo(18)
        }

        let timeIcon = UIImageView(image: #imageLiteral(resourceName: "ic_time"))
        container2.addSubview(timeIcon)
        timeIcon.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalTo(container2)
            make.height.width.equalTo(14)
        }

        container2.addSubview(durationLabel)
        durationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(container2)
            make.left.equalTo(timeIcon.snp.right).offset(9)
            make.height.equalTo(18)
            make.right.equalToSuperview()
        }

        let separator = UIView()
        separator.backgroundColor = UIColor.separator
        contentView.addSubview(separator)
        separator.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(2)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateWithItem(_ item: Any) {
        if let item = item as? Receipt {
            titleLabel.text = item.name
            durationLabel.text = "\(item.duration) min."

            if item.score > 0 {
                valuesView.insertArrangedSubview(scoreView.superview!, at: 0)
                scoreView.arrangedSubviews.forEach { $0.removeFromSuperview() }
                for _ in 1...item.score {
                    let star = UIImageView(image: #imageLiteral(resourceName: "ic_star"))
                    scoreView.addArrangedSubview(star)
                    star.snp.makeConstraints { make in
                        make.height.width.equalTo(16)
                    }
                }
            }
            else {
                scoreView.superview!.removeFromSuperview()
            }
        }
    }
}

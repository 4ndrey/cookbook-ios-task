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
    var scoreContainer: UIView
    var scoreView: ScoreView
    var timeView: TimeView

    class var height: CGFloat { return 142 }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel()
        titleLabel.font = UIFont.base()
        titleLabel.textColor = UIColor.blue
        titleLabel.numberOfLines = 0

        valuesView = UIStackView()
        valuesView.axis = .vertical
        valuesView.spacing = 10

        scoreContainer = UIView()
        scoreView = ScoreView(style: .magenta, height: 16)
        timeView = TimeView(style: .black)

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        layout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateWithItem(_ item: Any) {
        if let item = item as? Receipt {
            titleLabel.text = item.name
            timeView.time = item.duration
            scoreView.score = item.score
            if item.score > 0 {
                valuesView.insertArrangedSubview(scoreContainer, at: 0)
            }
            else {
                scoreContainer.removeFromSuperview()
            }
        }
    }

    private func layout() {
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

        valuesView.addArrangedSubview(scoreContainer)
        scoreContainer.snp.makeConstraints { make in
            make.height.equalTo(16)
        }

        scoreContainer.addSubview(scoreView)
        scoreView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
        }

        valuesView.addArrangedSubview(timeView)

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
}

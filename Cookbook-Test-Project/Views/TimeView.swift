//
//  TimeView.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

enum TimeViewStyle {
    case black
    case white

    func color() -> UIColor {
        switch self {
        case .black:
            return UIColor.baseBlack
        case .white:
            return UIColor.white
        }
    }
}

class TimeView: UIView {
    var time: Int? {
        didSet {
            label.text = "\(time ?? 0) " + "min.".localized()
        }
    }

    private var label: UILabel!
    private var timeIcon: UIImageView!

    convenience init(style: TimeViewStyle) {
        self.init(frame: CGRect.zero)

        timeIcon.tintColor = style.color()
        label.textColor = style.color()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        label = UILabel()
        label.font = UIFont.base(size: 15)
        label.textColor = UIColor.baseBlack
        label.textAlignment = .left

        timeIcon = UIImageView(image: #imageLiteral(resourceName: "ic_time").withRenderingMode(.alwaysTemplate))
        addSubview(timeIcon)
        timeIcon.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(14)
        }

        addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(timeIcon.snp.right).offset(9)
            make.height.equalTo(18)
            make.right.equalToSuperview()
        }

        snp.makeConstraints { make in
            make.height.equalTo(18)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

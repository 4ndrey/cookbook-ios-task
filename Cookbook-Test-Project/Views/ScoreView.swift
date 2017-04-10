//
//  ScoreView.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import SnapKit

enum ScoreViewStyle {
    case white
    case magenta

    func color() -> UIColor {
        switch self {
        case .magenta:
            return UIColor.magenta
        case .white:
            return UIColor.white
        }
    }
}

class ScoreView: UIStackView {
    var height: CGFloat?
    var score: Float? {
        didSet {
            arrangedSubviews.forEach { $0.removeFromSuperview() }
            guard let score = score else { return }
            if score < 1 { return }
            for _ in 1...Int(round(score)) {
                let star = UIImageView(image: #imageLiteral(resourceName: "ic_star_white").withRenderingMode(.alwaysTemplate))
                star.tintColor = tintColor
                addArrangedSubview(star)
                star.snp.makeConstraints { make in
                    make.height.width.equalTo(height ?? 0)
                }
            }
        }
    }

    convenience init(style: ScoreViewStyle, height: CGFloat) {
        self.init(frame: CGRect.zero)

        self.height = height
        tintColor = style.color()

        snp.makeConstraints { make in
            make.height.equalTo(height)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        axis = .horizontal
        distribution = .fillEqually
        alignment = .fill
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

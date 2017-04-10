//
//  BackButton.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

enum BackButtonStyle {
    case blue
    case white

    func image() -> UIImage {
        switch self {
        case .blue:
            return #imageLiteral(resourceName: "ic_back")
        case .white:
            return #imageLiteral(resourceName: "ic_back_white")
        }
    }

    func textColor() -> UIColor {
        switch self {
        case .blue:
            return UIColor.blue
        case .white:
            return UIColor.white
        }
    }
}

class BackButton: UIButton {
    convenience init(style: BackButtonStyle) {
        self.init(frame: CGRect.zero)

        setImage(style.image(), for: .normal)
        setTitleColor(style.textColor(), for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setTitleColor(UIColor.gray, for: .highlighted)
        setTitle("Zpět".localized(), for: .normal)

        titleLabel?.font = UIFont.base(size: 17)
        titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

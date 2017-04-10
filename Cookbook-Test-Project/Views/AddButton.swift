//
//  AddButton.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit
import SnapKit

enum AddButtonStyle {
    case blue
    case white

    func image() -> UIImage {
        switch self {
        case .blue:
            return #imageLiteral(resourceName: "ic_add")
        case .white:
            return #imageLiteral(resourceName: "ic_add_white")
        }
    }
}

class AddButton: UIButton {
    convenience init(style: AddButtonStyle) {
        self.init(frame: CGRect.zero)

        setImage(style.image(), for: .normal)
        snp.makeConstraints { $0.height.width.equalTo(22) }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

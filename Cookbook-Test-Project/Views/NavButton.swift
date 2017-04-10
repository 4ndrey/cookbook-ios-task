//
//  NavButton.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class NavButton: UIButton {
    var title: String? {
        didSet {
            setTitle(title, for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setTitleColor(UIColor.blue, for: .normal)
        setTitleColor(UIColor.gray, for: .highlighted)
        titleLabel?.font = UIFont.base(size: 17)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

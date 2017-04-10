//
//  BigTitleLabel.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class BigTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        font = UIFont.base(size: 24)
        textColor = UIColor.white
        numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

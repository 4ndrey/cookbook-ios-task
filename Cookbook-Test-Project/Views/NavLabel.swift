//
//  NavLabel.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class NavLabel: UILabel {
    override var text: String? {
        didSet {
            let attributes: NSDictionary = [
                NSFontAttributeName: UIFont.base(),
                NSForegroundColorAttributeName: UIColor.baseBlack,
                NSKernAttributeName: -0.4
            ]
            attributedText = NSAttributedString(string: text ?? "", attributes: attributes as? [String : AnyObject])
        }
    }
}

//
//  Fonts.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 08.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

extension UIFont {
    static var base: UIFont { return UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular) }
    static func base(size: CGFloat) -> UIFont { return UIFont.systemFont(ofSize: size, weight: UIFontWeightRegular) }
}

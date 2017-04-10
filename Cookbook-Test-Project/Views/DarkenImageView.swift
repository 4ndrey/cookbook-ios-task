//
//  DarkenImageView.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class DarkenImageView: UIImageView {
    private let gradientLayer = CAGradientLayer()

    override init(image: UIImage?) {
        super.init(image: image)

        contentMode = .scaleAspectFill

        gradientLayer.shouldRasterize = true
        gradientLayer.colors = [UIColor(white: 0, alpha: 0.7).cgColor, UIColor(white: 0, alpha: 0.4).cgColor]
        gradientLayer.locations = [0, 0.8]
        layer.addSublayer(gradientLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if bounds.size.height > gradientLayer.bounds.height {
            gradientLayer.frame = bounds
        }
    }
}

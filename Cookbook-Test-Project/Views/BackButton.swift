//
//  BackButton.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 09.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class BackButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setImage(#imageLiteral(resourceName: "ic_back_white"), for: .normal)
        setTitleColor(UIColor.white, for: .normal)
        setTitleColor(UIColor.gray, for: .highlighted)
        setTitle("Zpět", for: .normal)

        titleLabel?.font = UIFont.base(size: 17)
        titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  ScrollView.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class ScrollView: UIScrollView, UIScrollViewDelegate {
    var coverView: UIView?
    var minHeight = CGFloat(0)

    override init(frame: CGRect) {
        super.init(frame: frame)

        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var lastOffsetY = CGFloat(0)
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if coverView == nil { return }

        let delta = scrollView.contentOffset.y - lastOffsetY
        if scrollView.contentOffset.y > 0 {
            if delta > 0 {
                for constraint in coverView!.constraints {
                    if constraint.firstAttribute == .height {
                        constraint.constant = max(minHeight, constraint.constant - delta)
                    }
                }
            }
        }
        else {
            for constraint in coverView!.constraints {
                if constraint.firstAttribute == .height {
                    constraint.constant = UIScreen.main.bounds.width
                }
            }
        }
        lastOffsetY = scrollView.contentOffset.y
    }
}

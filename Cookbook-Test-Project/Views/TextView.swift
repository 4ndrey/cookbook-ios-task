//
//  TextView.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class TextView: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)

        textColor = UIColor.receiptColor
        font = UIFont.base(size: 16)
        isEditable = false
        isScrollEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(info: String?, description: String?, ingredients: [String]?) {
        let defaultAttributes = [NSForegroundColorAttributeName: UIColor.receiptColor, NSFontAttributeName: UIFont.base(size: 16)]
        let text = NSMutableAttributedString()
        
        text.append(NSAttributedString(string: info ?? "", attributes: defaultAttributes))
        text.append(NSAttributedString(string: "\n\n\n\n"))

        text.append(NSAttributedString(string: "Ingredience\n\n", attributes: [NSForegroundColorAttributeName: UIColor.blue, NSFontAttributeName: UIFont.base(size: 20)]))
        text.append(NSAttributedString(string: (ingredients ?? []).map { "  •    " + $0 }.joined(separator: "\n"), attributes: defaultAttributes))

        text.append(NSAttributedString(string: "\n\n\nPříprava jídla\n\n", attributes: [NSForegroundColorAttributeName: UIColor.blue, NSFontAttributeName: UIFont.base(size: 20)]))
        text.append(NSAttributedString(string: description ?? "", attributes: defaultAttributes))

        self.attributedText = text

        for constraint in constraints {
            if constraint.firstAttribute == .height {
                constraint.constant = sizeThatFits(CGSize(width: UIScreen.main.bounds.size.width - 60, height: CGFloat.greatestFiniteMagnitude)).height
            }
        }
    }
}

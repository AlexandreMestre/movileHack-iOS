//
//  CustomLabel.swift
//  MarketLeftOver
//
//  Created by Larissa Ganaha on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class CustomLabel : UILabel {
    @IBInspectable open var characterSpacing:CGFloat = 1 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(kCTKernAttributeName as NSAttributedStringKey, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }

    }
}

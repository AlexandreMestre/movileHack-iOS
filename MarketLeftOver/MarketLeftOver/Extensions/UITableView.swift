//
//  UITableView.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 19/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func addTopBackgound(color: UIColor) {
        let topView = UIView(frame: CGRect(x: 0, y: -UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        topView.backgroundColor = color
        self.addSubview(topView)
    }
}

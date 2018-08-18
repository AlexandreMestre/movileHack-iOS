//
//  Category.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    var id: String
    var name: String
    var iconURL: URL?
    
    init(id: String, name: String, iconURL: URL?) {
        self.id = id
        self.name = name
        self.iconURL = iconURL
    }
}

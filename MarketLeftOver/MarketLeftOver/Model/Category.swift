//
//  Category.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class Category: NSObject, Codable {
    
    var id: Int
    var name: String
    var iconURL: URL?
    
    init(id: Int, name: String, iconURL: URL?) {
        self.id = id
        self.name = name
        self.iconURL = iconURL
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "categoryId"
        case name = "categoryName"
        case iconURL = "imageUrl"
        
    }
}

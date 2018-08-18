//
//  Product.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class Product: NSObject, Codable {

    var id: String
    var name: String
    var brand: String
    var dueDate: Date
    var originalPrice: Double
    var currentPrice: Double
    var imageURL: URL?
    
    init(id: String,
         name: String,
         brand: String,
         dueDate: Date,
         originalPrice: Double,
         currentPrice: Double,
         imageURL: URL?) {
        
        self.id = id
        self.name = name
        self.brand = brand
        self.dueDate = dueDate
        self.originalPrice = originalPrice
        self.currentPrice = currentPrice
        self.imageURL = imageURL
        
    }
    
    
}

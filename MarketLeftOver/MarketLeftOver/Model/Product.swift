//
//  Product.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class Product: NSObject, Codable {

    var id: Int
    var name: String
    var brand: String?
    private var dueDateString: String
    
    var dueDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy")
        return dateFormatter.date(from: self.dueDateString)
    }
    
    var originalPrice: Double
    var currentPrice: Double
    var imageURL: URL?
    
    init(id: Int,
         name: String,
         brand: String,
         dueDateString: String,
         originalPrice: Double,
         currentPrice: Double,
         imageURL: URL?) {
        
        self.id = id
        self.name = name
        self.brand = brand
        self.dueDateString = dueDateString
        self.originalPrice = originalPrice
        self.currentPrice = currentPrice
        self.imageURL = imageURL
        
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "productId"
        case name = "productName"
        case dueDateString = "expirationDate"
        case originalPrice = "originalPrice"
        case currentPrice = "price"
        case imageURL = "imageUrl"
    }
    
}

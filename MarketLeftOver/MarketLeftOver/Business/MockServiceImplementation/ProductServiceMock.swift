//
//  ProductServiceMock.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class ProductServiceMock: ProductServiceProtocol {
    
    static var instance = ProductServiceMock()
    
    private init() {}
    
    func product(withId id: String) -> Product? {
        return Product(id: "zzzz",
                       name: "Chocolate", brand: "Nestle",
                       dueDate: Date(), originalPrice: 10,
                       currentPrice: 4, imageURL: URL(string: "https://cdn.shopify.com/s/files/1/0972/7116/products/nestle-crunch-bar.png"))
    }
    
    func bestProducts(from market: Market) -> [Product] {
        if let product = self.product(withId: "zzzz") {
            return [product, product, product]
        }
        
        return [Product]()
    }
    
    func products(ofCategory category: Category) -> [Product] {
        if let product = self.product(withId: "zzzz") {
            return [product, product, product]
        }
        
        return [Product]()
    }
    
    func products(ofBrand brand: String) -> [Product] {
        if let product = self.product(withId: "zzzz") {
            return [product, product, product]
        }
        
        return [Product]()
    }
    

}

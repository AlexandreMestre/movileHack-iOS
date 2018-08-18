//
//  ProductServiceProtocol.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import Foundation

protocol ProductServiceProtocol: class {
    
    /// Get the product with id provided
    ///
    /// - Parameter id: product's id
    /// - Returns: Product's object, if exists
    func product(withId id: String) -> Product?
    
    /// Best products from a market (usually the one's with best price)
    ///
    /// - Parameter market:
    /// - Returns: product list
    func bestProducts(from market: Market) -> [Product]
    
    /// All products of a given category
    ///
    /// - Parameter category:
    /// - Returns: list of products
    func products(ofCategory category: Category) -> [Product]
    
    /// All products of a given brand
    ///
    /// - Parameter brand:
    /// - Returns: product list
    func products(ofBrand brand: String) -> [Product]
    
}

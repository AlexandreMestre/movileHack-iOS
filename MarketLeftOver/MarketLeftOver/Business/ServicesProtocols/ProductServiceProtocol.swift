//
//  ProductServiceProtocol.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import Foundation

protocol ProductServiceProtocol: class {
    
    func product(withId id: String) -> Product?
    func bestProducts(from market: Market) -> [Product]
    func products(ofCategory category: Category) -> [Product]
    func products(ofBrand brand: String) -> [Product]
    
}

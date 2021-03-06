//
//  ServiceFactory.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import Foundation

class ServiceFactory {
    
    static func marketService() -> MarketServiceProtocol {
        return MarketService.instance
    }
    
    static func productService() -> ProductServiceProtocol {
        return ProductService.instance
    }
    
    static func shoppingCartService() -> ShoppingCartServiceProtocol {
        return ShoppingCartService.instance
    }
}

//
//  ShoppingCartServiceProtocol.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import Foundation

protocol ShoppingCartServiceProtocol: class {
    func shoppingCart() -> ShoppingCart
    func add(product: Product, quantity: Int)
    func remove(product: Product, quantity: Int)
}

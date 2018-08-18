//
//  ShoppingCart.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

struct ShoppingCartItem {
    var product: Product
    var quantity: Int
}

class ShoppingCart: NSObject {
    var itens: [ShoppingCartItem]
    
    var totalPrice: Double {
        var _totalPrice: Double = 0
        
        for item in self.itens {
            _totalPrice += item.product.currentPrice * Double(item.quantity)
        }
        
        return _totalPrice
    }
    
    init(itens: [ShoppingCartItem]) {
        self.itens = itens
    }
}

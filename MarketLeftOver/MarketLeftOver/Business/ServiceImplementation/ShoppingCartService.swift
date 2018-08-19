//
//  ShoppingCartService.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit

class ShoppingCartService: ShoppingCartServiceProtocol {
    
    static var instance = ShoppingCartService()
    
    private init() {}
    
    private var userShoppingCart = ShoppingCart(itens: [])
    
    func shoppingCart() -> ShoppingCart {
        return userShoppingCart
    }
    
    func add(product: Product, quantity: Int) {
        var index = 0
        for item in self.userShoppingCart.itens {
            if item.product.id == product.id {
                self.userShoppingCart.itens[index].quantity += quantity
                return
            }
            index += 1
        }
        
        self.userShoppingCart.itens.append(ShoppingCartItem(product: product, quantity: quantity))
    }
    
    func remove(product: Product, quantity: Int) {
        var index = 0
        for item in self.userShoppingCart.itens {
            if item.product.id == product.id {
                self.userShoppingCart.itens[index].quantity -= quantity
                
                if self.userShoppingCart.itens[index].quantity <= 0 {
                   self.userShoppingCart.itens.remove(at: index)
                }
                
                return
            }
            index += 1
        }
    }
}

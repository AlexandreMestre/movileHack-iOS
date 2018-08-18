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
        return MarketServiceMock.instance
    }
    
    static func productService() -> ProductServiceProtocol {
        return ProductServiceMock.instance
    }
}

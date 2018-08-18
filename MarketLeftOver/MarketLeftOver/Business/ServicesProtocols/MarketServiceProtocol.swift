//
//  MarketServiceProtocol.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import Foundation
import CoreLocation

protocol MarketServiceProtocol: class {

    func market(withId id: String) -> Market?
    func markets(near location: CLLocation) -> [Market]
    
    func categories(of market: Market) -> [Category]
    
}

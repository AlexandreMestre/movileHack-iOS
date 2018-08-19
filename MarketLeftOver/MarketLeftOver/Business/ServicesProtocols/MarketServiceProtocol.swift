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
    
    func allMarkets(completion: @escaping ([Market]?)->Void)

    /// Get the market with id provided
    ///
    /// - Parameters:
    ///   - id: market id
    ///   - completion: Market object if exists
    func market(withId id: Int, completion: @escaping (Market?)->Void)
    
    /// Get markets near a location
    ///
    /// - Parameter location: given location
    /// - Returns: Array with markets nearby
    func markets(near location: CLLocation, completion: @escaping ([Market]?)->Void)
    
    /// Get product categories in a market
    ///
    /// - Parameter market: market object
    /// - Returns: all categories in given market
    func categories(of market: Market, completion: @escaping ([Category]?)->Void)
    
}

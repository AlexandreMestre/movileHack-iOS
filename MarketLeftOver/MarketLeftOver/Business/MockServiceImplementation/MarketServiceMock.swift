//
//  MarketServiceMock.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit
import CoreLocation

class MarketServiceMock: MarketServiceProtocol {
    
    static var instance = MarketServiceMock()
    
    private init() {}
    
    func market(withId id: String, completion: @escaping (Market?) -> Void) {
        completion(Market(id: id,
                          name: "Great Market",
                          email: "great@market.com",
                          phoneNumber: "36057839",
                          CNPJ: "XX.XXX.XXX/YYYY-ZZ",
                          latitude: -22.8860352,
                          longitude: -47.0598237,
                          logoImageURL: URL(string: "https://upload.wikimedia.org/wikipedia/pt/d/dd/Logomarca_do_Pão_de_Açúcar_%28supermercado%29.png")))
    }
    
    func markets(near location: CLLocation, completion: @escaping ([Market]?) -> Void) {
        let market = Market(id: "xxxx",
                            name: "Great Market",
                            email: "great@market.com",
                            phoneNumber: "36057839",
                            CNPJ: "XX.XXX.XXX/YYYY-ZZ",
                            latitude: -22.8860352,
                            longitude: -47.0598237,
                            logoImageURL: URL(string: "https://upload.wikimedia.org/wikipedia/pt/d/dd/Logomarca_do_Pão_de_Açúcar_%28supermercado%29.png"))
        completion([market, market, market])
    }
    
    func categories(of market: Market, completion: @escaping ([Category]?) -> Void) {
        let foodCategory = Category(id: "xxxxx", name: "Food", iconURL: nil)
        let personalHygieneCategory = Category(id: "yyyyy", name: "Personal Hygiene", iconURL: nil)
        
        completion([foodCategory, personalHygieneCategory])
    }
    

}

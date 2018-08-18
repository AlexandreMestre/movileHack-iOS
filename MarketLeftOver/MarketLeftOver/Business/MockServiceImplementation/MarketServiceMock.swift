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
    
    func market(withId id: String) -> Market? {
        var location: CLLocation?
        
        if let latitude = CLLocationDegrees(exactly: -22.8860352),
            let longitude = CLLocationDegrees(exactly: -47.0598237) {
            location = CLLocation(latitude: latitude, longitude: longitude)
        }
        
        return Market(id: id,
                      name: "Great Market",
                      email: "great@market.com",
                      phoneNumber: "36057839",
                      CNPJ: "XX.XXX.XXX/YYYY-ZZ",
                      location: location,
                      logoImageURL: URL(string: "https://upload.wikimedia.org/wikipedia/pt/d/dd/Logomarca_do_Pão_de_Açúcar_%28supermercado%29.png"))
    }
    
    func markets(near location: CLLocation) -> [Market] {
        if let market = self.market(withId: "xxxxxx") {
            return [market, market, market]
        }
        
        return [Market]()
    }
    
    func categories(of market: Market) -> [Category] {
        let foodCategory = Category(id: "xxxxx", name: "Food", iconURL: nil)
        let personalHygieneCategory = Category(id: "yyyyy", name: "Personal Hygiene", iconURL: nil)
        
        return [foodCategory, personalHygieneCategory]
    }

}

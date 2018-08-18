//
//  Market.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit
import CoreLocation

class Market: NSObject {
    
    var id: String
    var name: String
    var email: String
    var phoneNumber: String
    var CNPJ: String
    var location: CLLocation?
    var logoImageURL: URL?

    init(id: String,
         name: String,
         email: String,
         phoneNumber: String,
         CNPJ: String,
         location: CLLocation?,
         logoImageURL: URL?) {
        
        self.id = id
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.CNPJ = CNPJ
        self.location = location
        self.logoImageURL = logoImageURL
    }
}

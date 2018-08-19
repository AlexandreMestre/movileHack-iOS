//
//  Market.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit
import CoreLocation

class Market: NSObject, Codable {
    
    var id: Int
    var name: String
    var email: String
    var phoneNumber: String
    var CNPJ: String
    var logoImageURL: URL?
    private var latitude: String
    private var longitude: String
    
    var location: CLLocation? {
        guard let numLatitude = Double(self.latitude), let numLongitude = Double(self.longitude) else {
            return nil
        }
        
        if let longitude = CLLocationDegrees(exactly: numLongitude),
            let latitude = CLLocationDegrees(exactly: numLatitude) {
            return CLLocation(latitude: latitude, longitude: longitude)
        }
        
        return nil
    }

    init(id: Int,
         name: String,
         email: String,
         phoneNumber: String,
         CNPJ: String,
         latitude: String,
         longitude: String,
         logoImageURL: URL?) {
        
        self.id = id
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.CNPJ = CNPJ
        self.latitude = latitude
        self.longitude = longitude
        self.logoImageURL = logoImageURL
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "marketId"
        case name = "marketName"
        case email
        case phoneNumber = "contact"
        case latitude
        case longitude
        case CNPJ = "cnpj"
        case logoImageURL = "logoUrl"
    }
}

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
    
    var id: String
    var name: String
    var email: String
    var phoneNumber: String
    var CNPJ: String
    var logoImageURL: URL?
    private var latitude: Double
    private var longitude: Double
    
    var location: CLLocation? {
        if let longitude = CLLocationDegrees(exactly: self.longitude),
            let latitude = CLLocationDegrees(exactly: self.latitude) {
            return CLLocation(latitude: latitude, longitude: longitude)
        }
        
        return nil
    }

    init(id: String,
         name: String,
         email: String,
         phoneNumber: String,
         CNPJ: String,
         latitude: Double,
         longitude: Double,
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
        case id
        case name
        case email
        case phoneNumber
        case latitude
        case longitude
        case CNPJ
        case logoImageURL
    }
}

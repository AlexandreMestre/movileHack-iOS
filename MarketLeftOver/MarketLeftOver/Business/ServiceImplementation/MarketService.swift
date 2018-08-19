//
//  MarketService.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 18/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class MarketService: MarketServiceProtocol {
    
    static var instance = MarketService()
    
    private init() {}
    
    let baseURL = APIInfo.baseURL
    
    func allMarkets(completion: @escaping ([Market]?) -> Void) {
        let URLExtension = "markets"
        
        guard let url = URL(string: baseURL + URLExtension) else {
            completion(nil)
            return
        }
        
        Alamofire.request(url, method: .get)
            .validate()
            .responseJSON { response in
                
                guard response.response?.statusCode == 200 else {
                    print("Error while login: \(String(describing: response.result.error))")
                    completion(nil)
                    return
                }
                                
                guard let value = response.result.value else {
                    print("Malformed data received")
                    completion(nil)
                    return
                }
                
                if let jsonData = try? JSONSerialization.data(withJSONObject: value) {
                    do {
                        let result = try JSONDecoder().decode([Market].self, from: jsonData)
                        completion(result)
                        return
                    } catch {
                        print(error)
                    }
                }
                completion(nil)
        }
    }
    
    func market(withId id: Int, completion: @escaping (Market?) -> Void) {
        let URLExtension = "market/\(id)"
        
        guard let url = URL(string: baseURL + URLExtension) else {
            completion(nil)
            return
        }
        
        Alamofire.request(url, method: .get)
            .validate()
            .responseJSON { response in
                
                guard response.response?.statusCode == 200 else {
                    print("Error while login: \(String(describing: response.result.error))")
                    completion(nil)
                    return
                }
                
                guard let value = response.result.value else {
                    print("Malformed data received")
                    completion(nil)
                    return
                }
                
                if let jsonData = try? JSONSerialization.data(withJSONObject: value) {
                    do {
                        let result = try JSONDecoder().decode(Market.self, from: jsonData)
                        completion(result)
                        return
                    } catch {
                        print(error)
                    }
                }
                completion(nil)
        }
    }
    
    func markets(near location: CLLocation, completion: @escaping ([Market]?) -> Void) {
        let URLExtension = "markets"
        
        guard let url = URL(string: baseURL + URLExtension) else {
            completion(nil)
            return
        }
        
        Alamofire.request(url, method: .get)
            .validate()
            .responseJSON { response in
                
                guard response.response?.statusCode == 200 else {
                    print("Error while login: \(String(describing: response.result.error))")
                    completion(nil)
                    return
                }
                
                guard let value = response.result.value else {
                    print("Malformed data received")
                    completion(nil)
                    return
                }
                
                if let jsonData = try? JSONSerialization.data(withJSONObject: value) {
                    do {
                        let result = try JSONDecoder().decode([Market].self, from: jsonData)
                        completion(result)
                        return
                    } catch {
                        print(error)
                    }
                }
                completion(nil)
        }
    }
    
    func categories(of market: Market, completion: @escaping ([Category]?) -> Void) {
        let URLExtension = "market/\(market.id)/category"
        
        guard let url = URL(string: baseURL + URLExtension) else {
            completion(nil)
            return
        }
        
        Alamofire.request(url, method: .get)
            .validate()
            .responseJSON { response in
                
                guard response.response?.statusCode == 200 else {
                    print("Error while login: \(String(describing: response.result.error))")
                    completion(nil)
                    return
                }
                
                guard let value = response.result.value else {
                    print("Malformed data received")
                    completion(nil)
                    return
                }
                
                if let jsonData = try? JSONSerialization.data(withJSONObject: value) {
                    do {
                        let result = try JSONDecoder().decode([Category].self, from: jsonData)
                        completion(result)
                        return
                    } catch {
                        print(error)
                    }
                }
                completion(nil)
        }
    }
    
    
}

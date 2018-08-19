//
//  ProductService.swift
//  MarketLeftOver
//
//  Created by Alexandre Conti Mestre on 19/08/18.
//  Copyright © 2018 Alexandre Conti Mestre. All rights reserved.
//

import UIKit
import Alamofire

class ProductService: ProductServiceProtocol {
    
    static var instance = ProductService()
    
    let baseURL = APIInfo.baseURL
    
    private init() {}
    
    func product(withId id: Int, completion: @escaping (Product?) -> Void) {
        // TODO: - update when server is ready
        completion(nil)
    }
    
    func bestProducts(from market: Market, completion: @escaping ([Product]?) -> Void) {
        let URLExtension = "market/\(market.id)/bestDeals"
        
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
                        let result = try JSONDecoder().decode([Product].self, from: jsonData)
                        completion(result)
                        return
                    } catch {
                        print(error)
                    }
                }
                completion(nil)
        }
    }
    
    func products(ofCategory category: Category, from market: Market, completion: @escaping ([Product]?) -> Void) {
        let URLExtension = "market/\(market.id)/category/\(category.id)/products"
        
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
                        let result = try JSONDecoder().decode([Product].self, from: jsonData)
                        completion(result)
                        return
                    } catch {
                        print(error)
                    }
                }
                completion(nil)
        }
    }
    
    func products(ofBrand brand: String, completion: @escaping ([Product]?) -> Void) {
        completion(nil)
    }
    
}

//
//  ProductRequest.swift
//  NetworkingLayer
//
//  Created by Murtaza Mehmood on 25/12/2024.
//

import Foundation

class ProductRequest: NetworkRequest {
    
    var baseURL: URL
    var endpoint: String?
    var httpMethod: HTTPMethod?
    var httpBody: Data?
    var queryParameter: [String : Any]?
    var fieldHeaders: [String : Any]?
    
    static let shared = ProductRequest(baseURL: .init(string: "https://dummyjson.com")!)
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func allProducts() -> NetworkRequest {
        var request = self
        request.endpoint = "/products"
        request.httpMethod = .get
        return request
    }
}

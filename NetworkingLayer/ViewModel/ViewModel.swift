//
//  ViewModel.swift
//  NetworkingLayer
//
//  Created by Murtaza Mehmood on 25/12/2024.
//

import Foundation

class ViewModel {
    let networkService: Networking
    
    var products: [ProductResponseModel] = []
    
    init(networkService: Networking) {
        self.networkService = networkService
    }
    
    func fetchProducts(completion: @escaping () -> Void) {
        let request = ProductRequest.shared.allProducts()
        networkService.fetch(request: request) { result in
            switch result {
            case .success(let response):
                do {
                    let model = try JSONDecoder().decode(ProductListResponseModel.self, from: response.data)
                    self.products = model.products ?? []
                    completion()
                } catch let error {}
            case .failure(let error):
                print(error)
            }
        }
    }
}

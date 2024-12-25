//
//  Product.swift
//  NetworkingLayer
//
//  Created by Murtaza Mehmood on 25/12/2024.
//

import Foundation
struct ProductListResponseModel: Decodable {
    let products: [ProductResponseModel]?
    var total: Int?
    var skip: Int?
    var limit: Int?
}

struct ProductResponseModel: Decodable {
    var id: Int?
    var title: String?
    var description: String?
    var price: Double?
    var thumbnail: String?
}

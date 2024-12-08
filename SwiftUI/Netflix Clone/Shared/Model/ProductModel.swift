//
//  ProductModel.swift
//  Netflix Clone
//
//  Created by Jeevan Chandra Joshi on 08/12/24.
//

import Foundation

struct ProductModel: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let images: [String]
    let thumbnail: String
}

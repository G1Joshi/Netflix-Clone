//
//  DatabaseHelper.swift
//  Netflix Clone
//
//  Created by Jeevan Chandra Joshi on 08/12/24.
//

import Foundation

struct DatabaseHelper {
    func getUsers() async throws -> [User] {
        guard let url = URL(string: Constants.usersAPI) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(UserModel.self, from: data)
        return users.users
    }

    func getProducts() async throws -> [Product] {
        guard let url = URL(string: Constants.productsAPI) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductModel.self, from: data)
        return products.products
    }
}

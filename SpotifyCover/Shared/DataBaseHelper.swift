//
//  DatabaseHelper.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/06.
//

import Foundation

// MARK: - Fake mock data

struct DataBaseHelper {
    
    func getProducts() async throws -> [Product]{
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw DataError.invalidURL}
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let res = response as? HTTPURLResponse, res.statusCode == 200 else {
            throw DataError.invalidResponse}
        do {
            let decoder = try JSONDecoder().decode(ProductArray.self, from: data)
            return decoder.products
        } catch  {
            throw DataError.invalidData
        }
        
    }
    
    func getUsers () async throws ->[User] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
           throw DataError.invalidURL
        }
        let(data, response) = try await URLSession.shared.data(from: url)
        guard let res = response as? HTTPURLResponse, res.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        do {
            let decoder = try JSONDecoder().decode(UserArray.self, from: data)
            return decoder.users
        } catch  {
           throw DataError.invalidData
        }
    }
    
}





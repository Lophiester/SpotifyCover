//
//  Product.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/06.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    static var mockProduct: Product {
        
        Product(
            id: 123,
            title: "MOCK Title",
            description: "some MOCK description goes here",
            brand: "MOCK Brand",
            category: "MOCK Eletronincs",
            thumbnail:  Constants.randomImage,
            images:[ Constants.randomImage, Constants.randomImage, Constants.randomImage]
        )
        
    }
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products:[Product]
}



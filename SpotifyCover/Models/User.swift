//
//  User.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/06.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    
    
    
  static  var mockUser: User {
        User(id: 123, firstName: "MOCK NAME", lastName: "MOCK lastName", age: 70, email: "mock@gmail.com", phone: "", username: "", password: "", image: Constants.randomImage)
    }
}

//
//  User.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import Foundation

struct User: Codable, Equatable {
    
    let id: String
    
    let businessName: String
    
    let isPremium: Bool
    
    let firstName: String
    
    let lastName: String
    
    let phone: String
    
    let email: String
    
    let latitude: Double
    
    let longitude: Double
    
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case businessName = "business_name"
        case isPremium = "is_premium"
        case firstName = "first_name"
        case lastName = "last_name"
        case phone
        case email
        case latitude = "lat"
        case longitude = "lng"
        case created
    }
}

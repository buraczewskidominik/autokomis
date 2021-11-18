//
//  Car.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import Foundation

struct Car: Codable, Hashable, Equatable {
    
    let id: String
    
    let sellerId: String
    
    let sold: Bool
    
    let make: String
    
    let model: String
    
    let year: String
    
    let petrolType: Int
    
    let isDamagedNow: Bool
    
    let hadAccident: Bool
    
    let hasPlates: Bool
    
    let milage: String
    
    let price: String
    
    let power: String
    
    let cylinderCapacity: String
    
    let description: String?
    
    let urls: [String]
    
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case sellerId = "seller_id"
        case sold
        case make
        case model
        case year
        case petrolType = "petrol"
        case isDamagedNow = "damaged_now"
        case hadAccident = "had_accident"
        case hasPlates = "has_plates"
        case milage
        case price
        case power
        case cylinderCapacity = "cc"
        case description
        case urls
        case created
    }
}

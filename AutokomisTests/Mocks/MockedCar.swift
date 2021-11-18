//
//  MockedCar.swift
//  AutokomisTests
//
//  Created by Dominik Buraczewski on 11/08/2021.
//

import Foundation
@testable import Autokomis

extension Car {
    
    static func mocked() -> Car {
        Car(
            id: "1",
            sellerId: "1",
            sold: false,
            make: "VW",
            model: "Passat",
            year: "2015",
            petrolType: 0,
            isDamagedNow: false,
            hadAccident: false,
            hasPlates: true,
            milage: "110000",
            price: "20000",
            power: "140",
            cylinderCapacity: "1900",
            description: "Nowy fajny passacik",
            urls: [],
            created: "99900"
        )
    }
}

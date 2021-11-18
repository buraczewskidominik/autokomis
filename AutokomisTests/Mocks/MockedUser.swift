//
//  MockedUser.swift
//  AutokomisTests
//
//  Created by Dominik Buraczewski on 10/08/2021.
//

import Foundation
@testable import Autokomis

extension User {
    
    static func mocked() -> User {
        User(
            id: "1", businessName: "1",
            isPremium: false,
            firstName: "Jan",
            lastName: "Kowalski",
            phone: "12345",
            email: "test@gmail.com",
            latitude: 1,
            longitude: 1,
            created: "12345"
        )
    }
}

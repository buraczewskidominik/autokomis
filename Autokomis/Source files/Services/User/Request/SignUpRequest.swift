//
//  SignUpRequest.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 09/08/2021.
//

import Foundation

struct SignUpRequest: Request {
    
    // MARK: Properties

    // - SeeAlso: Request.path
    var path: String {
        "/user/signup.php"
    }

    // - SeeAlso: Request.method
    var method: HTTPMethod {
        .post
    }

    // - SeeAlso: Request.body
    var body: Body? {
        .json(
            body: [
                "id": id,
                "business_name": businessName,
                "is_premium": isPremium,
                "first_name": firstName,
                "last_name": lastName,
                "phone": phone,
                "email": email,
                "password": password,
                "lat": latitude,
                "lng": longitude,
                "created": created
            ]
        )
    }
    
    // MARK: Private properties

    private let id: String
    private let businessName: String
    private let isPremium: Bool
    private let firstName: String
    private let lastName: String
    private let phone: String
    private let email: String
    private let password: String
    private let latitude: String
    private let longitude: String
    private let created: String

    // MARK: Initializers

    /// Initializes the receiver.
    /// - Parameters:
    ///   - email: Email used to login.
    ///   - password: Password used to login.
    init(
        id: String,
        businessName: String,
        isPremium: Bool,
        firstName: String,
        lastName: String,
        phone: String,
        email: String,
        password: String,
        latitude: String,
        longitude: String,
        created: String
    ) {
        self.id = id
        self.businessName = businessName
        self.isPremium = isPremium
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.email = email
        self.password = password
        self.latitude = latitude
        self.longitude = longitude
        self.created = created
    }
}

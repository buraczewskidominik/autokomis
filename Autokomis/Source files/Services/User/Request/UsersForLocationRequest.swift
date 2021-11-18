//
//  UsersForLocationRequest.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 12/08/2021.
//

import Foundation

struct UsersForLocationRequest: Request {
    
    // MARK: Properties

    // - SeeAlso: Request.path
    var path: String {
        "/user/users_for_location.php"
    }

    // - SeeAlso: Request.method
    var method: HTTPMethod {
        .post
    }

    // - SeeAlso: Request.body
    var body: Body? {
        .json(
            body: [
                "lat": latitude,
                "lng": longitude,
                "radius": radius
            ]
        )
    }
    
    // MARK: Private properties

    private let latitude: Double
    private let longitude: Double
    private let radius: Int

    // MARK: Initializers

    /// Initializes the receiver.
    init(
        latitude: Double,
        longitude: Double,
        radius: Int
    ) {
        self.latitude = latitude
        self.longitude = longitude
        self.radius = radius
    }
}

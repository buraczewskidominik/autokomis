//
//  LogInRequest.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 09/08/2021.
//

import Foundation

struct LogInRequest: Request {
    
    // MARK: Properties

    // - SeeAlso: Request.path
    var path: String {
        "/user/login.php"
    }

    // - SeeAlso: Request.method
    var method: HTTPMethod {
        .post
    }

    // - SeeAlso: Request.body
    var body: Body? {
        .json(
            body: [
                "email": email,
                "password": password
            ]
        )
    }
    
    // MARK: Private properties

    private let email: String
    private let password: String

    // MARK: Initializers

    /// Initializes the receiver.
    /// - Parameters:
    ///   - email: Email used to login.
    ///   - password: Password used to login.
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

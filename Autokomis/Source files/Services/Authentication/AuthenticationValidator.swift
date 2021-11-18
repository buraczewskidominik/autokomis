//
//  AuthenticationValidator.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 09/08/2021.
//

import Foundation

enum AuthenticationValidationError: ReadableError {
    case noInput
    case emailEmpty
    case invalidEmail
    case passwordEmpty
    case confirmedPasswordEmpty
    case passwordsDoNotMatch
    
    var readable: String { "" }
}

struct AuthenticationValidator {
    
    /// Validates if given input is correct or not.
    /// Returns valid non-optional string.
    /// - Parameter input: An input to validate.
    static func validate(input: String?) throws -> String {
        guard let input = input, !input.isEmpty else {
            throw AuthenticationValidationError.noInput
        }
        return input
    }

    /// Validates if given email is correct or not.
    /// Returns valid non-optional email.
    /// - Parameter email: An email to validate.
    static func validate(email: String?) throws -> String {
        guard let email = email, !email.isEmpty else {
            throw AuthenticationValidationError.emailEmpty
        }
        if !email.isValidEmail {
            throw AuthenticationValidationError.invalidEmail
        }
        return email
    }
    
    /// Validates if given password is correct or not.
    /// Returns valid non-optional password.
    /// - Parameter password: A password to validate.
    static func validate(password: String?) throws -> String {
        guard let password = password, !password.isEmpty else {
            throw AuthenticationValidationError.passwordEmpty
        }
        return password
    }
    
    /// Validates if given password is correct or not.
    /// Returns valid non-optional password.
    /// - Parameters:
    ///  - password: A password to validate.
    ///  - confirmedPassword: A confirmed password.
    static func validate(password: String?, confirmedPassword: String?) throws -> String {
        guard let password = password, !password.isEmpty else {
            throw AuthenticationValidationError.passwordEmpty
        }
        guard let confirmedPassword = confirmedPassword, !confirmedPassword.isEmpty else {
            throw AuthenticationValidationError.confirmedPasswordEmpty
        }
        guard password == confirmedPassword else {
            throw AuthenticationValidationError.passwordsDoNotMatch
        }
        return password
    }
}

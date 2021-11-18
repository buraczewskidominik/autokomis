//
//  String.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 09/08/2021.
//

import Foundation

public extension String {

    /// Indicates whether given string is nil or empty.
    /// - Parameter string: A string to investigate.
    static func isNilOrEmpty(_ string: String?) -> Bool {
        (string ?? "").isEmpty
    }

    /// A boolean variable indicating whether a string has a valid email address syntax.
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
    }

    /// Indicates whether string is empty or consists of whitespaces only
    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespaces).isEmpty
    }
}

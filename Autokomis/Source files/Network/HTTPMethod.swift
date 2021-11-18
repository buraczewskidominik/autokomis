//
//  HTTPMethod.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

/// A HTTP requets method.
///
/// - get: HTTP GET request.
/// - post: HTTP POST request.
/// - put: HTTP PUT request.
/// - patch: HTTP PATCH request.
/// - options: HTTP OPTIONS request.
/// - delete: HTTP DELETE request.
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case options = "OPTIONS"
    case delete = "DELETE"
}

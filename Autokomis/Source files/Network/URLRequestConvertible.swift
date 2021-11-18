//
//  URLRequestConvertible.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

/// Describes an entity capable of being converted into url request.
protocol URLRequestConvertible {
    /// Returns the entity converted into url request.
    func asURLRequest() -> URLRequest
}

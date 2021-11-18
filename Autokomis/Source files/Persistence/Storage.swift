//
//  Storage.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

/// Describes a simple data storage
protocol Storage {
    /// Sets given object at provided key.
    ///
    /// - Parameters:
    ///   - object: Object  to  store.
    ///   - key: Key at which object should be assigned.
    func set<T>(_ object: T?, for key: String)

    /// Returns object at provided key, if any.
    ///
    /// - Parameters:
    ///   - key: Key for the object to return.
    func get<T>(for key: String) -> T?
}

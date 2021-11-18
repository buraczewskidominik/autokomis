//
//  UserDefaultsStorage.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

/// Not secure persistent storage which saves objects in user defaults.
final class UserDefaultsStorage: Storage {

    // MARK: Private properties

    private let userDefaults = UserDefaults.standard

    // MARK: Methods

    // - SeeAlso: Storage.set
    func set<T>(_ object: T?, for key: String) {
        guard object != nil else {
            userDefaults.removeObject(forKey: key)
            return
        }
        guard let object = object as? NSCoding else {
            return
        }
        userDefaults.set(object, forKey: key)
    }

    // - SeeAlso: Storage.get
    func get<T>(for key: String) -> T? {
        guard let object = userDefaults.object(forKey: key) as? T else {
            return nil
        }
        return object
    }
}

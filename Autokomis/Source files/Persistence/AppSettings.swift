//
//  AppSettings.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import Foundation

enum LaunchStatus: String {
    case newSession
    case seller
    case buyer
}

enum AppSettingsKeys {
    
    static let launchStatusKey = "launchStatus"
}

/// Interface for getting and setting application settings.
final class AppSettings {
    
    /// Shared instance of Settings to be used in the application.
    static var shared = AppSettings()
    
    /// The UserDefaults instance backing the settings.
    private var userDefaults: UserDefaults
    
    /// Launch status.
    var launchStatus: String {
        get {
            return userDefaults.string(forKey: AppSettingsKeys.launchStatusKey) ?? LaunchStatus.newSession.rawValue
        }
        set {
            userDefaults.set(newValue, forKey: AppSettingsKeys.launchStatusKey)
        }
    }
    
    /// Construct a new Settings instance, optionally providing the UserDefaults instance to back settings.
    ///
    /// - Parameter defaults: The UserDefaults instance to use, defaults to the standard UserDefaults.
    init(defaults: UserDefaults = UserDefaults.standard) {
        userDefaults = defaults
    }
}

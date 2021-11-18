//
//  AppDependencies.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import Foundation

/// A holder for dependencies used in the app.
final class AppDependencies {
    
    // MARK: Storage
    
    private let userDefaultsStorage = UserDefaultsStorage()
    
    // MARK: Network
    
    lazy var apiClient = DefaultAPIClient()
    
    // MARK: Service
    
    /// Service providing user communication with the server.
    lazy var userService = DefaultUserService(apiClient: apiClient, userInfoProvider: userInfoProvider)
    
    /// Service providing information about cars.
    lazy var carService = DefaultCarService(apiClient: apiClient, userInfoProvider: userInfoProvider)
    
    /// Service providing user info.
    lazy var userInfoProvider = StorageUserInfoProvider(accountStorage: userDefaultsStorage)
    
    /// Service providing location data.
    lazy var locationManager = DefaultLocationManager()
}

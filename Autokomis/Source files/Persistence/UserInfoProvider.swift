//
//  UserInfoProvider.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

/// Describes entity capable of providing information about the user.
protocol UserInfoProvider: AnyObject {
    
    /// Id of a user.
    var userId: String? { get set }
    /// Business name.
    var businessName: String? { get set }
    /// If the account is premium.
    var isPremium: Bool { get set }
    /// First name of the user.
    var firstName: String? { get set }
    /// Last name of the user.
    var lastName: String? { get set }
    /// Phone number of the user.
    var phone: String? { get set }
    /// Email.
    var email: String? { get set }
    /// Latitude of the user.
    var latitude: Double? { get set }
    /// Longitude of the user.
    var longitude: Double? { get set }
    /// Creation date of the account.
    var created: String? { get set }
    
    /// Set new active user.
    func saveUser(_ user: User)
    
    /// Clears currently stored data.
    func clear()
}

/// User info provider based on storage.
final class StorageUserInfoProvider: UserInfoProvider {

    // MARK: Properties
    
    // - SeeAlso: UserInfoProvider.userId
    var userId: String? {
        get { accountStorage.get(for: StorageKeys.userIdStorageKey) }
        set { accountStorage.set(newValue, for: StorageKeys.userIdStorageKey) }
    }
    
    // - SeeAlso: UserInfoProvider.businessName
    var businessName: String? {
        get { accountStorage.get(for: StorageKeys.businessNameStorageKey) }
        set { accountStorage.set(newValue, for: StorageKeys.businessNameStorageKey) }
    }
    
    // - SeeAlso: UserInfoProvider.isPremium
    var isPremium: Bool {
        get { accountStorage.get(for: StorageKeys.isPremiumStorageKey) ?? false }
        set { accountStorage.set(newValue, for: StorageKeys.isPremiumStorageKey) }
    }
    
    // - SeeAlso: UserInfoProvider.firstName
    var firstName: String? {
        get { accountStorage.get(for: StorageKeys.firstNameStorageKey) }
        set { accountStorage.set(newValue, for: StorageKeys.firstNameStorageKey) }
    }
    
    // - SeeAlso: UserInfoProvider.lastName
    var lastName: String? {
        get { accountStorage.get(for: StorageKeys.lastNameStorageKey) }
        set { accountStorage.set(newValue, for: StorageKeys.lastNameStorageKey) }
    }
    
    // - SeeAlso: UserInfoProvider.phone
    var phone: String? {
        get { accountStorage.get(for: StorageKeys.phoneStorageKey) }
        set { accountStorage.set(newValue, for: StorageKeys.phoneStorageKey) }
    }
    
    // - SeeAlso: UserInfoProvider.email
    var email: String? {
        get { accountStorage.get(for: StorageKeys.emailStorageKey) }
        set { accountStorage.set(newValue, for: StorageKeys.emailStorageKey) }
    }
    
    // - SeeAlso: UserInfoProvider.latitude
    var latitude: Double? {
        get { accountStorage.get(for: StorageKeys.latitudeStorageKey) }
        set { accountStorage.set(newValue, for: StorageKeys.latitudeStorageKey) }
    }
    
    // - SeeAlso: UserInfoProvider.longitude
    var longitude: Double? {
        get { accountStorage.get(for: StorageKeys.longitudeStorageKey) }
        set { accountStorage.set(newValue, for: StorageKeys.longitudeStorageKey) }
    }
    
    // - SeeAlso: UserInfoProvider.created
    var created: String? {
        get { accountStorage.get(for: StorageKeys.createdStorageKey) }
        set { accountStorage.set(newValue, for: StorageKeys.createdStorageKey) }
    }

    // MARK: Private properties

    private let accountStorage: Storage
    
    /// Initializes the receiver.
    /// - Parameters:
    ///   - accountStorage: Stores the information about the user.
    init(accountStorage: Storage) {
        self.accountStorage = accountStorage
    }
    
    // MARK: Methods
    
    // - SeeAlso: UserInfoProvider.saveUser(_ user: User)
    func saveUser(_ user: User) {
        accountStorage.set(user.id, for: StorageKeys.userIdStorageKey)
        accountStorage.set(user.businessName, for: StorageKeys.businessNameStorageKey)
        accountStorage.set(user.isPremium, for: StorageKeys.isPremiumStorageKey)
        accountStorage.set(user.firstName, for: StorageKeys.firstNameStorageKey)
        accountStorage.set(user.lastName, for: StorageKeys.lastNameStorageKey)
        accountStorage.set(user.phone, for: StorageKeys.phoneStorageKey)
        accountStorage.set(user.email, for: StorageKeys.emailStorageKey)
        accountStorage.set(user.latitude, for: StorageKeys.latitudeStorageKey)
        accountStorage.set(user.longitude, for: StorageKeys.longitudeStorageKey)
        accountStorage.set(user.created, for: StorageKeys.createdStorageKey)
    }

    // - SeeAlso: UserInfoProvider.clear()
    func clear() {
        accountStorage.set(String?.none, for: StorageKeys.userIdStorageKey)
        accountStorage.set(String?.none, for: StorageKeys.businessNameStorageKey)
        accountStorage.set(false, for: StorageKeys.isPremiumStorageKey)
        accountStorage.set(String?.none, for: StorageKeys.firstNameStorageKey)
        accountStorage.set(String?.none, for: StorageKeys.lastNameStorageKey)
        accountStorage.set(String?.none, for: StorageKeys.phoneStorageKey)
        accountStorage.set(String?.none, for: StorageKeys.emailStorageKey)
        accountStorage.set(Double?.none, for: StorageKeys.latitudeStorageKey)
        accountStorage.set(Double?.none, for: StorageKeys.longitudeStorageKey)
        accountStorage.set(String?.none, for: StorageKeys.createdStorageKey)
    }
}

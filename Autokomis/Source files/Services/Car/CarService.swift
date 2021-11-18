//
//  CarService.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

protocol CarService: AnyObject {
    
    func addCar(
        id: String,
        sellerId: String,
        make: String?,
        model: String?,
        year: String?,
        petrolType: Int,
        isDamagedNow: Bool,
        hadAccident: Bool,
        hasPlates: Bool,
        milage: String?,
        price: String?,
        power: String?,
        cylinderCapacity: String?,
        description: String?,
        photos: [Data],
        created: String,
        completionHandler: @escaping (Result<Car, Error>) -> Void
    )
    
    func updateCar(
        id: String,
        make: String?,
        model: String?,
        year: String?,
        petrolType: Int,
        isDamagedNow: Bool,
        hadAccident: Bool,
        hasPlates: Bool,
        milage: String?,
        price: String?,
        power: String?,
        cylinderCapacity: String?,
        description: String?,
        completionHandler: @escaping (Result<Car, Error>) -> Void
    )
    
    func deleteCar(
        carId: String,
        completionHandler: @escaping (Result<Car, Error>) -> Void
    )
    
    func deleteCarPhotos(
        carId: String,
        photoIds: [String],
        completionHandler: @escaping (Result<Car, Error>) -> Void
    )
    
    func getSellersCars(
        sellerId: String,
        completionHandler: @escaping (Result<[Car], Error>) -> Void
    )
    
    func markAsSold(
        carId: String,
        sold: Bool,
        completionHandler: @escaping (Result<Car, Error>) -> Void
    )
}

final class DefaultCarService: CarService {
    
    // MARK: Private properties

    private let apiClient: APIClient
    private let userInfoProvider: UserInfoProvider
    
    // MARK: Initializers

    /// Initializes the receiver.
    /// - Parameters:
    ///   - apiClient: Client which allows connecting to the API.
    ///   - userInfoProvider: Service providing user info.
    init(
        apiClient: APIClient,
        userInfoProvider: UserInfoProvider
    ) {
        self.apiClient = apiClient
        self.userInfoProvider = userInfoProvider
    }
    
    func addCar(
        id: String,
        sellerId: String,
        make: String?,
        model: String?,
        year: String?,
        petrolType: Int,
        isDamagedNow: Bool,
        hadAccident: Bool,
        hasPlates: Bool,
        milage: String?,
        price: String?,
        power: String?,
        cylinderCapacity: String?,
        description: String?,
        photos: [Data],
        created: String,
        completionHandler: @escaping (Result<Car, Error>) -> Void
    ) {
        
    }
    
    func updateCar(
        id: String,
        make: String?,
        model: String?,
        year: String?,
        petrolType: Int,
        isDamagedNow: Bool,
        hadAccident: Bool,
        hasPlates: Bool,
        milage: String?,
        price: String?,
        power: String?,
        cylinderCapacity: String?,
        description: String?,
        completionHandler: @escaping (Result<Car, Error>) -> Void
    ) {
        
    }
    
    func deleteCar(
        carId: String,
        completionHandler: @escaping (Result<Car, Error>) -> Void
    ) {
        
    }
    
    func deleteCarPhotos(
        carId: String,
        photoIds: [String],
        completionHandler: @escaping (Result<Car, Error>) -> Void
    ) {
        
    }
    
    func getSellersCars(
        sellerId: String,
        completionHandler: @escaping (Result<[Car], Error>) -> Void
    ) {
        
    }
    
    func markAsSold(
        carId: String,
        sold: Bool,
        completionHandler: @escaping (Result<Car, Error>) -> Void
    ) {
        
    }
}

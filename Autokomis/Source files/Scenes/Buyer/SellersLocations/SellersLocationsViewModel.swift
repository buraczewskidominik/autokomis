//
//  SellersLocationsViewModel.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import Foundation
import MapKit

final class SellersLocationsViewModel: ViewModel {
    
    // MARK: Private properties
    
    private var locationManager: LocationManager
    private var userService: UserService
    
    private var sellers: [User] = []
    
    init(
        locationManager: LocationManager,
        userService: UserService
    ) {
        self.locationManager = locationManager
        self.userService = userService
        locationManager.requestLocationAuthorization {}
    }
    
    func getUserLocation(completionHandler: @escaping (CLLocationCoordinate2D?, Error?) -> Void) {
        locationManager.requestLocationAuthorization { [weak self] in
            self?.locationManager.requestDeviceLocation { location, error in
                completionHandler(location?.coordinate, error)
            }
        }
    }
    
    func getSellers(
        forLocation location: CLLocationCoordinate2D,
        completionHandler: @escaping ([User], Error?) -> Void
    ) {
        userService.usersForLocation(
            latitude: location.latitude,
            longitude: location.longitude,
            radius: Radius.twentyFiveKm
        ) { result in
            switch result {
            case .success(let sellers):
                if sellers.isEmpty {
                    self.sellers.append(contentsOf: sellers)
                    completionHandler([], APIError.emptyResponse)
                } else {
                    completionHandler(sellers, nil)
                }
            case .failure(let error):
                completionHandler([], error)
            }
        }
    }
    
    func getSeller(withId id: String) -> User? {
        sellers.first(where: { $0.id == id })
    }
}

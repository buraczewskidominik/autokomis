//
//  LocationManager.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 09/08/2021.
//

import Foundation
import CoreLocation

protocol LocationManager: AnyObject {
    
    func requestLocationAuthorization(completionHandler: @escaping(() -> Void))
    
    func requestDeviceLocation(completionHandler: @escaping((CLLocation?, Error?) -> Void))
}

final class DefaultLocationManager: NSObject, LocationManager, CLLocationManagerDelegate {
    
    private var locationManager: CLLocationManager?
    private var completionHandler: (() -> Void)!
    private var completionLocationHandler: ((CLLocation?, Error?) -> Void)!

    // MARK: - Public methods -

    func requestLocationAuthorization(completionHandler: @escaping(() -> Void)) {
        self.completionHandler = completionHandler
        if locationManager == nil {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.requestWhenInUseAuthorization()
        } else {
            checkLocationStatus(status: CLLocationManager.authorizationStatus())
        }
    }

    func requestDeviceLocation(completionHandler: @escaping((CLLocation?, Error?) -> Void)) {
        completionLocationHandler = completionHandler

        locationManager?.requestLocation()
    }

    // MARK: - Internal methods -

    private func checkLocationStatus(status: CLAuthorizationStatus) {

        switch status {
        case .authorizedAlways,
             .authorizedWhenInUse:
            completionHandler()
        default:
            if let completion = completionLocationHandler {
                completion(nil, APIError.locationAccessError)
            }
        }
    }

    // MARK: - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationStatus(status: status)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }

        completionLocationHandler(location, nil)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        completionLocationHandler(nil, error)
    }
}

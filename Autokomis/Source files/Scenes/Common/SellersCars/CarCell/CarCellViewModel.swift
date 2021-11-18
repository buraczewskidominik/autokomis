//
//  CarCellViewModel.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

final class CarCellViewModel: NSObject {
    
    private let car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    func frontImage() -> URL? {
        guard let url = car.urls.first else { return nil }
        return URL(string: url)
    }
    
    func carFullName() -> String {
        "\(car.make) \(car.model)"
    }
    
    func carPrice() -> String {
        car.price
    }
    
    func carMilage() -> String {
        car.milage
    }
    
    func carYear() -> String {
        car.year
    }
    
    func petrolType() -> String {
        switch car.petrolType {
        case 0:
            return "PB"
        case 1:
            return"ON"
        case 2:
            return "LPG"
        case 3:
            return "Electric"
        case 4:
            return "Hybrid"
        default:
            return "Nieznane"
        }
    }
}

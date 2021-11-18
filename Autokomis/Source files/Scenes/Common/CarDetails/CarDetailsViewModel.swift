//
//  CarDetailsViewModel.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 13/08/2021.
//

import Foundation

final class CarDetailsViewModel: NSObject {
    
    private let car: Car
    
    init(
        car: Car
    ) {
        self.car = car
    }
    
    func getImages() -> [URL?] {
        car.urls.map { URL(string: $0) }
    }
    
    func carIsNotDamaged() -> Bool {
        !car.isDamagedNow
    }
    
    func carIsAccidentFree() -> Bool {
        !car.hadAccident
    }
    
    func carHasPlates() -> Bool {
        car.hasPlates
    }
}

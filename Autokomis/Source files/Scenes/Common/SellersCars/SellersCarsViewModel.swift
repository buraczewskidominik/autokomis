//
//  SellersCarsViewModel.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

final class SellersCarsViewModel: NSObject {
    
    // MARK: Private properties
    
    private let carService: CarService
    private let userInfoProvider: UserInfoProvider

    private var seller: User?
    
    private var soldCars: [Car] = []
    private var availableCars: [Car] = []
    
    init(
        seller: User? = nil,
        carService: CarService,
        userInfoProvider: UserInfoProvider
    ) {
        self.seller = seller
        self.carService = carService
        self.userInfoProvider = userInfoProvider
    }
    
    func userIsSeller() -> Bool { seller?.id == userInfoProvider.userId }
    
    func getCars(completionHandler: @escaping ([Car], [Car], Error?) -> Void) {
        guard let sellerId = seller?.id else { return }
        carService.getSellersCars(sellerId: sellerId) { [weak self] result in
            switch result {
            case .success(let cars):
                let availableCars = cars.filter { !$0.sold }
                let soldCars = cars.filter { $0.sold }
                
                self?.availableCars.append(contentsOf: availableCars)
                self?.soldCars.append(contentsOf: soldCars)
                
                completionHandler(availableCars, soldCars, nil)
            case .failure(let error):
                completionHandler([], [], error)
            }
        }
    }
    
    func getAvailableCars() -> [Car] { availableCars }
    
    func getSoldCars() -> [Car] { soldCars }
}

extension SellersCarsViewModel {
    
    func getMockedCars() -> [Car] {
        [Car.mocked(), Car.mocked2(), Car.mocked3()]
    }
}

extension Car {
    
    static func mocked() -> Car {
        Car(
            id: "1",
            sellerId: "1",
            sold: false,
            make: "VW",
            model: "Passat",
            year: "2015",
            petrolType: 0,
            isDamagedNow: false,
            hadAccident: false,
            hasPlates: true,
            milage: "110000",
            price: "20000",
            power: "140",
            cylinderCapacity: "1900",
            description: "Nowy fajny passacik",
            urls:["https://www.mercedes-benz.pl/passengercars/mercedes-benz-cars/models/gle/coupe-c167/explore/highlights/_jcr_content/contentgallerycontainer/par/contentgallery/par/contentgallerytile_58586423/image.MQ6.8.20200228144351.jpeg",
                "https://www.mercedes-benz.com.my/passengercars/mercedes-benz-cars/models/gle/coupe-c167/comfort/functionality/_jcr_content/par/videoimageslider/slides/videoimageslide/image.MQ6.12.20200108024508.jpeg"
            ],
            created: "99900"
        )
    }
    
    static func mocked2() -> Car {
        Car(
            id: "2",
            sellerId: "1",
            sold: false,
            make: "VW",
            model: "Passat",
            year: "2015",
            petrolType: 0,
            isDamagedNow: false,
            hadAccident: false,
            hasPlates: true,
            milage: "110000",
            price: "20000",
            power: "140",
            cylinderCapacity: "1900",
            description: "Nowy fajny passacik",
            urls: [],
            created: "99900"
        )
    }
    
    static func mocked3() -> Car {
        Car(
            id: "3",
            sellerId: "1",
            sold: false,
            make: "VW",
            model: "Passat",
            year: "2015",
            petrolType: 0,
            isDamagedNow: false,
            hadAccident: false,
            hasPlates: true,
            milage: "110000",
            price: "20000",
            power: "140",
            cylinderCapacity: "1900",
            description: "Nowy fajny passacik",
            urls: [],
            created: "99900"
        )
    }

}

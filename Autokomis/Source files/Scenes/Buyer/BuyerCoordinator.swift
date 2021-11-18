//
//  BuyerCoordinator.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import UIKit

protocol BuyerCoordinatorDelagate: AnyObject {
    
    func buyerLoggedOut(_ buyerCoordinator: BuyerCoordinator)
}

final class BuyerCoordinator: Coordinator {
    
    weak var delegate: BuyerCoordinatorDelagate?
    
    // MARK: Private properties
    
    private var navigationController: UINavigationController
    private let appDependencies: AppDependencies
    
    init(navigationController: UINavigationController, appDependencies: AppDependencies) {
        self.navigationController = navigationController
        self.appDependencies = appDependencies
    }
    
    func start() {
        showSellersLocations()
    }
    
    private func showSellersLocations() {
        let sellersLocationsViewController = SellersLocationsViewController()
        sellersLocationsViewController.delegate = self
        let sellersLocationsViewModel = SellersLocationsViewModel(
            locationManager: appDependencies.locationManager,
            userService: appDependencies.userService
        )
        sellersLocationsViewController.viewModel = sellersLocationsViewModel
        navigationController.pushViewController(sellersLocationsViewController, animated: true)
    }
    
    private func showSellersCarList(forSeller seller: User) {
        let sellersCarsViewController = SellersCarsViewController()
        sellersCarsViewController.delegate = self
        let sellersCarsViewModel = SellersCarsViewModel(
            seller: seller,
            carService: appDependencies.carService,
            userInfoProvider: appDependencies.userInfoProvider
        )
        sellersCarsViewController.viewModel = sellersCarsViewModel
        navigationController.pushViewController(sellersCarsViewController, animated: true)
    }
    
    private func showSellerCar(_ car: Car) {
        let carDetailsViewController = CarDetailsViewController()
        carDetailsViewController.delegate = self
        let carDetailsViewModel = CarDetailsViewModel(
            car: car
        )
        carDetailsViewController.viewModel = carDetailsViewModel
        navigationController.pushViewController(carDetailsViewController, animated: true)
    }
}

// MARK: - SellersLocationsViewControllerDelegate methods -

extension BuyerCoordinator: SellersLocationsViewControllerDelegate {
    func showError(_ error: Error?) {
        // TODO: display location error. Create pop up window controller.
    }
    
    func didChooseSeller(_ seller: User) {
        showSellersCarList(forSeller: seller)
    }
    
    func startNewSession() {
        delegate?.buyerLoggedOut(self)
    }
}

// MARK: - SellersLocationsViewControllerDelegate methods -

extension BuyerCoordinator: SellersCarsViewControllerDelegate {
    func didClickAddCar() { }
    
    func didChooseCar(_ car: Car) {
        showSellerCar(car)
    }
}

// MARK: - CarDetailsViewControllerDelegate methods -

extension BuyerCoordinator: CarDetailsViewControllerDelegate {
    
}

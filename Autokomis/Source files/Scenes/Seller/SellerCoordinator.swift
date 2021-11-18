//
//  SellerCoordinator.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import UIKit

protocol SellerCoordinatorDelegate: AnyObject {
    
    func sellerLoggedOut(_ sellerCoordinator: SellerCoordinator)
}

final class SellerCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    weak var delegate: SellerCoordinatorDelegate?
    
    // MARK: Private properties
    
    private let appDependencies: AppDependencies
    
    init(
        navigationController: UINavigationController,
        appDependencies: AppDependencies
    ) {
        self.navigationController = navigationController
        self.appDependencies = appDependencies
    }
    
    func start() {
        showSellersCars()
    }
    
    private func showSellersCars() {
        let sellersCarsViewController = SellersCarsViewController()
        sellersCarsViewController.delegate = self
        let sellersCarsViewModel = SellersCarsViewModel(
            carService: appDependencies.carService,
            userInfoProvider: appDependencies.userInfoProvider
        )
        sellersCarsViewController.viewModel = sellersCarsViewModel
        navigationController.pushViewController(sellersCarsViewController, animated: true)
    }
    
    private func showSellerProfile() {
        let sellerProfileViewController = SellerProfileViewController()
        sellerProfileViewController.delegate = self
        let sellerProfileViewModel = SellerProfileViewModel()
        sellerProfileViewController.viewModel = sellerProfileViewModel
        navigationController.pushViewController(sellerProfileViewController, animated: true)
    }
    
    private func showEditSellerProfile() {
        let editSellerProfileViewController = EditSellerProfileViewController()
        editSellerProfileViewController.delegate = self
        let editSellerProfileViewModel = EditSellerProfileViewModel()
        editSellerProfileViewController.viewModel = editSellerProfileViewModel
        navigationController.pushViewController(editSellerProfileViewController, animated: true)
    }
    
    private func displayAddCar() {
        let addCarViewController = AddCarViewController()
        addCarViewController.delegate = self
        let addCarViewModel = AddCarViewModel()
        addCarViewController.viewModel = addCarViewModel
        navigationController.present(addCarViewController, animated: true)
    }
    
    private func showCarDetails(car: Car) {
        let carDetailsViewController = CarDetailsViewController()
        carDetailsViewController.delegate = self
        let carDetailsViewModel = CarDetailsViewModel(
            car: car
        )
        carDetailsViewController.viewModel = carDetailsViewModel
        navigationController.pushViewController(carDetailsViewController, animated: true)
    }
    
    private func displayEditCar() {
        let editCarViewController = EditCarViewController()
        editCarViewController.delegate = self
        let editCarViewModel = EditCarViewModel()
        editCarViewController.viewModel = editCarViewModel
        navigationController.present(editCarViewController, animated: true)
    }
}

// MARK: - SellersCarsViewControllerDelegate -

extension SellerCoordinator: SellersCarsViewControllerDelegate {
    func didClickAddCar() {
        displayAddCar()
    }
    
    func didChooseCar(_ car: Car) {
        showCarDetails(car: car)
    }
}

// MARK: - CarDetailsViewControllerDelegate -

extension SellerCoordinator: CarDetailsViewControllerDelegate {
    
}

// MARK: - SellerProfileViewControllerDelegate -

extension SellerCoordinator: SellerProfileViewControllerDelegate {
    func didClickEditProfile() {
        showEditSellerProfile()
    }
}

// MARK: - EditSellerProfileViewControllerDelegate -

extension SellerCoordinator: EditSellerProfileViewControllerDelegate {
    func didClickDone() {
        navigationController.popViewController(animated: true)
    }
}

// MARK: - AddCarViewControllerDelegate -

extension SellerCoordinator: AddCarViewControllerDelegate {
    func didAddCar(_ car: Car) {
        // TODO: add car to the list.
    }
}

// MARK: - EditCarViewControllerDelegate -

extension SellerCoordinator: EditCarViewControllerDelegate {
    func didSaveChanges() {
        // TODO: save car changes.
    }
}

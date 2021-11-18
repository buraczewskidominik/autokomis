//
//  AppCoordinator.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import UIKit

/// A coordinator for core app navigation.
final class AppCoordinator: Coordinator {
    
    // MARK: Private properties
        
    private var newSessionCoordinator: NewSessionCoordinator?
    private var sellerCoordinator: SellerCoordinator?
    private var buyerCoordinator: BuyerCoordinator?
    
    private let window: UIWindow
    private let appDependencies: AppDependencies
    
    /// Initialize an AppCoordinator for the given window.
    ///
    /// - Parameters:
    ///   - window: The window for the coordinator to use.
    ///   - appDependencies: The app dependencies container.
    init(window: UIWindow, appDependencies: AppDependencies) {
        self.window = window
        self.appDependencies = appDependencies
        window.makeKeyAndVisible()
    }
    
    func start() {
        showSplash()
    }
    
    private func showSplash() {
        let splashViewController = SplashViewController()
        splashViewController.delegate = self
        window.rootViewController = splashViewController
    }
    
    private func showNewSession() {
        let navigationController = UINavigationController()
        let newSessionCoordinator = NewSessionCoordinator(navigationController: navigationController, appDependencies: appDependencies)
        newSessionCoordinator.delegate = self
        newSessionCoordinator.start()
        self.newSessionCoordinator = newSessionCoordinator
        transition(to: navigationController)
    }
    
    private func showSeller() {
        let navigationController = UINavigationController()
        let sellerCoordinator = SellerCoordinator(navigationController: navigationController, appDependencies: appDependencies)
        sellerCoordinator.delegate = self
        sellerCoordinator.start()
        self.sellerCoordinator = sellerCoordinator
        transition(to: navigationController)
    }
    
    private func showBuyer() {
        let navigationController = UINavigationController()
        let buyerCoordinator = BuyerCoordinator(navigationController: navigationController, appDependencies: appDependencies)
        buyerCoordinator.delegate = self
        buyerCoordinator.start()
        self.buyerCoordinator = buyerCoordinator
        transition(to: navigationController)
    }
}

extension AppCoordinator {
    
    private func transition(to viewController: UIViewController) {
        viewController.view.backgroundColor = .white
        let snapshot = window.snapshotView(afterScreenUpdates: false)
        window.rootViewController = viewController
        if let snapshot = snapshot {
            viewController.view.addSubview(snapshot)
            UIView.animate(withDuration: 0.3,
                           animations: { snapshot.alpha = 0 },
                           completion: { _ in snapshot.removeFromSuperview() }
            )
        }
    }
    
    private func startCoordinatorBasedOnLaunchStatus() {
        switch AppSettings.shared.launchStatus {
        case LaunchStatus.seller.rawValue:
            showSeller()
        case LaunchStatus.buyer.rawValue:
            showBuyer()
        default:
            showNewSession()
        }
    }
}

// MARK: SplashViewControllerDelegate methods

extension AppCoordinator: SplashViewControllerDelegate {
    
    func splashDidComplete(_ splashViewController: SplashViewController) {
//        startCoordinatorBasedOnLaunchStatus()
        showSeller()
    }
}

// MARK: NewSessionCoordinatorDelegate methods

extension AppCoordinator: NewSessionCoordinatorDelagate {
    func newSessionCompleted(_ newSessionCoordinator: NewSessionCoordinator) {
        startCoordinatorBasedOnLaunchStatus()
        self.newSessionCoordinator = nil
    }
}

// MARK: NewSessionCoordinatorDelegate methods

extension AppCoordinator: SellerCoordinatorDelegate {
    func sellerLoggedOut(_ sellerCoordinator: SellerCoordinator) {
        // TODO: replace this logic in user log out method. When user data is wiped LaunchStatus is always set to newSession.
        AppSettings.shared.launchStatus = LaunchStatus.newSession.rawValue
        startCoordinatorBasedOnLaunchStatus()
        self.sellerCoordinator = nil
    }
}

// MARK: NewSessionCoordinatorDelegate methods

extension AppCoordinator: BuyerCoordinatorDelagate {
    func buyerLoggedOut(_ buyerCoordinator: BuyerCoordinator) {
        // TODO: replace this logic in user log out method. When user data is wiped LaunchStatus is always set to newSession.
        AppSettings.shared.launchStatus = LaunchStatus.newSession.rawValue
        startCoordinatorBasedOnLaunchStatus()
        self.buyerCoordinator = nil
    }
}

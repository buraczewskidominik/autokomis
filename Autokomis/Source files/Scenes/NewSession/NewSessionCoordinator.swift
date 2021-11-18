//
//  NewSessionCoordinator.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import UIKit

protocol NewSessionCoordinatorDelagate: AnyObject {
    
    func newSessionCompleted(_ newSessionCoordinator: NewSessionCoordinator)
}

final class NewSessionCoordinator: Coordinator {
    
    weak var delegate: NewSessionCoordinatorDelagate?
    
    // MARK: Private properties
    
    private var navigationController: UINavigationController
    private let appDependencies: AppDependencies
    
    init(navigationController: UINavigationController, appDependencies: AppDependencies) {
        self.navigationController = navigationController
        self.appDependencies = appDependencies
    }
    
    func start() {
        showWelcome()
    }
    
    private func showWelcome() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.delegate = self
        navigationController.pushViewController(welcomeViewController, animated: true)
    }
    
    private func showSignUp() {
        let signUpViewController = SignUpViewController()
        signUpViewController.delegate = self
        let signUpViewModel = SignUpViewModel(userService: appDependencies.userService, userInfoProvider: appDependencies.userInfoProvider)
        signUpViewController.viewModel = signUpViewModel
        navigationController.pushViewController(signUpViewController, animated: true)
    }
    
    private func showLogIn() {
        let logInViewController = LogInViewController()
        logInViewController.delegate = self
        let logInViewModel = LogInViewModel(userService: appDependencies.userService, userInfoProvider: appDependencies.userInfoProvider)
        logInViewController.viewModel = logInViewModel
        navigationController.pushViewController(logInViewController, animated: true)
    }
}

extension NewSessionCoordinator {
    
    private func completeNewSessionAsSeller() {
        AppSettings.shared.launchStatus = LaunchStatus.seller.rawValue
        delegate?.newSessionCompleted(self)
    }
}

// MARK: WelcomeViewControllerDelegate methods

extension NewSessionCoordinator: WelcomeViewControllerDelegate {
    func didClickSignUp() {
        showSignUp()
    }
    
    func didClickLogIn() {
        showLogIn()
    }
    
    func didClickContinueBuying() {
        AppSettings.shared.launchStatus = LaunchStatus.buyer.rawValue
        delegate?.newSessionCompleted(self)
    }
}

// MARK: SignUpViewControllerDelegate methods

extension NewSessionCoordinator: SignUpViewControllerDelegate {
    func didSignUp() {
        completeNewSessionAsSeller()
    }
}

// MARK: LogInViewControllerDelegate methods

extension NewSessionCoordinator: LogInViewControllerDelegate {
    func didLogIn() {
        completeNewSessionAsSeller()
    }
}

//
//  WelcomeViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: WelcomeViewControllerDelegate?
    
    // MARK: UI
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = Localizable.Welcome.welcome
        label.textAlignment = .center
        return label
    }()
    
    private lazy var signUpButton: ThemedButton = {
        let button = ThemedButton(style: .signUp)
        button.setTitle(Localizable.Welcome.signUp, for: .normal)
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    private lazy var logInButton: ThemedButton = {
        let button = ThemedButton(style: .logIn)
        button.setTitle(Localizable.Welcome.logIn, for: .normal)
        button.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        return button
    }()
    
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = Localizable.Welcome.or
        label.textAlignment = .center
        return label
    }()
    
    private lazy var continueBuyingButton: ThemedButton = {
        let button = ThemedButton(style: .continueBuying)
        button.setTitle(Localizable.Welcome.continueBuying, for: .normal)
        button.addTarget(self, action: #selector(continueBuying), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        view.addSubviews(welcomeLabel, signUpButton, logInButton, orLabel, continueBuyingButton)
        
        welcomeLabel.addConstraints { [
            $0.greaterThanOrEqualTo(view, .safeAreaTop, .top, constant: Margins.xxxlarge),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        signUpButton.addConstraints { [
            $0.equalTo(welcomeLabel, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        logInButton.addConstraints { [
            $0.equalTo(signUpButton, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        orLabel.addConstraints { [
            $0.equalTo(logInButton, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        continueBuyingButton.addConstraints { [
            $0.equalTo(orLabel, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium),
            $0.equal(.safeAreaBottom, constant: -Margins.medium)
        ] }
    }
    
    // MARK: Actions
    
    @objc private func signUp() {
        delegate?.didClickSignUp()
    }
    
    @objc private func logIn() {
        delegate?.didClickLogIn()
    }
    
    @objc private func continueBuying() {
        delegate?.didClickContinueBuying()
    }
}

// MARK: Delegate

protocol WelcomeViewControllerDelegate: AnyObject {
    
    func didClickSignUp()
    
    func didClickLogIn()
    
    func didClickContinueBuying()
}

//
//  LogInViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import UIKit

final class LogInViewController: KeyboardPresentableViewController, ViewControllerType {
    
    // MARK: Properties
    
    weak var delegate: LogInViewControllerDelegate?
    
    var viewModel: LogInViewModel!
        
    // MARK: UI
    
    private lazy var logInLabel: UILabel = {
        let label = UILabel()
        label.text = Localizable.LogIn.logInTitle
        label.textAlignment = .center
        return label
    }()
    
    private lazy var emailTextField: ThemedTextField = {
        let textfield = ThemedTextField(placeholder: Localizable.LogIn.email)
        return textfield
    }()
    
    private lazy var passwordTextField: ThemedTextField = {
        let textfield = ThemedTextField(placeholder: Localizable.LogIn.password)
        return textfield
    }()
    
    private lazy var logInButton: ThemedButton = {
        let button = ThemedButton(style: .logIn)
        button.setTitle(Localizable.LogIn.logIn, for: .normal)
        button.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        view.addSubviews(logInLabel, emailTextField, passwordTextField, logInButton)
        presentedTextFields = [emailTextField, passwordTextField]
        
        logInLabel.addConstraints { [
            $0.greaterThanOrEqualTo(view, .safeAreaTop, .top, constant: Margins.xxxlarge),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        emailTextField.addConstraints { [
            $0.equalTo(logInLabel, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        passwordTextField.addConstraints { [
            $0.equalTo(emailTextField, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        logInButton.addConstraints { [
            $0.equalTo(passwordTextField, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium),
            $0.equal(.safeAreaBottom, constant: -Margins.medium)
        ] }
    }
    
    // MARK: Actions
    
    @objc private func logIn() {
        viewModel.logIn(email: emailTextField.value, password: passwordTextField.value) { [weak self] error in
            guard let _ = error else {
                self?.delegate?.didLogIn()
                return
            }
            // TODO: display error.
        }
    }
}

// MARK: Delegate

protocol LogInViewControllerDelegate: AnyObject {
    
    func didLogIn()
}

//
//  SignUpViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import UIKit
import Combine

final class SignUpViewController: KeyboardPresentableViewController, ViewControllerType {
    
    // MARK: Properties
    
    weak var delegate: SignUpViewControllerDelegate?
    
    var viewModel: SignUpViewModel!
        
    // MARK: UI
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var scrollViewContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = Localizable.SignUp.signUpTitle
        label.textAlignment = .center
        return label
    }()
    
    private lazy var businessNameTextField: ThemedTextField = {
        let textfield = ThemedTextField(placeholder: Localizable.SignUp.businessName)
        return textfield
    }()
    
    private lazy var firstNameTextField: ThemedTextField = {
        let textfield = ThemedTextField(placeholder: Localizable.SignUp.firstName)
        return textfield
    }()
    
    private lazy var lastNameTextField: ThemedTextField = {
        let textfield = ThemedTextField(placeholder: Localizable.SignUp.lastName)
        return textfield
    }()
    
    private lazy var phoneTextField: ThemedTextField = {
        let textfield = ThemedTextField(placeholder: Localizable.SignUp.phone)
        return textfield
    }()
    
    private lazy var emailTextField: ThemedTextField = {
        let textfield = ThemedTextField(placeholder: Localizable.SignUp.email)
        return textfield
    }()
    
    private lazy var passwordTextField: ThemedTextField = {
        let textfield = ThemedTextField(placeholder: Localizable.SignUp.password)
        return textfield
    }()
    
    private lazy var confirmPasswordTextField: ThemedTextField = {
        let textfield = ThemedTextField(placeholder: Localizable.SignUp.confirmPassword)
        return textfield
    }()
    
    private lazy var signUpButton: ThemedButton = {
        let button = ThemedButton(style: .signUp)
        button.setTitle(Localizable.SignUp.signUp, for: .normal)
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        scrollView.addConstraints {
            $0.equalEdges()
        }
        
        scrollView.addSubview(scrollViewContainer)
        
        scrollViewContainer.addConstraints { [
            $0.equal(.top),
            $0.equal(.bottom),
            $0.equalTo(view, .leading, .leading),
            $0.equalTo(view, .trailing, .trailing)
        ] }
        
        scrollViewContainer.addSubviews(
            signUpLabel,
            businessNameTextField,
            firstNameTextField,
            lastNameTextField,
            phoneTextField,
            emailTextField,
            passwordTextField,
            confirmPasswordTextField,
            signUpButton
        )
        
        presentedTextFields = [
            businessNameTextField,
            firstNameTextField,
            lastNameTextField,
            phoneTextField,
            emailTextField,
            passwordTextField,
            confirmPasswordTextField
        ]
        
        signUpLabel.addConstraints { [
            $0.greaterThanOrEqualTo(scrollViewContainer, .top, .top, constant: Margins.xxxlarge),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        businessNameTextField.addConstraints { [
            $0.equalTo(signUpLabel, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        firstNameTextField.addConstraints { [
            $0.equalTo(businessNameTextField, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        lastNameTextField.addConstraints { [
            $0.equalTo(firstNameTextField, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        phoneTextField.addConstraints { [
            $0.equalTo(lastNameTextField, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        emailTextField.addConstraints { [
            $0.equalTo(phoneTextField, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        passwordTextField.addConstraints { [
            $0.equalTo(emailTextField, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        confirmPasswordTextField.addConstraints { [
            $0.equalTo(passwordTextField, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        signUpButton.addConstraints { [
            $0.equalTo(confirmPasswordTextField, .top, .bottom, constant: Margins.medium),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium),
            $0.equal(.bottom, constant: -Margins.medium)
        ] }
    }
    
    // MARK: Actions
    
    @objc private func signUp() {
        viewModel.signUp(
            businessName: businessNameTextField.value,
            firstName: firstNameTextField.value,
            lastName: lastNameTextField.value,
            phone: phoneTextField.value,
            email: emailTextField.value,
            password: passwordTextField.value,
            confirmedPassword: confirmPasswordTextField.value
        ) { [weak self] error in
            guard let _ = error else {
                self?.delegate?.didSignUp()
                return
            }
            // TODO: display error.
        }
    }
}

// MARK: Delegate

protocol SignUpViewControllerDelegate: AnyObject {
    
    func didSignUp()
}

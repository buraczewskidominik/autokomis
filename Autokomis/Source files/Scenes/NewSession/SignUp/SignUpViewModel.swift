//
//  SignUpViewModel.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import Foundation

final class SignUpViewModel: ViewModel {
    
    // MARK: Private properties
    
    private let userService: UserService
    private let userInfoProvider: UserInfoProvider
    
    init(
        userService: UserService,
        userInfoProvider: UserInfoProvider
    ) {
        self.userService = userService
        self.userInfoProvider = userInfoProvider
    }
    
    func signUp(
        businessName: String?,
        firstName: String?,
        lastName: String?,
        phone: String?,
        email: String?,
        password: String?,
        confirmedPassword: String?,
        completionHandler: @escaping (String?) -> Void
    ) {
        let id = "1" // generate random id
        let latitude = ""
        let longitude = ""
        let created = ""
        userService.signUp(
            id: id,
            businessName: businessName,
            isPremium: false,
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            email: email,
            password: password,
            confirmedPassword: confirmedPassword,
            latitude: latitude,
            longitude: longitude,
            created: created
        ) { [weak self] result in
            switch result {
            case .success(let user):
                self?.userInfoProvider.saveUser(user)
                completionHandler(nil)
            case .failure(let error):
                completionHandler(error.localizedDescription)
            }
        }
            
    }
}

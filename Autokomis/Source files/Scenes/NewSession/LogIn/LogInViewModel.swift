//
//  LogInViewModel.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import Foundation

final class LogInViewModel: ViewModel {
    
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
    
    func logIn(
        email: String?,
        password: String?,
        completionHandler: @escaping (String?) -> Void
    ) {
        userService.logIn(
            email: email,
            password: password
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

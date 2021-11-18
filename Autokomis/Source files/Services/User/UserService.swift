//
//  UserService.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 09/08/2021.
//

import Foundation

protocol UserService {
    
    func logIn(
        email: String?,
        password: String?,
        completionHandler: @escaping (Result<User, Error>) -> Void
    )
    
    func signUp(
        id: String,
        businessName: String?,
        isPremium: Bool,
        firstName: String?,
        lastName: String?,
        phone: String?,
        email: String?,
        password: String?,
        confirmedPassword: String?,
        latitude: String,
        longitude: String,
        created: String,
        completionHandler: @escaping (Result<User, Error>) -> Void
    )
    
    func usersForLocation(
        latitude: Double,
        longitude: Double,
        radius: Int,
        completionHandler: @escaping (Result<[User], Error>) -> Void
    )
}

final class DefaultUserService: UserService {
    
    // MARK: Private properties

    private let apiClient: APIClient
    private let userInfoProvider: UserInfoProvider
    
    // MARK: Initializers

    /// Initializes the receiver.
    /// - Parameters:
    ///   - apiClient: Client which allows connecting to the API.
    ///   - userInfoProvider: Service providing user info.
    init(
        apiClient: APIClient,
        userInfoProvider: UserInfoProvider
    ) {
        self.apiClient = apiClient
        self.userInfoProvider = userInfoProvider
    }
    
    func logIn(
        email: String?,
        password: String?,
        completionHandler: @escaping (Result<User, Error>) -> Void
    ) {
        do {
            let email = try AuthenticationValidator.validate(email: email)
            let password = try AuthenticationValidator.validate(password: password)
            let logInRequest = LogInRequest(email: email, password: password)
            apiClient.execute(request: logInRequest, answerType: User.self) { result in
                completionHandler(result)
            }
        } catch {
            completionHandler(.failure(error))
        }
    }
    
    func signUp(
        id: String,
        businessName: String?,
        isPremium: Bool,
        firstName: String?,
        lastName: String?,
        phone: String?,
        email: String?,
        password: String?,
        confirmedPassword: String?,
        latitude: String,
        longitude: String,
        created: String,
        completionHandler: @escaping (Result<User, Error>) -> Void
    ) {
        do {
            let businessName = try AuthenticationValidator.validate(input: businessName)
            let isPremium = false
            let firstName = try AuthenticationValidator.validate(input: firstName)
            let lastName = try AuthenticationValidator.validate(input: lastName)
            let phone = try AuthenticationValidator.validate(input: phone)
            let email = try AuthenticationValidator.validate(email: email)
            let password = try AuthenticationValidator.validate(password: password, confirmedPassword: confirmedPassword)
            let signUpRequest = SignUpRequest(
                id: id,
                businessName: businessName,
                isPremium: isPremium,
                firstName: firstName,
                lastName: lastName,
                phone: phone,
                email: email,
                password: password,
                latitude: latitude,
                longitude: longitude,
                created: created
            )
            apiClient.execute(request: signUpRequest, answerType: User.self) { result in
                completionHandler(result)
            }
        } catch {
            completionHandler(.failure(error))
        }
    }
    
    func usersForLocation(
        latitude: Double,
        longitude: Double,
        radius: Int,
        completionHandler: @escaping (Result<[User], Error>) -> Void
    ) {
        let usersForLocationRequest = UsersForLocationRequest(
            latitude: latitude,
            longitude: longitude,
            radius: radius
        )
        apiClient.execute(request: usersForLocationRequest, answerType: [User].self) { result in
            completionHandler(result)
        }
    }
}

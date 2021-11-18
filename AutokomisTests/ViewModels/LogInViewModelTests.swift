//
//  LogInViewModelTests.swift
//  AutokomisTests
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import XCTest
@testable import Autokomis

class LogInViewModelTests: XCTestCase {

    let userDefaultsStorage = UserDefaultsStorage()

    var mockedApiClient: MockedAPIClient!
    var userInfoProvider: UserInfoProvider!
    var userService: UserService!
    var viewModel: LogInViewModel!

    override func setUp() {
        super.setUp()
        mockedApiClient = MockedAPIClient   ()
        userInfoProvider = StorageUserInfoProvider(accountStorage: userDefaultsStorage)
        userService = DefaultUserService(apiClient: mockedApiClient, userInfoProvider: userInfoProvider)
        viewModel = LogInViewModel(userService: userService, userInfoProvider: userInfoProvider)
    }

    override func tearDown() {
        mockedApiClient = nil
        userInfoProvider = nil
        userService = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testLogInEmptyEmailFail() {
        viewModel.logIn(email: "", password: "1234") { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testLogInInvalidEmailFail() {
        viewModel.logIn(email: "test", password: "1234") { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testLogInPasswordFail() {
        viewModel.logIn(email: "test@gmail.com", password: Optional<String>.none) { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testLogInNetworkCallFail() {
        mockedApiClient.shouldThrowError = true
        viewModel.logIn(email: "test@gmail.com", password: "1234") { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testLogInNetworkCallSuccess() {
        viewModel.logIn(email: "test@gmail.com", password: "1234") { [weak self] result in
            guard let `self` = self else { return }
            XCTAssertTrue(self.userInfoProvider.userId == User.mocked().id)
            XCTAssertTrue(self.userInfoProvider.businessName == User.mocked().businessName)
            XCTAssertTrue(self.userInfoProvider.isPremium == User.mocked().isPremium)
            XCTAssertTrue(self.userInfoProvider.firstName == User.mocked().firstName)
            XCTAssertTrue(self.userInfoProvider.lastName == User.mocked().lastName)
            XCTAssertTrue(self.userInfoProvider.phone == User.mocked().phone)
            XCTAssertTrue(self.userInfoProvider.email == User.mocked().email)
            XCTAssertTrue(self.userInfoProvider.latitude == User.mocked().latitude)
            XCTAssertTrue(self.userInfoProvider.longitude == User.mocked().longitude)
            XCTAssertTrue(self.userInfoProvider.created == User.mocked().created)
            XCTAssertNil(result)
        }
    }
}

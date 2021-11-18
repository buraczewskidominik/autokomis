//
//  StorageUserInfoProviderTests.swift
//  AutokomisTests
//
//  Created by Dominik Buraczewski on 11/08/2021.
//

import XCTest
@testable import Autokomis

class StorageUserInfoProviderTests: XCTestCase {

    let userDefaultsStorage = UserDefaultsStorage()
    
    var userInfoProvider: UserInfoProvider!

    override func setUp() {
        super.setUp()
        userInfoProvider = StorageUserInfoProvider(accountStorage: userDefaultsStorage)
    }

    override func tearDown() {
        userInfoProvider = nil
        super.tearDown()
    }
    
    func testIfUserIsSet() {
        insertUserData()
        
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
    }
    
    func testIfUserIsCleared() {
        insertUserData()
        
        userInfoProvider.clear()
        
        XCTAssertNil(self.userInfoProvider.userId)
        XCTAssertNil(self.userInfoProvider.businessName)
        XCTAssertFalse(self.userInfoProvider.isPremium)
        XCTAssertNil(self.userInfoProvider.firstName)
        XCTAssertNil(self.userInfoProvider.lastName)
        XCTAssertNil(self.userInfoProvider.phone)
        XCTAssertNil(self.userInfoProvider.email)
        XCTAssertNil(self.userInfoProvider.latitude)
        XCTAssertNil(self.userInfoProvider.longitude)
        XCTAssertNil(self.userInfoProvider.created)
    }
    
    private func insertUserData() {
        userInfoProvider.userId = User.mocked().id
        userInfoProvider.businessName = User.mocked().businessName
        userInfoProvider.isPremium = User.mocked().isPremium
        userInfoProvider.firstName = User.mocked().firstName
        userInfoProvider.lastName = User.mocked().lastName
        userInfoProvider.phone = User.mocked().phone
        userInfoProvider.email = User.mocked().email
        userInfoProvider.latitude = User.mocked().latitude
        userInfoProvider.longitude = User.mocked().longitude
        userInfoProvider.created = User.mocked().created
    }
}

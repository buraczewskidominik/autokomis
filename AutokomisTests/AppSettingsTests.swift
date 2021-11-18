//
//  AppSettingsTests.swift
//  AutokomisTests
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import XCTest
@testable import Autokomis

class AppSettingsTests: XCTestCase {
    
    var appSettings: AppSettings!

    override func setUp() {
        super.setUp()
        appSettings = AppSettings.shared
    }

    override func tearDown() {
        appSettings.launchStatus = LaunchStatus.newSession.rawValue
        super.tearDown()
    }
    
    func testLaunchStatusDefaultValue() {
        XCTAssert(appSettings.launchStatus == LaunchStatus.newSession.rawValue)
    }
    
    func testLaunchStatusIsSet() {
        appSettings.launchStatus = LaunchStatus.buyer.rawValue
        XCTAssert(appSettings.launchStatus == LaunchStatus.buyer.rawValue)
    }
}

//
//  CarCellViewModelTests.swift
//  AutokomisTests
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import XCTest
@testable import Autokomis

class CarCellViewModelTests: XCTestCase {

    var mockedCar: Car!
    var viewModel: CarCellViewModel!
    
    override func setUp() {
        super.setUp()
        mockedCar = Car.mocked()
        viewModel = CarCellViewModel(car: mockedCar)
    }

    override func tearDown() {
        mockedCar = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testCarFullName() {
        XCTAssert(viewModel.carFullName() == "VW Passat")
    }
    
    func testPetrolType() {
        XCTAssert(viewModel.petrolType() == "PB")
    }
}

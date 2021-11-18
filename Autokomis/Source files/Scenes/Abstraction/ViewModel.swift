//
//  ViewModel.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import Foundation

/// Protocol standarizing base viewModel's setup.
protocol ViewModelType {
    
    /// Standard method to create all data and setup properties in a viewModel.
    func createModel()
}

class ViewModel: ViewModelType {
    
    /// Default initializer performing all standard setup methods.
    init() {
        createModel()
    }
    
    /// Standard method to setup all viewModel's properties in subclasses. Called right after initialization.
    func createModel() {}
}

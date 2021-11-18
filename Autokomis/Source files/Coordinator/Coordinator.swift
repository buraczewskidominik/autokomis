//
//  Coordinator.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import Foundation

protocol Coordinator: AnyObject {
    
    /// Method triggered when new coordinator starts its life.
    func start()
    
    /// Childs presented by a coordinator. New value is added when one coordinator presents another one.
//    var childCoordinators: [Coordinator] { get set }
}

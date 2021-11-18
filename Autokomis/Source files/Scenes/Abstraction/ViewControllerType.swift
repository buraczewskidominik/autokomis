//
//  ViewControllerType.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import Foundation
import UIKit

/// Common interface for all ViewControllers in the application.
protocol ViewControllerType where Self: UIViewController {

    /// Marks if a default keyboard dismiss tap should be added. Defaults to true.
    var shouldAddKeyboardDismissTap: Bool { get }
}

/// Default implementations.
extension ViewControllerType {

    /// Marks if a default keyboard dismiss tap should be added. Defaults to true.
    var shouldAddKeyboardDismissTap: Bool {
        return true
    }
}

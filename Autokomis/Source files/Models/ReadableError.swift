//
//  ReadableError.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 10/08/2021.
//

import Foundation

protocol ReadableError: Error {
    
    var readable: String { get }
}

extension ReadableError {
    
    var readable: String {
        ""
    }
}

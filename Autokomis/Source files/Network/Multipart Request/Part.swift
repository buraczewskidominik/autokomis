//
//  Part.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

struct Part {

    let name: String

    let contentType: ContentType

    let value: Data

    enum ContentType {
        case jpeg
        case png
        var description: String {
            switch self {
            case .jpeg:
                return "image/jpeg"
            case .png:
                return "image/png"
            }
        }

        var fileExtension: String {
            switch self {
            case .jpeg:
                return ".jpg"
            case .png:
                return ".png"
            }
        }
    }
}

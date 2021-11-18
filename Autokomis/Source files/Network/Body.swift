//
//  Body.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

/// Represents body sent in the url request.
///
/// - json: compliant with application/json encoding.
enum Body {

    case json(body: [String: Any])
    case formData(parts: [Part], boundary: String)

    // MARK: Properties

    /// Returns the body encoded into data.
    var httpBody: Data? {
        switch self {
        case let .json(body):
            return Body.createJson(body: body)
        case let .formData(parts: parts, boundary: boundary):
            return Body.createMultipart(parts: parts, boundary: boundary)
        }
    }

    // MARK: Private methods

    private static func createJson(body: [String: Any]) -> Data? {
        try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
    }

    private static func createMultipart(parts: [Part], boundary: String) -> Data {
        var body = Data()
        let lineBreak = "\r\n"
        let boundaryPrefix = "--\(boundary)\(lineBreak)"
        parts.forEach { part in
            body.append(boundaryPrefix)
            body.append("Content-Disposition: form-data; name=\"\(part.name)\"; filename=\"\(part.name)\(part.contentType.fileExtension)\"\(lineBreak)")
            body.append("Content-Type: \(part.contentType.description)\(lineBreak)\(lineBreak)")
            body.append(part.value)
            body.append(lineBreak)
        }
        body.append("--\(boundary)--\(lineBreak)")
        return body
    }
}

private extension Data {

    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding, allowLossyConversion: false) {
            append(data)
        }
    }
}

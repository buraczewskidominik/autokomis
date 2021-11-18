//
//  Request.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

/// Represents an api request.
protocol Request: URLRequestConvertible {
    /// Scheme used by this request.
    var scheme: String { get }
    /// Base path against which url should be resolved.
    var basePath: String { get }
    /// Path of the api which is used. Might include e.g. versioning.
    var apiPath: String { get }
    /// Path of the method which is called.
    var path: String { get }
    /// HTTP method used by this request.
    var method: HTTPMethod { get }
    /// Body associated with this request.
    var body: Body? { get }
    /// Url parameters associated with this request.
    var parameters: [String: String]? { get }
    /// Custom headers associated with this request.
    var headers: [String: String]? { get }
    /// Specifies if request is already percent encoded when created. Fixes wrong encoding for + and @.
    var isPercentEncoded: Bool { get }
}

/// Defines default values for some of the properties.
extension Request {
    var scheme: String {
        "http://"
    }
    
    var basePath: String {
        "redspinapps.com/"
    }

    var apiPath: String {
        "/autokomis/api/"
    }

    var headers: [String: String]? {
        body.flatMap {
            switch $0 {
            case .json:
                return [
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                ]
            case let .formData(parts: _, boundary: boundary):
                return [
                    "Content-Type": "multipart/form-data; boundary=\(boundary)",
                    "Accept": "*/*"
                ]
            }
        }
    }

    var body: Body? {
        nil
    }

    var parameters: [String: String]? {
        nil
    }

    var isPercentEncoded: Bool {
        false
    }
}

// MARK: Conformance to URLRequestConvertible protocol.

extension URLRequestConvertible where Self: Request {
    func asURLRequest() -> URLRequest {
        let urlPath = scheme
            .appending(basePath)
            .appending(apiPath)
            .appending(path)

        var components = URLComponents(string: urlPath)
        if let parameters = parameters, !parameters.isEmpty {
            let queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: value)
            }
            if isPercentEncoded {
                components?.percentEncodedQueryItems = queryItems
            } else {
                components?.queryItems = queryItems
            }
        }
        guard let url = components?.url else {
            fatalError("Could not initialize URL for path: \(urlPath)")
        }
        var urlRequest = URLRequest(url: url)

        if let body = body?.httpBody {
            urlRequest.httpBody = body
            urlRequest.setValue("\(body.count)", forHTTPHeaderField: "Content-Length")
        }

        headers?.forEach {
            urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}

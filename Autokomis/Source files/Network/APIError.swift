//
//  APIError.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

/// Common api error encountered throughout the app.
///
/// - malformedResponseJson:  indicates that string received in the response couldn't been parsed.
/// - clientError: infidicates the error on the client's side.
/// - authorizationFailed: indicates that authorization failed.
/// - unauthorizedAction: action has not been authorized.
/// - resourceNotFound: resource has not been found.
/// - expectationMismatch: data mismatch.
/// - incorrectIdentificationStatus: the identification status was not allowed to proceed with the action.
/// - unprocessableEntity: data invalid or expired.
/// - internalServerError: indicates the internal server error.
/// - unknownError: indicates that api client encountered an error not listed above.
enum APIError: ReadableError {
    case malformedResponseJson
    case clientError
    case authorizationFailed
    case unauthorizedAction
    case resourceNotFound
    case expectationMismatch
    case incorrectIdentificationStatus
    case unprocessableEntity
    case internalServerError
    case unknownError
    case locationAccessError
    case emptyResponse
    
    var readable: String {
        "Network call error."
    }
}

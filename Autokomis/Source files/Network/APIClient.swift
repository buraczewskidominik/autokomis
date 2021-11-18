//
//  APIClient.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import Foundation

protocol APIClient: AnyObject {
    
    func execute<DataType: Decodable>(
        request: Request,
        answerType: DataType.Type,
        completion: @escaping (Result<DataType, Error>) -> Void
    )
}

final class DefaultAPIClient: NSObject, APIClient {
    
    // MARK: Private properties

    private let defaultUrlSession = URLSession(configuration: .default)

    // MARK: Methods

    /// Executes url request.
    ///
    /// - Parameters:
    ///   - request: request to be performed.
    ///   - dataType: data type of the response.
    ///   - completion: the completion handler with the response.
    func execute<DataType: Decodable>(
        request: Request,
        answerType: DataType.Type,
        completion: @escaping (Result<DataType, Error>) -> Void
    ) {
        let urlRequest = request.asURLRequest()
        let task = defaultUrlSession.dataTask(with: urlRequest) { [weak self] data, urlResponse, error in
            if error != nil {
                completion(.failure(APIError.unknownError))
            }
            
            if let self = self,
               let response = urlResponse as? HTTPURLResponse,
               let data = data {
                completion(self.mapResponse(response: response, data: data))
            }
        }
        task.resume()
    }
    
    // MARK: Private methods
    
    private func mapResponse<DataType: Decodable>(response: HTTPURLResponse, data: Data) -> Result<DataType, Error> {
        switch response.statusCode {
        case 200:
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode(DataType.self, from: data) {
                return .success(decodedData)
            } else {
                return .failure(APIError.malformedResponseJson)
            }
        case 400:
            return .failure(APIError.clientError)
        case 401:
            return .failure(APIError.authorizationFailed)
        case 403:
            return .failure(APIError.unauthorizedAction)
        case 404:
            return .failure(APIError.resourceNotFound)
        case 409:
            return .failure(APIError.expectationMismatch)
        case 412:
            return .failure(APIError.incorrectIdentificationStatus)
        case 422:
            return .failure(APIError.unprocessableEntity)
        case 500:
            return .failure(APIError.internalServerError)
        default:
            return .failure(APIError.unknownError)
        }
    }
}

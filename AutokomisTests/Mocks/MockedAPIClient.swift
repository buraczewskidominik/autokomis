//
//  MockedAPIClient.swift
//  AutokomisTests
//
//  Created by Dominik Buraczewski on 10/08/2021.
//

import Foundation
@testable import Autokomis

final class MockedAPIClient: APIClient {
    
    var shouldThrowError: Bool = false
    
    private let user = User.mocked()
    
    func execute<DataType: Decodable>(
        request: Request,
        answerType: DataType.Type,
        completion: @escaping (Result<DataType, Error>) -> Void
    ) {
        if shouldThrowError {
            completion(.failure(APIError.clientError))
        } else {
            let encoder = JSONEncoder()
            guard let data = try? encoder.encode(user) else {
                completion(.failure(APIError.malformedResponseJson))
                return
            }
            
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode(DataType.self, from: data) {
                completion(.success(decodedData))
            } else {
                completion(.failure(APIError.malformedResponseJson))
            }
        }
    }
}

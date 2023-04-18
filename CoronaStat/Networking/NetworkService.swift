//
//  NetworkService.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 17/04/23.
//

import Foundation

typealias CompletionHandler<T: Decodable> = (Result<T, Error>) -> Void

protocol NetworkServiceProtocol {
    func execute<T: Decodable>(networkConfig: NetworkConfigurable, type: T.Type) async throws -> T
}

final class NetworkService: NetworkServiceProtocol {

    private let session: URLSession
    private let requestGenerator: NeworkRequestProtocol
    
    init(session: URLSession, requestGenerator: NeworkRequestProtocol) {
        self.session = session
        self.requestGenerator = requestGenerator
    }
    
    convenience init(session: URLSession = .shared) {
        self.init(session: session, requestGenerator: NeworkRequest())
    }
    
    func execute<T: Decodable>(networkConfig: NetworkConfigurable,type: T.Type) async throws -> T {
        guard let urlRequest = try? requestGenerator.createURLRequest(with: networkConfig) else {
            throw NetworkError.invalidRequest
        }
        
        do {
            let (data, response) = try await session.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200 else {
                throw NetworkError.failed
            }
            
            guard let result = try? JSONDecoder().decode(type.self, from: data) else {
                throw NetworkError.unableToDecode
            }
            
            return result
        } catch  {
            throw error
        }
    }
}

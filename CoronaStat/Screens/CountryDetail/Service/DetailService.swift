//
//  DetailService.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 18/04/23.
//

import Foundation
protocol DetailServiceProtocol: AnyObject {
    func fetchDetail(countryName: String) async throws -> Detail
}

final class DetailService: DetailServiceProtocol {
    // MARK: - Private Properties
    private let networkService: NetworkServiceProtocol
    
    // MARK: - init
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    // MARK: - Protocol Function
    func fetchDetail(countryName: String) async throws -> Detail {
        do {
            let networkConfig = NetworkConfig(path: UrlEnum.statistics, method: .get, queryParameters: [UrlEnum.queryKey: countryName])
            let result =  try await networkService.execute(networkConfig: networkConfig, type: Detail.self)
            return result
        } catch {
            throw error
        }
    }
}

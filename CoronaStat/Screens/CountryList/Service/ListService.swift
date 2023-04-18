//
//  ListService.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 18/04/23.
//

import Foundation
import SwiftUI

// MARK: - Protocol
protocol ListServiceProtocol: AnyObject {
    func fetchList() async throws -> Countries
}

final class ListService: ListServiceProtocol {
    
    // MARK: - Private Properties
    private let networkService: NetworkServiceProtocol
    
    // MARK: - init
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    // MARK: - Protocol Function
    func fetchList() async throws -> Countries {
        do {
            let networkConfig = NetworkConfig(path: UrlEnum.countries, method: .get)
            let result =  try await networkService.execute(networkConfig: networkConfig, type: Countries.self)
            return result
        } catch {
            throw error
        }
    }
}

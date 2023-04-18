//
//  DetailViewModel.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 18/04/23.
//

import Foundation

protocol DetailViewModelProtocol {
    func fetchDetail()
}

final class DetailViewModel: ObservableObject, DetailViewModelProtocol {
    // MARK: - Properties
    @Published var detailEntity: DetailEntity = DetailEntity()
    @Published var isEnabled = false
    let countryName: String
    
    // MARK: - Private Properties
    private let service: DetailServiceProtocol
    
    // MARK: - init
    init(service: DetailServiceProtocol = DetailService(), countryName: String) {
        self.service = service
        self.countryName = countryName
    }
    
    func fetchDetail() {
        Task {
            do {
                let detail = try await service.fetchDetail(countryName: countryName)
                DispatchQueue.main.async {
                    self.detailEntity = DetailMapper().getDetailEntity(responseModel: detail)
                }
            } catch let error {
                AlertHelper.shared.handleError(error: error)
                DispatchQueue.main.async {
                    self.isEnabled = true
                }
            }
        }
    }
}

//
//  CountryViewModel.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 17/04/23.
//

import Foundation

protocol CountryViewModelProtocol {
    func fetchList()
    func filterList(for searchText: String)
}

final class CountryViewModel: ObservableObject, CountryViewModelProtocol {
    
    @Published var isEnabled = false
    @Published var countryEntity: CountriesEntity = CountriesEntity()
    // MARK: - Private Properties
    private let service: ListServiceProtocol
    
    // MARK: - init
    init(service: ListServiceProtocol = ListService()) {
        self.service = service
    }
    
    func fetchList() {
        Task {
            do {
                let list = try await service.fetchList()
                DispatchQueue.main.async {
                    self.countryEntity = CountriesMapper().getCountriesEntity(responseModel: list)
                }
            } catch let error {
                AlertHelper.shared.handleError(error: error)
                DispatchQueue.main.async {
                    self.isEnabled = true
                }
            }
        }
    }
    
    func filterList(for searchText: String) {
        //
    }
}

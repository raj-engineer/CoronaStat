//
//  CountriesMapper.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 18/04/23.
//

import Foundation
protocol CountriesMapperProtocol {
    func getCountriesEntity(responseModel: Countries) -> CountriesEntity
}

struct CountriesMapper: CountriesMapperProtocol {
    
    func getCountriesEntity(responseModel: Countries) -> CountriesEntity {
        guard let response = responseModel.response else { return CountriesEntity() }
        return CountriesEntity(countryNames: response)
    }
}

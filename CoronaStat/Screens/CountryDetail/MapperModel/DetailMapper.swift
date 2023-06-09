//
//  DetailMapper.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 18/04/23.
//

import Foundation
protocol DetailMapperProtocol {
    func getDetailEntity(responseModel: Detail) -> DetailEntity
}

struct DetailMapper: DetailMapperProtocol {
    
    func getDetailEntity(responseModel: Detail) -> DetailEntity {
        guard let object = responseModel.response?.first else { return DetailEntity() }
        var mapperModel = DetailEntity()
        if let confirmed = object.cases?.total {
            mapperModel.confirmed = String(confirmed)
        }
        
        if let deceased = object.deaths?.total {
            mapperModel.deceased = String(deceased)
        }
        
        if let recovered = object.cases?.recovered {
            mapperModel.recovered = String(recovered)
        }
        
        return mapperModel
    }
}

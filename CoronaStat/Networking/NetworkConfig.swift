//
//  NetworkConfig.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 17/04/23.
//

import Foundation
enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

protocol NetworkConfigurable {
    var url: String {get set}
    var path: String { get set }
    var method: HTTPMethod { get set }
    var headerParamaters: [String: String] { get set }
    var queryParameters: [String: Any] { get set }
    var bodyParamaters: [String: Any] { get set }
}

final class NetworkConfig: NetworkConfigurable {
    var url: String
    var path: String
    var method: HTTPMethod
    var headerParamaters: [String: String]
    var queryParameters: [String: Any]
    var bodyParamaters: [String: Any]
   
    init( url: String = "",
        path: String = "",
         method: HTTPMethod,
         headerParamaters: [String: String] = [:],
         queryParameters: [String: Any] = [:],
         bodyParamaters: [String: Any] = [:]) {
        self.url = url
        self.path = path
        self.method = method
        self.headerParamaters = headerParamaters
        self.queryParameters = queryParameters
        self.bodyParamaters = bodyParamaters
    }
}

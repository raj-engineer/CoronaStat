//
//  DetailModel.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 17/04/23.
//

import Foundation
struct Detail: Decodable {
    let get : String?
    let response : [Response]?
    let results : Int?
    
}
struct Response: Decodable {
    let country :  String
    let cases : Cases?
    let deaths : Deaths?
}

struct Cases : Decodable {
      let total : Int?
      let recovered : Int?
      let new : String?
      let active : Int?
  }
struct Deaths : Decodable {
    let new : String?
    let total : Int?
}

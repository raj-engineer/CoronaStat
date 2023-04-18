//
//  Constants.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 17/04/23.
//

import Foundation

enum UrlEnum {
    // Host
    static let host = "covid-193.p.rapidapi.com"
    // path
    static let statistics = "/statistics"
    static let countries = "/countries"
    // Optional- Query Component Key
    static let queryKey = "country"
}

enum keys {
    static let rapidHeaders = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "yUDMsYUkOtmshDZad5laozt4Hx3Wp11A5GHjsnJHCJTFMWmnGn"
    ]
}

enum Alerts {
    static let alertTitle = "Error"
    static let okTitle = "OK"
    static let dismissTitle = "Dismiss"
}

enum ScreenTitle {
    static let Home = "Countries"
}

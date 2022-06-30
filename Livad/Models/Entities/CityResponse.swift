//
//  CityResponse.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/29/22.
//
//
//import Foundation
//
//// MARK: - Welcome
//struct CityResponse: Codable {
//    let cities: [Int: City]
//    let citiesArray: [CitiesArray]
//
//    enum CodingKeys: String, CodingKey {
//        case cities
//        case citiesArray = "cities_array"
//    }
//}
//
//// MARK: - Cities
////struct Cities: Codable {
////    let id: City
////}
//
//// MARK: - City
//struct City: Codable {
//    let id: Int
//    let name: String
//    let countryID, stateID: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case countryID = "country_id"
//        case stateID = "state_id"
//    }
//}
//
//// MARK: - CitiesArray
//struct CitiesArray: Codable {
//    let value: Int
//    let label: String
//}


import Foundation

// MARK: - Welcome
struct CityResponse: Codable {
//    let cities: [Int: City]
    let citiesArray: [CitiesArray]

    enum CodingKeys: String, CodingKey {
//        case cities
        case citiesArray = "cities_array"
    }
}


// MARK: - ID
struct City: Codable {
    let id: Int
    let name: String
    let countryID, stateID: Int
    enum CodingKeys: String, CodingKey {
        case id, name
        case countryID = "country_id"
        case stateID = "state_id"
    }
}

// MARK: - CitiesArray
struct CitiesArray: Codable {
    let value: Int
    let label: String
}

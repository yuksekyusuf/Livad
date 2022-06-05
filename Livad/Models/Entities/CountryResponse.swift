//
//  Countries.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/2/22.
//

import Foundation

struct CountryResponse: Codable {
    let countries: [String: Country]
    let countriesArray: [CountriesArray]

    enum CodingKeys: String, CodingKey {
        case countries
        case countriesArray = "countries_array"
    }
}

struct Country: Codable {
    let id, name: String
    let phoneCode: Int
    let currencyID, continent: String
    let flag: String
    let currencySign: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case phoneCode = "phone_code"
        case currencyID = "currency_id"
        case continent, flag
        case currencySign = "currency_sign"
    }
}

// MARK: - CountriesArray
struct CountriesArray: Codable {
    let value, label: String
}

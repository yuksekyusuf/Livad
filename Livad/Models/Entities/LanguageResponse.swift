//
//  LanguageResponse.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/5/22.
//

import Foundation



// MARK: - Welcome
struct LanguageResponse: Codable {
    let languages: [Language]
}

// MARK: - Language
class Language: Codable {
    let id, name, nativeName: String
//    let minBudget: Int?
//    let minCPVBid, minCPCBid: Double?
    let currencyID: String?
    let flagURL: String
//    let businessAvailable: Int
    var isSelected: Bool = false

    init(id: String, name: String, nativeName: String, currenctID: String?, flagURL: String, isSelected: Bool) {
        self.id = id
        self.name = name
        self.currencyID = currenctID
        self.flagURL = flagURL
        self.isSelected = isSelected
        self.nativeName = nativeName
    }
    enum CodingKeys: String, CodingKey {
        case id, name
        case nativeName = "native_name"
//        case minBudget = "min_budget"
//        case minCPVBid = "min_CPV_bid"
//        case minCPCBid = "min_CPC_bid"
        case currencyID = "currency_id"
        case flagURL = "flag_url"
//        case businessAvailable = "business_available"
    }
}


//class SoftwareModel {
//    let name: String
//    var isSelected: Bool = false
//    init(_ name: String) {
//        self.name = name
//    }
//}

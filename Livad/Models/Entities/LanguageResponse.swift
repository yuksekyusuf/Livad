//
//  LanguageResponse.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/5/22.
//

import Foundation



class Language: Codable {
    let id, name, nativeName: String
    let minBudget, minCPVBid, minCPCBid: Int
    let currencyID, flagURL: String
    let bussinessAvailable: Int
    var isSelected: Bool = false

    enum CodingKeys: String, CodingKey {
        case id, name
        case nativeName = "native_name"
        case minBudget = "min_budget"
        case minCPVBid = "min_CPV_bid"
        case minCPCBid = "min_CPC_bid"
        case currencyID = "currency_id"
        case flagURL = "flag_url"
        case bussinessAvailable = "bussiness_available"
    }
    
}

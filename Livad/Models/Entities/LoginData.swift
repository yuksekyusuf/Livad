//
//  LoginData.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/31/22.
//

import Foundation

struct LoginData: Codable, Identifiable {
        let id: String
        let linkToLogo: String
        let title: String
        let settingsRequired: Bool
        let createdDate: String
        let isAdmin: Bool
        let languagePreference, currencyID, currencySign, platform: String
        let signupCompleted: Int

        enum CodingKeys: String, CodingKey {
            case id = "streamer_id"
            case linkToLogo = "link_to_logo"
            case title
            case settingsRequired = "settings_required"
            case createdDate = "created_date"
            case isAdmin = "is_admin"
            case languagePreference = "language_preference"
            case currencyID = "currency_id"
            case currencySign = "currency_sign"
            case platform
            case signupCompleted = "signup_completed"
        }
}

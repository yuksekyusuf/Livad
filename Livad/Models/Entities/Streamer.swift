//
//  Setting.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/31/22.
//

import Foundation
import JWTDecode

struct Streamer: Codable {
    var firstName, lastName, contactEmail, phone: String
    var discordUsername, broadcastingLanguage, broadcastingLanguageID, gender: String
    var country, instagramUsername, twitterUsername, city: String
    var birthDate, broadcastingSoftware, languagePreference, countryID: String
    var phoneCode, genderDetail: String
    var setupPreviewConfirmed: Int
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case contactEmail = "contact_email"
        case phone
        case discordUsername = "discord_username"
        case broadcastingLanguage = "broadcasting_language"
        case broadcastingLanguageID = "broadcasting_language_id"
        case gender, country
        case instagramUsername = "instagram_username"
        case twitterUsername = "twitter_username"
        case city
        case birthDate = "birth_date"
        case broadcastingSoftware = "broadcasting_software"
        case languagePreference = "language_preference"
        case countryID = "country_id"
        case phoneCode = "phone_code"
        case genderDetail = "gender_detail"
        case setupPreviewConfirmed = "setup_preview_confirmed"
    }
}

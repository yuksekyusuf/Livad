//
//  Setting.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/31/22.
//

import Foundation
import JWTDecode

struct Streamer: Codable {
    let firstName, lastName, contactEmail, phone: String
    let discordUsername, broadcastingLanguage, broadcastingLanguageID, gender: String
    let country, instagramUsername, twitterUsername, city: String
    let birthDate, broadcastingSoftware, languagePreference, countryID: String
    let phoneCode, genderDetail: String
    let setupPreviewConfirmed: Int
    
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
